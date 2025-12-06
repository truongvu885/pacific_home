<?php
/************************************************************************
 * File: custom/Espo/Custom/Services/CallioIntegration.php
 * Service xử lý logic tích hợp với Callio (phonenet.io)
 ************************************************************************/

namespace Espo\Custom\Services;

use Espo\Core\Exceptions\Error;
use Espo\Core\Exceptions\Forbidden;
use Espo\Core\Utils\Config;
use Espo\Core\Utils\Log;
use Espo\ORM\EntityManager;

class CallioIntegration
{
    private $entityManager;
    private $config;
    private $log;
    
    private $apiUrl = 'https://clientapi.phonenet.io';
    private $enabled;
    private $masterEmail;
    private $masterPassword;
    
    // Cache token để tránh gọi API nhiều lần
    private $tokenCache = [];
    
    public function __construct(
        EntityManager $entityManager,
        Config $config,
        Log $log
    ) {
        $this->entityManager = $entityManager;
        $this->config = $config;
        $this->log = $log;
        
        // Load cấu hình Callio
        $this->enabled = $config->get('callioEnabled', false);
        $this->masterEmail = $config->get('callioMasterEmail');
        $this->masterPassword = $config->get('callioMasterPassword');
        $this->apiUrl = $config->get('callioApiUrl', $this->apiUrl);
    }
    
    /**
     * Lấy token cho user
     */
    public function getUserToken(array $params): array
    {
        if (!$this->enabled) {
            throw new Error('Callio integration is not enabled');
        }
        
        $userId = $params['userId'];
        
        // First, try persisted token in user preferences (token cache persistent across requests)
        try {
            $prefs = $this->entityManager->getEntityById('Preferences', $userId);
        } catch (\Exception $e) {
            $prefs = null;
        }

        if ($prefs) {
            $storedToken = $prefs->get('callioToken');
            $storedExpires = (int)($prefs->get('callioTokenExpires') ?: 0);
            if (!empty($storedToken) && $storedExpires > time()) {
                // Populate in-request cache and return
                $this->tokenCache[$userId] = ['token' => $storedToken, 'expires' => $storedExpires];

                return [
                    'success' => true,
                    'token' => $storedToken
                ];
            }
        }
        
        $user = $this->entityManager->getEntity('User', $userId);
        if (!$user) {
            throw new Error('User not found');
        }
        
        // Lấy thông tin Callio user từ user entity
        // If user has a specific Callio email, use it; otherwise use master callio email per change request
        $callioEmail = $user->get('callioEmail') ?: $this->masterEmail;
        $callioPassword = $user->get('callioPassword');
        
        // Nếu user chưa có tài khoản Callio riêng, dùng master account
        if (!$callioPassword) {
            $callioEmail = $this->masterEmail;
            $callioPassword = $this->masterPassword;
        }
        
        // Gọi API login để lấy token
        $response = $this->callCallioApi('/auth/login', 'POST', [
            'email' => $callioEmail,
            'password' => $callioPassword
        ]);
        
        if ($response['success'] && !empty($response['data']['token'])) {
            $token = $response['data']['token'];
            
            // Cache token in memory for current request
            $this->tokenCache[$userId] = [
                'token' => $token,
                'expires' => time() + 3600 // 1 hour
            ];

            // Persist token in user preferences so it survives across requests
            try {
                if (!$prefs) {
                    $prefs = $this->entityManager->getEntityById('Preferences', $userId);
                }

                if ($prefs) {
                    $prefs->set('callioToken', $token);
                    $prefs->set('callioTokenExpires', time() + 3600);
                    $this->entityManager->saveEntity($prefs);
                }
            } catch (\Exception $e) {
                // Log but do not fail token retrieval if saving preferences fails
                $this->log->error('Callio: Failed to persist token in preferences', ['userId' => $userId, 'error' => $e->getMessage()]);
            }
            
            return [
                'success' => true,
                'token' => $token
            ];
        }
        
        throw new Error('Failed to get Callio token: ' . ($response['error'] ?? 'Unknown error'));
    }
    
