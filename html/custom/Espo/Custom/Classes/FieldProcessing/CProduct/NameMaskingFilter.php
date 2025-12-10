<?php

namespace Espo\Custom\Classes\FieldProcessing\CProduct;

use Espo\Core\Record\Output\Filter;
use Espo\ORM\Entity;
use Espo\Entities\User;

/**
 * Output filter để mask phần sau dấu "-" trong field name của CProduct
 * cho users có role là "sale"
 */
class NameMaskingFilter implements Filter
{
    private User $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }

    public function filter(Entity $entity): void
    {
        // Chỉ xử lý cho entity CProduct
        if ($entity->getEntityType() !== 'CProduct') {
            return;
        }

        // Kiểm tra xem user có role "sale" không
        if (!$this->hasSaleRole()) {
            return;
        }

        // Lấy giá trị field name
        $name = $entity->get('name');
        
        if (!$name || !is_string($name)) {
            return;
        }

        // Mask phần sau dấu "-"
        $maskedName = $this->maskNameAfterDash($name);
        
        // Set lại giá trị đã mask
        $entity->set('name', $maskedName);
    }

    /**
     * Kiểm tra user hiện tại có role "sale" không
     */
    private function hasSaleRole(): bool
    {
        // Lấy danh sách roles của user
        $roles = $this->user->get('roles');
        
        if (!$roles) {
            return false;
        }

        // Kiểm tra có role tên là "sale" không
        foreach ($roles as $role) {
            $roleName = strtolower($role->get('name') ?? '');
            if ($roleName === 'sale' || $roleName === 'sales') {
                return true;
            }
        }

        return false;
    }

    /**
     * Mask phần sau dấu "-" thành XXX
     * 
     * @param string $name - Tên gốc (vd: BX-123)
     * @return string - Tên đã mask (vd: BX-XXX)
     */
    private function maskNameAfterDash(string $name): string
    {
        // Tìm vị trí dấu "-"
        $dashPosition = strpos($name, '-');
        
        // Nếu không có dấu "-", return nguyên
        if ($dashPosition === false) {
            return $name;
        }

        // Tách phần trước và sau dấu "-"
        $beforeDash = substr($name, 0, $dashPosition);
        $afterDash = substr($name, $dashPosition + 1);
        
        // Tạo mask với độ dài bằng phần sau dấu "-"
        $maskedPart = str_repeat('X', strlen($afterDash));
        
        return $beforeDash . '-' . $maskedPart;
    }
}
