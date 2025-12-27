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
            }
        }

        return $result;
    }

    public function getActionRead(Request $request, Response $response): stdClass
    {

        $result_parent = parent::getActionRead($request, $response);
        $httpClient = new Client();

        if (!empty($result_parent->ptg)) {
            $httpResponse = $httpClient->request(
                'GET',
                'https://script.google.com/macros/s/AKfycbxw-e9nZacgUDoK31RoKgqgeBEx97KdnwRPL-GZMoIeB4nGWwzP85GITuVKZ_CrZlM7/exec',
                [
                    'query' => [
                        'url' => $result_parent->ptg,
                    ],
                    'timeout' => 30,
                ]
            );
            $body = $httpResponse->getBody()->getContents();
            $data = json_decode($body, true);
            $result_parent->ptgData = $data;
        }
        return $result_parent;
    }
}