    /**
     * Thực hiện cuộc gọi qua Callio (chỉ gọi, không tạo Call record)
     */
    public function makeCall(array $params): array
    {
        if (!$this->enabled) {
            throw new Error('Callio integration is not enabled');
        }
        
        $phoneNumber = $this->normalizePhoneNumber($params['phoneNumber']);
        $userId = $params['userId'];
        
        // Lấy token cho user
        $tokenResult = $this->getUserToken(['userId' => $userId]);
        $token = $tokenResult['token'];
        
        // Lấy thông tin user
        $user = $this->entityManager->getEntity('User', $userId);
        if (!$user) {
            throw new Error('User not found');
        }
        
        // Gọi Callio để thực hiện cuộc gọi
        $callData = [
            'phone' => $phoneNumber,
            'metadata' => [
                'crm_user_id' => $userId,
                'crm_user_name' => $user->get('name'),
                'timestamp' => date('Y-m-d H:i:s')
            ]
        ];
        
        // Gọi API Callio để make call
        $response = $this->callCallioApi('/calls/make', 'POST', $callData, $token);
        
        if ($response['success']) {
            $this->log->info('Callio: Call initiated successfully', [
                'phone' => $phoneNumber,
                'user' => $userId,
                'callId' => $response['data']['id'] ?? null
            ]);
            
            return [
                'success' => true,
                'message' => 'Call initiated',
                'callId' => $response['data']['id'] ?? null,
                'data' => $response['data']
            ];
        } else {
            $this->log->error('Callio: Failed to make call', [
                'phone' => $phoneNumber,
                'error' => $response['error'] ?? 'Unknown error'
            ]);
            
            throw new Error($response['error'] ?? 'Failed to make call');
        }
    }

    /**
     * Trả về trạng thái cấu hình cho controller/admin UI
     *
     * @return array
     */
    public function getConfigStatus(): array
    {
        return [
            'enabled' => (bool)$this->enabled,
            'apiUrl' => $this->apiUrl,
            'hasMasterCredentials' => (!empty($this->masterEmail) && !empty($this->masterPassword)),
            'masterEmail' => $this->masterEmail ? $this->masterEmail : null
        ];
    }
    
    /**
     * Xử lý webhook từ Callio
     */
    public function handleWebhook(array $data): array
    {
        // Validate payload
        if (empty($data) || !is_array($data)) {
            throw new Error('Invalid webhook payload');
        }

        $eventType = $data['event'] ?? $data['type'] ?? null;
        $callData = $data['call'] ?? $data;
        
        $this->log->info('Callio: Webhook received', [
            'event' => $eventType,
            'data' => $callData
        ]);
        
        // Xử lý các event khác nhau
        try {
            switch ($eventType) {
            case 'call.started':
            case 'call_started':
                $this->handleCallStarted($callData);
                break;
                
            case 'call.answered':
            case 'call_answered':
                $this->handleCallAnswered($callData);
                break;
                
            case 'call.ended':
            case 'call_ended':
                $this->handleCallEnded($callData);
                break;
                
            case 'call.failed':
            case 'call_failed':
                $this->handleCallFailed($callData);
                break;
                
                default:
                    // Nếu không có event type, có thể là webhook update call
                    $this->handleCallUpdate($callData);
            }
        } catch (\Exception $e) {
            $this->log->error('Callio: error handling webhook', ['error' => $e->getMessage(), 'payload' => $data]);
            throw new Error('Webhook handling failed: ' . $e->getMessage());
        }
        
        return ['success' => true];
    }
    
    /**
     * Lấy lịch sử cuộc gọi từ CRM (không phải từ Callio API)
     */
    public function getCallHistory(array $params): array
    {
        // DEPRECATED: Feature disabled as Call records are no longer created
        return [
            'success' => false,
            'message' => 'Call history tracking is disabled'
        ];
    }
    
