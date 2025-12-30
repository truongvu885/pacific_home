<?php

namespace Espo\Custom\Controllers;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
use GuzzleHttp\Client;
use stdClass;

class CProduct extends \Espo\Core\Templates\Controllers\Base
{
    public function getActionList(Request $request, Response $response): stdClass
    {
        // Get data from parent
        $result = parent::getActionList($request, $response);

        // Custom logic: Normalize status field
        if (isset($result->list) && is_array($result->list)) {
            foreach ($result->list as $item) {
                if (isset($item->status)) {
                    // Convert "Đã Bán" or "ĐÃ BÁN" to "Đã bán"
                    if ($item->status === "Đã Bán" || $item->status === "ĐÃ BÁN") {
                        $item->status = "Đã bán";
                    }
                }
                if (isset($item->resourceType)) {
                    if ($item->resourceType === "Investors" ){
                        $item->resourceType = "CĐT";
                    } elseif ($item->resourceType === "Transformation" ){   
                        $item->resourceType = "Chuyển nhượng"; 
                    }
                }
            }
        }

        return $result;
    }

    public function getActionRead(Request $request, Response $response): stdClass
    {
        // Chỉ trả về dữ liệu gốc, không gọi API Google App Script
        $result_parent = parent::getActionRead($request, $response);
        return $result_parent;
    }

    /**
     * API mới để gọi Google App Script bất đồng bộ
     * Endpoint: GET /api/v1/CProduct/action/fetchPtgData?id={id}
     */
    public function getActionFetchPtgData(Request $request, Response $response): stdClass
    {
        $id = $request->getQueryParam('id');
        
        // Lấy thông tin record
        $recordService = $this->getRecordService();
        $entity = $recordService->getEntity($id);
        
        $result = new stdClass();
        $result->success = false;
        $result->ptgData = null;
        $result->recordId = $id; // Debug: trả về ID để kiểm tra
        
        if (!$entity) {
            $result->error = 'Record not found';
            return $result;
        }
        
        $ptg = $entity->get('ptg');
        $result->ptgUrl = $ptg; // Debug: trả về PTG URL để kiểm tra
        
        if (!empty($ptg)) {
            try {
                $httpClient = new Client();
                $httpResponse = $httpClient->request(
                    'GET',
                    'https://script.google.com/macros/s/AKfycbxw-e9nZacgUDoK31RoKgqgeBEx97KdnwRPL-GZMoIeB4nGWwzP85GITuVKZ_CrZlM7/exec',
                    [
                        'query' => [
                            'url' => $ptg,
                            'cache_bust' => time() . '_' . $id, // Thêm cache buster để tránh cache
                        ],
                        'timeout' => 30,
                    ]
                );
                $body = $httpResponse->getBody()->getContents();
                $data = json_decode($body, true);
                
                // Xử lý response từ Google App Script
                // Nếu có field 'images', lấy nó. Nếu không, dùng toàn bộ data
                $images = isset($data['images']) ? $data['images'] : $data;
                
                $result->success = true;
                $result->ptgData = $images;
            } catch (\Exception $e) {
                $result->error = $e->getMessage();
            }
        } else {
            $result->error = 'PTG field is empty';
        }
        
        return $result;
    }
    
    /**
     * Lấy danh sách admin users
     * GET: CProduct/action/getAdminUsers
     */
    public function getActionGetAdminUsers(Request $request): array
    {
        // Check permission - chỉ admin mới được gọi API này
        if (!$this->getUser()->isAdmin()) {
            throw new \Espo\Core\Exceptions\Forbidden('Chỉ admin mới có quyền truy cập.');
        }
        
        $service = $this->getRecordService();
        
        return $service->getAdminUsers();
    }
    
    /**
     * Mass update gán admin cho nguồn CĐT
     * POST: CProduct/action/assignAdminToSources
     */
    public function postActionAssignAdminToSources(Request $request): array
    {
        // Check permission
        if (!$this->getUser()->isAdmin()) {
            throw new \Espo\Core\Exceptions\Forbidden('Chỉ admin mới có quyền thực hiện.');
        }
        
        $data = $request->getParsedBody();
        
        if (!isset($data->assignedUserId)) {
            throw new \Espo\Core\Exceptions\BadRequest('Missing assignedUserId parameter.');
        }
        
        $assignedUserId = $data->assignedUserId;
        
        $service = $this->getRecordService();
        
        return $service->assignAdminToSources($assignedUserId);
    }
}
