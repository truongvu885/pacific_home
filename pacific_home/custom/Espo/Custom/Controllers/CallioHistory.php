<?php
/************************************************************************
 * File: custom/Espo/Custom/Controllers/CallioHistory.php
 * Controller để lấy lịch sử cuộc gọi từ Callio
 ************************************************************************/

namespace Espo\Custom\Controllers;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
use Espo\Core\Exceptions\Forbidden;
use Espo\Custom\Services\CallioIntegration;

class CallioHistory extends \Espo\Core\Controllers\Base
{
    private $container;

    public function setContainer($container)
    {
        $this->container = $container;
        return $this;
    }
    
    /**
     * GET /api/v1/CallioHistory/list
     * 
     * Query parameters:
     * - limit: số lượng records (mặc định 50)
     * - offset: offset (mặc định 0)
     * - dateFrom: ngày bắt đầu (Y-m-d H:i:s)
     * - dateTo: ngày kết thúc (Y-m-d H:i:s)
     * - status: filter by status (initiated, ongoing, completed, failed)
     * - phoneNumber: filter by phone number
     */
    public function getActionList(Request $request, Response $response): \stdClass
    {
        try {
            $limit = $request->getQueryParam('limit') ?? 50;
            $offset = $request->getQueryParam('offset') ?? 0;
            $dateFrom = $request->getQueryParam('dateFrom');
            $dateTo = $request->getQueryParam('dateTo');
            $status = $request->getQueryParam('status');
            $phoneNumber = $request->getQueryParam('phoneNumber');
            
            $limit = min((int)$limit, 200); // Max 200
            $offset = max(0, (int)$offset);
            
            $callioService = $this->getCallioIntegration();
            
            $result = $callioService->getCallHistoryFromCallio([
                'userId' => $this->getUser()->getId(),
                'limit' => $limit,
                'offset' => $offset,
                'dateFrom' => $dateFrom,
                'dateTo' => $dateTo,
                'status' => $status,
                'phoneNumber' => $phoneNumber
            ]);
            
            return (object) $result;
        } catch (\Exception $e) {
            $response->setStatus(400);
            return (object) [
                'success' => false,
                'error' => $e->getMessage()
            ];
        }
    }
    
    /**
     * GET /api/v1/CallioHistory/recent
     * Lấy các cuộc gọi gần đây (24 giờ qua)
     */
    public function getActionRecent(Request $request, Response $response): \stdClass
    {
        try {
            $limit = $request->getQueryParam('limit') ?? 20;
            
            $dateFrom = date('Y-m-d H:i:s', strtotime('-1 day'));
            
            $callioService = $this->getCallioIntegration();
            
            $result = $callioService->getCallHistoryFromCallio([
                'userId' => $this->getUser()->getId(),
                'limit' => min((int)$limit, 100),
                'offset' => 0,
                'dateFrom' => $dateFrom
            ]);
            
            return (object) $result;
        } catch (\Exception $e) {
            $response->setStatus(400);
            return (object) [
                'success' => false,
                'error' => $e->getMessage()
            ];
        }
    }
    
