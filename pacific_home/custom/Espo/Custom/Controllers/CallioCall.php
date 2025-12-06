<?php

namespace Espo\Custom\Controllers;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
use Espo\Custom\Services\CallioIntegration;

class CallioCall extends \Espo\Core\Controllers\Base
{

    public function postActionInitiate(Request $request, Response $response)
    {
        $body = $request->getParsedBody();

        $phoneNumber = $body->phoneNumber ?? null;
        $entityType  = $body->entityType ?? 'CProduct';
        $recordId    = $body->recordId ?? null;

        if (!$phoneNumber) {
            $response->setStatus(400);
            return ['success' => false, 'error' => 'phoneNumber required'];
        }

        $callio = $this->getCallioIntegration();

        $result = $callio->makeCall([
            'phoneNumber' => $phoneNumber,
            'userId'      => $this->getContainer()->get('user')->id,
            'entityType'  => $entityType,
            'recordId'    => $recordId,
        ]);

        $response->setStatus($result['success'] ? 200 : 400);
        return $result;
    }

    public function getActionConfigStatus(Request $request, Response $response)
    {
        $callio = $this->getCallioIntegration();
        $status = $callio->getConfigStatus();

        return ['success' => true, 'data' => $status];
    }

    private function getCallioIntegration()
    {
        $c = $this->getContainer();

        return new CallioIntegration(
            $c->get('entityManager'),
            $c->get('config'),
            $c->get('log')
        );
    }
}