    /**
     * Lấy lịch sử cuộc gọi từ Callio API
     * 
     * @param array $params {
     *     @type string $userId User ID
     *     @type int $limit Số lượng records (mặc định 50)
     *     @type int $offset Offset
     *     @type string $dateFrom Date from (format: Y-m-d H:i:s)
     *     @type string $dateTo Date to (format: Y-m-d H:i:s)
     *     @type string $status Filter by status (initiated, ongoing, completed, failed)
     *     @type string $phoneNumber Filter by phone number (optional)
     * }
     */
    public function getCallHistoryFromCallio(array $params): array
    {
        if (!$this->enabled) {
            throw new Error('Callio integration is not enabled');
        }
        
        $userId = $params['userId'];
        $limit = $params['limit'] ?? 50;
        $offset = $params['offset'] ?? 0;
        $dateFrom = $params['dateFrom'] ?? null;
        $dateTo = $params['dateTo'] ?? null;
        $status = $params['status'] ?? null;
        $phoneNumber = $params['phoneNumber'] ?? null;
        
        try {
            // Lấy token
            $tokenResult = $this->getUserToken(['userId' => $userId]);
            $token = $tokenResult['token'];
            
            // Prepare query params
            $queryParams = [
                'limit' => $limit,
                'offset' => $offset
            ];
            
            if ($dateFrom) {
                $queryParams['from'] = $dateFrom;
            }
            
            if ($dateTo) {
                $queryParams['to'] = $dateTo;
            }
            
            if ($status) {
                $queryParams['status'] = $status;
            }
            
            if ($phoneNumber) {
                $queryParams['phone'] = $this->normalizePhoneNumber($phoneNumber);
            }
            
            // Gọi API để lấy lịch sử cuộc gọi
            $response = $this->callCallioApi('/calls', 'GET', $queryParams, $token);
            
            if ($response['success']) {
                // Format response data
                $calls = [];
                $data = $response['data'];
                
                // Handle different response formats
                if (is_array($data)) {
                    if (isset($data['data'])) {
                        $calls = $data['data'];
                    } elseif (isset($data['calls'])) {
                        $calls = $data['calls'];
                    } else {
                        $calls = $data;
                    }
                }
                
                // Transform call data to standard format
                $formattedCalls = array_map(function($call) {
                    return [
                        'id' => $call['id'] ?? $call['call_id'] ?? null,
                        'phoneNumber' => $call['phone'] ?? $call['phone_number'] ?? null,
                        'status' => $call['status'] ?? null,
                        'duration' => $call['duration'] ?? 0,
                        'dateStart' => $call['created_at'] ?? $call['start_time'] ?? null,
                        'dateEnd' => $call['ended_at'] ?? $call['end_time'] ?? null,
                        'recordingUrl' => $call['recording_url'] ?? $call['recordingUrl'] ?? null,
                        'notes' => $call['notes'] ?? null,
                        'metadata' => $call['metadata'] ?? []
                    ];
                }, $calls);
                
                $this->log->info('Callio: Retrieved call history', [
                    'userId' => $userId,
                    'count' => count($formattedCalls)
                ]);
                
                return [
                    'success' => true,
                    'data' => $formattedCalls,
                    'total' => $data['total'] ?? count($formattedCalls),
                    'limit' => $limit,
                    'offset' => $offset
                ];
            } else {
                $this->log->error('Callio: Failed to get call history', [
                    'userId' => $userId,
                    'error' => $response['error'] ?? 'Unknown error'
                ]);
                
                throw new Error('Failed to retrieve call history: ' . ($response['error'] ?? 'Unknown error'));
            }
        } catch (\Exception $e) {
            $this->log->error('Callio: Exception getting call history', [
                'userId' => $userId,
                'error' => $e->getMessage()
            ]);
            
            throw $e;
        }
    }
    
    /**
     * Kiểm tra trạng thái kết nối
     */
    public function checkStatus(): array
    {
        if (!$this->enabled) {
            return [
                'enabled' => false,
                'message' => 'Callio integration is disabled'
            ];
        }
        
        if (empty($this->masterEmail) || empty($this->masterPassword)) {
            return [
                'enabled' => true,
                'connected' => false,
                'message' => 'Callio credentials not configured'
            ];
        }
        
        // Test login
        try {
            $response = $this->callCallioApi('/auth/login', 'POST', [
                'email' => $this->masterEmail,
                'password' => $this->masterPassword
            ]);
            
            return [
                'enabled' => true,
                'connected' => $response['success'],
                'message' => $response['success'] ? 'Connected to Callio' : 'Connection failed',
                'data' => $response['data'] ?? null
            ];
        } catch (\Exception $e) {
            return [
                'enabled' => true,
                'connected' => false,
                'message' => 'Connection error: ' . $e->getMessage()
            ];
        }
    }
    
