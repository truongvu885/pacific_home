<?php

namespace Espo\Custom\Services;

use Espo\Core\Select\SearchParams;
use Espo\Core\Record\FindParams;
use Espo\Core\Record\Collection;
use Espo\Core\Record\ReadParams;
use Espo\ORM\Entity;
use GuzzleHttp\Client;

class CCallioHistory extends \Espo\Services\Record
{
    // Service sẽ tự động kế thừa các method cần thiết từ Record service
    // Có thể thêm các method tùy chỉnh nếu cần

    /**
     * Test method để kiểm tra service hoạt động
     */
    public function find(SearchParams $searchParams, ?FindParams $params = null): Collection
    {
        $collectopm = parent::find($searchParams, $params);

        return $collectopm;
    }

    public function read(string $id, ReadParams $params): Entity
    {
        $record = parent::read($id, $params);
        return parent::read($id, $params);
    }
    public function testService(): array
    {
        try {
            $count = $this->getRepository()->count();
            return [
                'success' => true,
                'message' => 'CCallioHistory service đang hoạt động, đây là service',
                'timestamp' => date('Y-m-d H:i:s'),
                'entity_count' => $count,
                'service_class' => get_class($this)
            ];
        } catch (\Exception $e) {
            return [
                'success' => false,
                'message' => 'Service error: ' . $e->getMessage(),
                'timestamp' => date('Y-m-d H:i:s')
            ];
        }
    }
}
