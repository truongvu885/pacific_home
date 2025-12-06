<?php
/************************************************************************
 * File: custom/Espo/Custom/Controllers/CallioAdmin.php
 * Admin controller để cấu hình Callio
 ************************************************************************/

namespace Espo\Custom\Controllers;

use Espo\Core\Controllers\Base;
use Espo\Core\Exceptions\Forbidden;
use Espo\Core\Api\Request;
use Espo\Core\Utils\Config\ConfigWriter;

class CallioAdmin extends Base
{
    /**
     * Lấy cấu hình Callio hiện tại
     * GET /api/v1/CallioAdmin/settings
     */
    public function getActionSettings(Request $request): array
    {
        if (!$this->getUser()->isAdmin()) {
            throw new Forbidden('Admin access required');
        }
        
        $config = $this->getConfig();
        
        return [
            'callioEnabled' => $config->get('callioEnabled', false),
            'callioApiUrl' => $config->get('callioApiUrl', 'https://clientapi.phonenet.io'),
            'callioMasterEmail' => $config->get('callioMasterEmail', ''),
            'callioMasterPassword' => $config->get('callioMasterPassword') ? '********' : '',
            'callioWebhookSecret' => $config->get('callioWebhookSecret') ? '********' : '',
            'callioAutoCreateCall' => $config->get('callioAutoCreateCall', true),
            'callioShowCallHistory' => $config->get('callioShowCallHistory', true),
            'callioShowInListView' => $config->get('callioShowInListView', true),
        ];
    }
    
    /**
     * Cập nhật cấu hình Callio
     * POST /api/v1/CallioAdmin/settings
     */
    public function postActionSettings(Request $request): array
    {
        if (!$this->getUser()->isAdmin()) {
            throw new Forbidden('Admin access required');
        }
        
        $data = $request->getParsedBody();
        
        $injectableFactory = $this->getContainer()->get('injectableFactory');
        $configWriter = $injectableFactory->create(ConfigWriter::class);
        
        // Update các settings
        if (isset($data->callioEnabled)) {
            $configWriter->set('callioEnabled', (bool)$data->callioEnabled);
        }
        
        if (isset($data->callioApiUrl)) {
            $configWriter->set('callioApiUrl', trim($data->callioApiUrl));
        }
        
        if (isset($data->callioMasterEmail)) {
            $configWriter->set('callioMasterEmail', trim($data->callioMasterEmail));
        }
        
        // Only update password if not masked
        if (isset($data->callioMasterPassword) && $data->callioMasterPassword !== '********') {
            $configWriter->set('callioMasterPassword', $data->callioMasterPassword);
        }

        if (isset($data->callioWebhookSecret) && $data->callioWebhookSecret !== '********') {
            $configWriter->set('callioWebhookSecret', trim($data->callioWebhookSecret));
        }
        
        if (isset($data->callioAutoCreateCall)) {
            $configWriter->set('callioAutoCreateCall', (bool)$data->callioAutoCreateCall);
        }
        
        if (isset($data->callioShowCallHistory)) {
            $configWriter->set('callioShowCallHistory', (bool)$data->callioShowCallHistory);
        }
        
        if (isset($data->callioShowInListView)) {
            $configWriter->set('callioShowInListView', (bool)$data->callioShowInListView);
        }
        
        $configWriter->save();
        
        return [
            'success' => true,
            'message' => 'Settings saved successfully'
        ];
    }
    
    /**
     * Test kết nối với Callio
     * POST /api/v1/CallioAdmin/testConnection
     */
    public function postActionTestConnection(Request $request): array
    {
        if (!$this->getUser()->isAdmin()) {
            throw new Forbidden('Admin access required');
        }
        
        $service = $this->getService('CallioIntegration');
        
        $result = $service->checkStatus();
        
        return $result;
    }
    
    /**
     * Lấy thống kê sử dụng Callio
     * GET /api/v1/CallioAdmin/statistics
     */
    public function getActionStatistics(Request $request): array
    {
        if (!$this->getUser()->isAdmin()) {
            throw new Forbidden('Admin access required');
        }
        
        $em = $this->getContainer()->get('entityManager');
        
        // Thống kê cuộc gọi
        $totalCalls = $em->getRepository('Call')
            ->where(['callioCallId!=' => null])
            ->count();
        
        $successCalls = $em->getRepository('Call')
            ->where([
                'callioCallId!=' => null,
                'status' => 'Held'
            ])
            ->count();
        
        $today = date('Y-m-d');
        $todayCalls = $em->getRepository('Call')
            ->where([
                'callioCallId!=' => null,
                'dateStart>=' => $today . ' 00:00:00',
                'dateStart<=' => $today . ' 23:59:59'
            ])
            ->count();
        
        // Top users
        $topUsers = $em->getRepository('Call')
            ->select(['assignedUserId', 'COUNT:id'])
            ->where(['callioCallId!=' => null])
            ->groupBy('assignedUserId')
            ->order('COUNT:id', 'DESC')
            ->limit(0, 5)
            ->find();
        
        return [
            'totalCalls' => $totalCalls,
            'successCalls' => $successCalls,
            'todayCalls' => $todayCalls,
            'successRate' => $totalCalls > 0 ? round(($successCalls / $totalCalls) * 100, 2) : 0,
            'topUsers' => $topUsers
        ];
    }
}