    /**
     * Gọi Callio API
     */
    private function callCallioApi(string $endpoint, string $method = 'GET', array $data = [], ?string $token = null): array
    {
        $url = rtrim($this->apiUrl, '/') . '/' . ltrim($endpoint, '/');
        
        $ch = curl_init();
        
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        
        $headers = [
            'Content-Type: application/json',
            'Accept: application/json'
        ];
        
        if ($token) {
            $headers[] = 'Authorization: Bearer ' . $token;
        }
        
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        
        if ($method === 'POST') {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        } elseif ($method === 'GET' && !empty($data)) {
            $url .= '?' . http_build_query($data);
            curl_setopt($ch, CURLOPT_URL, $url);
        }
        
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        
        curl_close($ch);
        
        if ($error) {
            $this->log->error('Callio: curl error', ['url' => $url, 'error' => $error]);

            return [
                'success' => false,
                'error' => $error,
                'httpCode' => $httpCode
            ];
        }
        
        $responseData = json_decode($response, true);
        
        if ($httpCode >= 200 && $httpCode < 300) {
            return [
                'success' => true,
                'data' => $responseData
            ];
        }

        $message = 'API request failed';
        if (is_array($responseData)) {
            $message = $responseData['message'] ?? $responseData['error'] ?? $message;
        } else {
            // Non-JSON response body
            $message = substr($response, 0, 1024);
        }

        $this->log->error('Callio: API returned non-success', ['url' => $url, 'httpCode' => $httpCode, 'response' => is_array($responseData) ? $responseData : $response]);

        return [
            'success' => false,
            'error' => $message,
            'data' => $responseData,
            'httpCode' => $httpCode,
        ];
    }
    
    /**
     * Tạo Call record trong CRM
     */
    private function createCallRecord(array $params, array $callioData)
    {
        // DEPRECATED: Not used anymore as we don't create Call records for simple click-to-call
    }
    
    /**
     * Xử lý các webhook events
     */
    private function handleCallStarted($data): void
    {
        $callId = $data['id'] ?? $data['call_id'] ?? null;
        
        if ($callId) {
            $call = $this->findCallByCallioId($callId);
            if ($call) {
                $call->set('status', 'Held');
                $this->entityManager->saveEntity($call);
            }
        }
    }
    
    private function handleCallAnswered($data): void
    {
        $callId = $data['id'] ?? $data['call_id'] ?? null;
        
        if ($callId) {
            $call = $this->findCallByCallioId($callId);
            if ($call) {
                $call->set('status', 'Held');
                $this->entityManager->saveEntity($call);
            }
        }
    }
    
    private function handleCallEnded($data): void
    {
        $callId = $data['id'] ?? $data['call_id'] ?? null;
        $duration = $data['duration'] ?? 0;
        $recording = $data['recording_url'] ?? $data['recordingUrl'] ?? null;
        
        if ($callId) {
            $call = $this->findCallByCallioId($callId);
            if ($call) {
                $call->set([
                    'status' => 'Held',
                    'duration' => $duration,
                    'dateEnd' => date('Y-m-d H:i:s'),
                    'callioRecordingUrl' => $recording
                ]);
                
                $this->entityManager->saveEntity($call);
            }
        }
    }
    
    private function handleCallFailed($data): void
    {
        $callId = $data['id'] ?? $data['call_id'] ?? null;
        $reason = $data['reason'] ?? 'Unknown';
        
        if ($callId) {
            $call = $this->findCallByCallioId($callId);
            if ($call) {
                $call->set([
                    'status' => 'Not Held',
                    'description' => 'Call failed: ' . $reason
                ]);
                
                $this->entityManager->saveEntity($call);
            }
        }
    }
    
    private function handleCallUpdate($data): void
    {
        // Generic handler cho các update khác
        $callId = $data['id'] ?? $data['call_id'] ?? null;
        
        if ($callId) {
            $call = $this->findCallByCallioId($callId);
            if ($call) {
                // Update các field nếu có
                if (isset($data['duration'])) {
                    $call->set('duration', $data['duration']);
                }
                if (isset($data['status'])) {
                    $call->set('callioStatus', $data['status']);
                }
                
                $this->entityManager->saveEntity($call);
            }
        }
    }
    
    private function findCallByCallioId(string $callioCallId)
    {
        return $this->entityManager->getRepository('Call')
            ->where(['callioCallId' => $callioCallId])
            ->findOne();
    }
    
    /**
     * Chuẩn hóa số điện thoại
     */
    private function normalizePhoneNumber(string $phone): string
    {
        // Loại bỏ ký tự không phải số
        $phone = preg_replace('/[^0-9+]/', '', $phone);
        
        // Thêm +84 nếu số bắt đầu bằng 0
        if (substr($phone, 0, 1) === '0') {
            $phone = '+84' . substr($phone, 1);
        }
        
        return $phone;
    }
}