    /**
     * GET /api/v1/CallioHistory/by-entity
     * Lấy lịch sử cuộc gọi liên quan đến một entity (Product, Contact, Lead, etc.)
     * 
     * Query parameters:
     * - entityType: loại entity (Product, Contact, Lead, etc.)
     * - entityId: ID của entity
     */
    public function getActionByEntity(Request $request, Response $response): \stdClass
    {
        try {
            $entityType = $request->getQueryParam('entityType');
            $entityId = $request->getQueryParam('entityId');
            $limit = $request->getQueryParam('limit') ?? 50;
            $offset = $request->getQueryParam('offset') ?? 0;
            
            if (!$entityType || !$entityId) {
                $response->setStatus(400);
                return (object) [
                    'success' => false,
                    'error' => 'entityType and entityId are required'
                ];
            }
            
            // Lấy entity để lấy phone number
            $entity = $this->getEntityManager()->getEntity($entityType, $entityId);
            if (!$entity) {
                $response->setStatus(404);
                return (object) [
                    'success' => false,
                    'error' => 'Entity not found'
                ];
            }
            
            // Tìm phone field (có thể là phoneNumber, phone, mobilePhone, etc.)
            $phoneNumber = null;
            foreach (['phoneNumber', 'phone', 'mobilePhone', 'workPhone', 'personalPhone'] as $field) {
                if ($entity->has($field)) {
                    $phone = $entity->get($field);
                    if ($phone) {
                        $phoneNumber = $phone;
                        break;
                    }
                }
            }
            
            if (!$phoneNumber) {
                return (object) [
                    'success' => true,
                    'data' => [],
                    'message' => 'No phone number found for this entity'
                ];
            }
            
            $callioService = $this->getCallioIntegration();
            
            $result = $callioService->getCallHistoryFromCallio([
                'userId' => $this->getUser()->getId(),
                'phoneNumber' => $phoneNumber,
                'limit' => min((int)$limit, 200),
                'offset' => max(0, (int)$offset)
            ]);
            
            // Thêm entity info vào metadata
            if (is_array($result) && isset($result['success']) && $result['success'] && !empty($result['data'])) {
                $result['entityType'] = $entityType;
                $result['entityId'] = $entityId;
                $result['entityName'] = $entity->get('name') ?? $entity->get('title') ?? null;
            }

            return (object) $result;
        } catch (\Exception $e) {
            $response->setStatus(400);
            return (object) [
                'success' => false,
                'error' => $e->getMessage()
            ];
        }
    }
    
    /**
     * GET /api/v1/CallioHistory/summary
     * Lấy thống kê cuộc gọi
     */
    public function getActionSummary(Request $request, Response $response): \stdClass
    {
        try {
            $dateFrom = $request->getQueryParam('dateFrom') ?? date('Y-m-d 00:00:00', strtotime('-30 days'));
            $dateTo = $request->getQueryParam('dateTo') ?? date('Y-m-d 23:59:59');
            
            $callioService = $this->getCallioIntegration();
            
            // Lấy tất cả cuộc gọi trong khoảng thời gian
            $result = $callioService->getCallHistoryFromCallio([
                'userId' => $this->getUser()->getId(),
                'limit' => 1000,
                'offset' => 0,
                'dateFrom' => $dateFrom,
                'dateTo' => $dateTo
            ]);
            
            if (is_array($result) && isset($result['success']) && !$result['success']) {
                return (object) $result;
            }
            
            // Calculate statistics
            $calls = $result['data'] ?? [];
            $stats = [
                'totalCalls' => count($calls),
                'completedCalls' => 0,
                'failedCalls' => 0,
                'totalDuration' => 0,
                'averageDuration' => 0,
                'byStatus' => []
            ];
            
            foreach ($calls as $call) {
                $status = $call['status'] ?? 'unknown';
                
                if (!isset($stats['byStatus'][$status])) {
                    $stats['byStatus'][$status] = 0;
                }
                $stats['byStatus'][$status]++;
                
                if ($status === 'completed' || $status === 'Held') {
                    $stats['completedCalls']++;
                    $stats['totalDuration'] += (int)($call['duration'] ?? 0);
                } elseif ($status === 'failed' || $status === 'Not Held') {
                    $stats['failedCalls']++;
                }
            }
            
            if ($stats['completedCalls'] > 0) {
                $stats['averageDuration'] = round($stats['totalDuration'] / $stats['completedCalls'], 2);
            }
            
            return (object) [
                'success' => true,
                'data' => $stats,
                'dateFrom' => $dateFrom,
                'dateTo' => $dateTo
            ];
        } catch (\Exception $e) {
            $response->setStatus(400);
            return (object) [
                'success' => false,
                'error' => $e->getMessage()
            ];
        }
    }
    
    /**
     * Get Callio Integration service
     * 
     * @return CallioIntegration
     */
    private function getCallioIntegration()
    {
        $entityManager = $this->container->get('entityManager');
        $config = $this->container->get('config');
        $log = $this->container->get('log');

        return new CallioIntegration($entityManager, $config, $log);
    }
}
