<?php

namespace Espo\Custom\Controllers;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
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
}
