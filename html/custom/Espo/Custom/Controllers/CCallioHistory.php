<?php

namespace Espo\Custom\Controllers;

use Espo\Core\Controllers\Record;  // Extend từ Record
use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
use Espo\Core\Exceptions\Error;
use GuzzleHttp\Client;
use Datetime;
use DateTimeZone;
use stdClass;

class CCallioHistory extends \Espo\Core\Templates\Controllers\Base
{

    public function getActionList(Request $request, Response $response): \stdClass
    {
        $httpClient = new Client();

        // Lấy offset và maxSize từ query params của EspoCRM
        $offset = $request->getQueryParam('offset') ?? 1;
        $maxSize = $request->getQueryParam('maxSize') ?? 20;

        // Tính toán page từ offset và maxSize
        $page = floor(($offset) / $maxSize) + 1;
        $pageSize = $maxSize;

        $httpResponse = $httpClient->request(
            'GET',
            'https://clientapi.phonenet.io/call',
            [
                'query' => [
                    'page' => $page,
                    'pageSize' => $pageSize,
                ],
                'headers' => [
                    'Accept'       => 'application/json',
                    'Content-Type' => 'application/json',
                    'token'        => '829ceda8cf855d1fc122e2c835c0d7722da05d46e4a2dc56543604482b342bfdcd7883065a413b1a69950fbf3f2faa1ea5000dd18d311987f262cefe100cc2a7',
                ],
                'timeout' => 10,
            ]
        );

        $body = $httpResponse->getBody();
        $data = json_decode($body);  // true = array

        $list = isset($data->docs) && is_array($data->docs) ? $data->docs : [];
        $totalRecords = isset($data->totalDocs) ? (int) $data->totalDocs : null;

        $newList = array_map(function ($item) {
            // Convert to array để tránh dynamic property warning
            $itemArray = (array) $item;
            
            // Đổi _id -> id
            $itemArray['id'] = $itemArray['_id'] ?? ($itemArray['id'] ?? null);
            unset($itemArray['_id']);

            $itemArray['name'] = "Click để xem chi tiết";
            $itemArray['startTime'] = $this->convertMsTimestamp($item->startTime ?? null);
            $itemArray['endTime'] = $this->convertMsTimestamp($item->endTime ?? null);

            // Convert back to object
            return (object) $itemArray;
        }, $list);

        // Trả về dữ liệu phân trang cho frontend (dùng array để tránh dynamic property warning)
        $result_parent = parent::getActionList($request, $response);
        return (object) [
            'list' => $newList,
            'total' => $totalRecords
        ];
        // return $result_parent;
    }


    public function getActionRead(Request $request, Response $response): stdClass
    {
        $httpClient = new Client();

        $httpResponse = $httpClient->request(
            'GET',
            "https://clientapi.phonenet.io/call/{$request->getRouteParam('id')}",
            [
                'headers' => [
                    'Accept'       => 'application/json',
                    'Content-Type' => 'application/json',
                    'token'        => '829ceda8cf855d1fc122e2c835c0d7722da05d46e4a2dc56543604482b342bfdcd7883065a413b1a69950fbf3f2faa1ea5000dd18d311987f262cefe100cc2a7',
                ],
                'timeout' => 10,
            ]
        );

        $body = $httpResponse->getBody();
        $data = json_decode($body, true); // Decode as array

        // Transform data without dynamic property assignment
        $data['id'] = $data['_id'] ?? null;
        $data['name'] = "Click để xem chi tiết";
        $data['startTime'] = $this->convertMsTimestamp($data['startTime'] ?? null);
        $data['endTime'] = $this->convertMsTimestamp($data['endTime'] ?? null);
        $data['transcripts'] = $data['transcripts'] ?? [];
        unset($data['_id']);
        
        return (object) $data;

        // $id = $request->getRouteParam('id');

        // $result_parent = parent::getActionRead($request, $response);
        // return $result_parent;
    }

    /*
     * Test action để kiểm tra controller hoạt động
     */
    public function getActionTest(Request $request): stdClass
    {
        try {
            // Lấy service của entity này
            $service = $this->getRecordService();

            // Nếu service có method testService
            if (method_exists($service, 'testService')) {
                $result = $service->testService();
                return (object) $result;
            }

            return (object) [
                'success' => true,
                'message' => 'CCallioHistory controller đang hoạt động',
                'timestamp' => date('Y-m-d H:i:s'),
                'service_class' => get_class($service)
            ];
        } catch (\Exception $e) {
            error_log('DEBUG: Error in test action: ' . $e->getMessage());
            $GLOBALS['log']->error($e->getTraceAsString());
            return (object) [
                'success' => false,
                'message' => 'Error: ' . $e->getMessage(),
                'timestamp' => date('Y-m-d H:i:s')
            ];
        }
    }

    private function convertMsTimestamp($milliseconds, ?string $timezone = null): ?string
    {
        if ($milliseconds === null) {
            return null;
        }

        // Bỏ qua giá trị không hợp lệ
        if (!is_numeric($milliseconds)) {
            return null;
        }

        $seconds = intdiv((int) $milliseconds, 1000);

        $date = new DateTime("@$seconds"); // Timestamp UTC

        if ($timezone !== null) {
            $date->setTimezone(new DateTimeZone($timezone));
        }

        return $date->format('Y-m-d H:i:s');
    }
}
