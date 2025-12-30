<?php

namespace Espo\Custom\Services;

use Espo\ORM\Entity;

class CProduct extends \Espo\Core\Templates\Services\Base
{
    /**
     * Lấy danh sách admin users
     * Lấy users có type = 'regular' và có Role là Admin
     */
    public function getAdminUsers(): array
    {
        // Query users có type = 'regular' và có relationship với Role
        $userCollection = $this->entityManager
            ->getRDBRepository('User')
            ->distinct()
            ->join('roles', 'roles')
            ->where([
                'type' => 'regular',
                'isActive' => true,
                'deleted' => false,
                'roles.name' => 'Admin' // Tên role là "Admin"
            ])
            ->order('userName', 'ASC')
            ->find();
        
        $list = [];
        
        foreach ($userCollection as $user) {
            $list[] = [
                'id' => $user->get('id'),
                'userName' => $user->get('userName'),
                'name' => $user->get('name'),
            ];
        }
        
        return [
            'list' => $list,
            'total' => count($list)
        ];
    }
    
    /**
     * Mass update gán admin cho tất cả nguồn có resourceType = "CĐT"
     */
    public function assignAdminToSources(string $assignedUserId): array
    {
        // Validate user exists
        $user = $this->entityManager->getEntity('User', $assignedUserId);
        
        if (!$user) {
            throw new \Espo\Core\Exceptions\NotFound('User not found.');
        }
        
        // Validate user là regular và có role Admin
        if ($user->get('type') !== 'regular') {
            throw new \Espo\Core\Exceptions\Forbidden('Selected user must be regular type.');
        }
        
        // Check if user has Admin role
        $roles = $this->entityManager
            ->getRDBRepository('User')
            ->getRelation($user, 'roles')
            ->find();
        
        $hasAdminRole = false;
        foreach ($roles as $role) {
            if ($role->get('name') === 'Admin') {
                $hasAdminRole = true;
                break;
            }
        }
        
        if (!$hasAdminRole) {
            throw new \Espo\Core\Exceptions\Forbidden('Selected user does not have Admin role.');
        }
        
        // Query tất cả records có resourceType = "CĐT"
        $collection = $this->entityManager
            ->getRDBRepository('CProduct')
            ->where([
                'resourceType' => 'CĐT',
                'deleted' => false
            ])
            ->find();
        
        $count = 0;
        $errors = [];
        
        // Mass update
        foreach ($collection as $entity) {
            try {
                $entity->set('assignedUserId', $assignedUserId);
                $this->entityManager->saveEntity($entity);
                $count++;
            } catch (\Exception $e) {
                $errors[] = [
                    'id' => $entity->get('id'),
                    'error' => $e->getMessage()
                ];
            }
        }
        
        $result = [
            'success' => true,
            'count' => $count,
            'total' => $collection->count(),
            'assignedUserId' => $assignedUserId,
            'assignedUserName' => $user->get('userName')
        ];
        
        if (!empty($errors)) {
            $result['errors'] = $errors;
        }
        
        return $result;
    }
}
