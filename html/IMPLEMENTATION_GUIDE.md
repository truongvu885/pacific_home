# Hướng dẫn Implementation: Ẩn phần sau dấu "-" trong field name của CProduct cho role Sale

## Tổng quan
Chức năng này sẽ tự động mask phần sau dấu "-" trong field `name` của entity `CProduct` khi user có role "sale" xem danh sách hoặc chi tiết record.

**Ví dụ:** `BX-123` → `BX-XXX`

---

## CÁCH 1: Sử dụng Output Filter (✅ RECOMMENDED - Cách chuẩn của EspoCRM)

### Files đã tạo:

#### 1. `/var/www/html/custom/Espo/Custom/Classes/FieldProcessing/CProduct/NameMaskingFilter.php`
- **Vai trò:** Class xử lý logic mask data trước khi output
- **Logic:**
  - Kiểm tra entity có phải CProduct không
  - Kiểm tra user có role "sale" không (so sánh tên role với "sale" hoặc "sales", case-insensitive)
  - Nếu đúng, mask phần sau dấu "-" bằng cách replace bằng các ký tự "X"
  
#### 2. `/var/www/html/custom/Espo/Custom/Resources/metadata/recordDefs/CProduct.json`
- **Vai trò:** Đăng ký Output Filter vào metadata của CProduct
- **Nội dung:** Thêm class `NameMaskingFilter` vào `outputFilterClassNameList`

### Cách hoạt động:
1. Khi EspoCRM load data cho CProduct (list view hoặc detail view)
2. Sau khi query data từ database
3. Trước khi trả về cho client
4. EspoCRM sẽ chạy qua tất cả Output Filters đã đăng ký
5. `NameMaskingFilter` sẽ được execute và modify field `name` nếu user có role "sale"

### Ưu điểm:
- ✅ Cách tiếp cận chuẩn theo kiến trúc EspoCRM
- ✅ Dễ maintain và upgrade
- ✅ Tách biệt logic, không cần override Service class
- ✅ Áp dụng cho cả list view và detail view
- ✅ Không ảnh hưởng đến data trong database

### Nhược điểm:
- Phải clear cache mỗi khi thay đổi

---

## CÁCH 2: Override Service Class (Alternative)

Nếu bạn muốn có control nhiều hơn, có thể tạo custom Service:

### Tạo file `/var/www/html/custom/Espo/Custom/Services/CProduct.php`:

```php
<?php

namespace Espo\Custom\Services;

use Espo\Core\Record\Service;
use Espo\ORM\Entity;

class CProduct extends Service
{
    /**
     * Override prepareEntityForOutput để mask field name cho role sale
     */
    public function prepareEntityForOutput(Entity $entity): void
    {
        // Gọi parent method trước
        parent::prepareEntityForOutput($entity);
        
        // Kiểm tra user có role sale không
        if ($this->hasSaleRole()) {
            $name = $entity->get('name');
            
            if ($name && is_string($name)) {
                $maskedName = $this->maskNameAfterDash($name);
                $entity->set('name', $maskedName);
            }
        }
    }
    
    /**
     * Kiểm tra user có role "sale" không
     */
    private function hasSaleRole(): bool
    {
        $user = $this->user;
        $roles = $user->get('roles');
        
        if (!$roles) {
            return false;
        }
        
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
     */
    private function maskNameAfterDash(string $name): string
    {
        $dashPosition = strpos($name, '-');
        
        if ($dashPosition === false) {
            return $name;
        }
        
        $beforeDash = substr($name, 0, $dashPosition);
        $afterDash = substr($name, $dashPosition + 1);
        $maskedPart = str_repeat('X', strlen($afterDash));
        
        return $beforeDash . '-' . $maskedPart;
    }
}
```

### Ưu điểm:
- ✅ Control toàn bộ logic trong 1 file
- ✅ Có thể override nhiều methods khác nếu cần

### Nhược điểm:
- ⚠️ Override Service không được khuyến khích trong EspoCRM v8+
- ⚠️ Có thể conflict khi upgrade EspoCRM
- ⚠️ Harder to maintain

---

## CÁCH 3: Sử dụng List Loader (Chỉ cho List View)

Nếu chỉ muốn mask ở list view, có thể tạo List Loader:

### Tạo file `/var/www/html/custom/Espo/Custom/Classes/FieldProcessing/CProduct/NameMaskingLoader.php`:

```php
<?php

namespace Espo\Custom\Classes\FieldProcessing\CProduct;

use Espo\Core\FieldProcessing\Loader;
use Espo\Core\FieldProcessing\Loader\Params;
use Espo\ORM\Entity;
use Espo\Entities\User;

class NameMaskingLoader implements Loader
{
    private User $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }

    public function process(Entity $entity, Params $params): void
    {
        if ($entity->getEntityType() !== 'CProduct') {
            return;
        }

        if (!$this->hasSaleRole()) {
            return;
        }

        $name = $entity->get('name');
        
        if ($name && is_string($name)) {
            $maskedName = $this->maskNameAfterDash($name);
            $entity->set('name', $maskedName);
        }
    }

    private function hasSaleRole(): bool
    {
        $roles = $this->user->get('roles');
        
        if (!$roles) {
            return false;
        }
        
        foreach ($roles as $role) {
            $roleName = strtolower($role->get('name') ?? '');
            if ($roleName === 'sale' || $roleName === 'sales') {
                return true;
            }
        }
        
        return false;
    }

    private function maskNameAfterDash(string $name): string
    {
        $dashPosition = strpos($name, '-');
        
        if ($dashPosition === false) {
            return $name;
        }
        
        $beforeDash = substr($name, 0, $dashPosition);
        $afterDash = substr($name, $dashPosition + 1);
        $maskedPart = str_repeat('X', strlen($afterDash));
        
        return $beforeDash . '-' . $maskedPart;
    }
}
```

### Đăng ký trong metadata entityDefs:

File: `/var/www/html/custom/Espo/Custom/Resources/metadata/entityDefs/CProduct.json`

Thêm vào field `name`:
```json
{
    "fields": {
        "name": {
            "loaderClassName": "Espo\\Custom\\Classes\\FieldProcessing\\CProduct\\NameMaskingLoader"
        }
    }
}
```

---

## Cách kiểm tra Role name

Nếu bạn không chắc tên role trong database là gì, có thể:

### Option 1: Kiểm tra qua Admin Panel
1. Đăng nhập với admin
2. Vào **Administration** → **Roles**
3. Xem tên role (field "Name")

### Option 2: Kiểm tra trong code bằng nhiều pattern
Trong method `hasSaleRole()`, bạn có thể mở rộng để match nhiều pattern:

```php
private function hasSaleRole(): bool
{
    $roles = $this->user->get('roles');
    
    if (!$roles) {
        return false;
    }
    
    // Danh sách các tên role có thể
    $saleRoleNames = ['sale', 'sales', 'nhân viên bán hàng', 'nv bán hàng'];
    
    foreach ($roles as $role) {
        $roleName = strtolower($role->get('name') ?? '');
        
        foreach ($saleRoleNames as $saleRole) {
            if (strpos($roleName, $saleRole) !== false) {
                return true;
            }
        }
    }
    
    return false;
}
```

### Option 3: Kiểm tra bằng ID thay vì tên
```php
private function hasSaleRole(): bool
{
    $roles = $this->user->get('roles');
    
    if (!$roles) {
        return false;
    }
    
    // Thay 'ROLE_ID_HERE' bằng ID thực tế của role sale
    $saleRoleId = 'ROLE_ID_HERE';
    
    foreach ($roles as $role) {
        if ($role->getId() === $saleRoleId) {
            return true;
        }
    }
    
    return false;
}
```

---

## Các bước triển khai (CÁCH 1 - Recommended)

### Bước 1: Files đã được tạo sẵn
✅ Đã tạo `NameMaskingFilter.php`
✅ Đã cập nhật `recordDefs/CProduct.json`

### Bước 2: Clear Cache (QUAN TRỌNG!)

Chạy các lệnh sau trong terminal:

```bash
# Option 1: Clear cache bằng script PHP
php /var/www/html/clear_cache.php

# Option 2: Clear cache bằng command
php /var/www/html/bin/command cache:clear

# Option 3: Xóa thủ công
rm -rf /var/www/html/data/cache/*
```

### Bước 3: Rebuild

```bash
php /var/www/html/rebuild.php
```

### Bước 4: Kiểm tra permissions (nếu cần)

```bash
# Set ownership
chown -R www-data:www-data /var/www/html/custom

# Set permissions
find /var/www/html/custom -type d -exec chmod 755 {} \;
find /var/www/html/custom -type f -exec chmod 644 {} \;
```

### Bước 5: Test

1. Đăng nhập với user có role "sale"
2. Vào list view của CProduct
3. Kiểm tra field `name` đã được mask chưa (vd: `BX-123` → `BX-XXX`)
4. Vào detail view để confirm
5. Đăng nhập với user khác (không có role sale) để verify không bị mask

---

## Debugging

### Nếu không hoạt động:

1. **Kiểm tra cache đã clear chưa:**
   ```bash
   ls -la /var/www/html/data/cache/
   # Phải rỗng hoặc chỉ có .htaccess
   ```

2. **Kiểm tra logs:**
   ```bash
   tail -f /var/www/html/data/logs/espo-*.log
   ```

3. **Kiểm tra tên role:**
   Thêm debug vào method `hasSaleRole()`:
   ```php
   private function hasSaleRole(): bool
   {
       $roles = $this->user->get('roles');
       
       // Debug: Log ra tên các roles
       $roleNames = [];
       if ($roles) {
           foreach ($roles as $role) {
               $roleNames[] = $role->get('name');
           }
       }
       error_log('User roles: ' . implode(', ', $roleNames));
       
       // ... rest of the code
   }
   ```

4. **Verify filter được load:**
   Thêm log vào method `filter()`:
   ```php
   public function filter(Entity $entity): void
   {
       error_log('NameMaskingFilter executed for entity: ' . $entity->getEntityType());
       
       // ... rest of the code
   }
   ```

---

## Lưu ý quan trọng

### ⚠️ Cache
- **Bắt buộc clear cache** sau mỗi lần thay đổi code hoặc metadata
- Nếu môi trường production, nên rebuild sau khi clear cache

### ⚠️ Data trong Database
- Logic này **KHÔNG thay đổi** data trong database
- Chỉ mask khi hiển thị cho user
- Data thực tế vẫn là `BX-123` trong database

### ⚠️ API Response
- Filter này cũng áp dụng cho API responses
- Nếu có mobile app hoặc integration khác consume API, chúng cũng sẽ nhận data đã mask

### ⚠️ Export
- Khi export data (CSV, Excel), data có thể bị mask tùy vào cách export được implement
- Nếu cần data thật khi export, có thể cần thêm logic check context

### ⚠️ Performance
- Output Filter chạy cho **mỗi record** được load
- Với list view có nhiều records, có thể ảnh hưởng performance nhẹ
- Nếu list có 100 records, filter sẽ chạy 100 lần
- Với dataset nhỏ (< 1000 records), impact không đáng kể

### ⚠️ Tên Role
- Code hiện tại check role name là "sale" hoặc "sales" (case-insensitive)
- Nếu role của bạn có tên khác, cần update method `hasSaleRole()`
- Có thể dùng role ID thay vì name để chính xác hơn

---

## Customization

### Thay đổi ký tự mask

Nếu muốn dùng ký tự khác thay vì "X":

```php
private function maskNameAfterDash(string $name): string
{
    // ...
    $maskedPart = str_repeat('*', strlen($afterDash)); // Dùng *
    // hoặc
    $maskedPart = 'HIDDEN'; // Fixed string
    // ...
}
```

### Mask theo pattern khác

Ví dụ chỉ mask 1 phần:
```php
private function maskNameAfterDash(string $name): string
{
    $dashPosition = strpos($name, '-');
    
    if ($dashPosition === false) {
        return $name;
    }
    
    $beforeDash = substr($name, 0, $dashPosition);
    $afterDash = substr($name, $dashPosition + 1);
    
    // Giữ 2 ký tự đầu, mask phần còn lại
    if (strlen($afterDash) > 2) {
        $visible = substr($afterDash, 0, 2);
        $masked = str_repeat('X', strlen($afterDash) - 2);
        $afterDash = $visible . $masked;
    }
    
    return $beforeDash . '-' . $afterDash;
}
// BX-123456 → BX-12XXXX
```

### Apply cho nhiều fields

Nếu muốn mask nhiều fields:
```php
public function filter(Entity $entity): void
{
    if ($entity->getEntityType() !== 'CProduct') {
        return;
    }

    if (!$this->hasSaleRole()) {
        return;
    }

    // Mask nhiều fields
    $fieldsToMask = ['name', 'code', 'serialNumber'];
    
    foreach ($fieldsToMask as $field) {
        $value = $entity->get($field);
        
        if ($value && is_string($value)) {
            $maskedValue = $this->maskNameAfterDash($value);
            $entity->set($field, $maskedValue);
        }
    }
}
```

---

## Tổng kết

**Khuyến nghị: Sử dụng CÁCH 1 (Output Filter)**

- ✅ Clean architecture
- ✅ Easy to maintain
- ✅ Future-proof khi upgrade EspoCRM
- ✅ Áp dụng cho cả list và detail view
- ✅ Không conflict với core code

Các files cần:
1. `/var/www/html/custom/Espo/Custom/Classes/FieldProcessing/CProduct/NameMaskingFilter.php` ✅ Đã tạo
2. `/var/www/html/custom/Espo/Custom/Resources/metadata/recordDefs/CProduct.json` ✅ Đã cập nhật

Chỉ cần:
1. Clear cache
2. Rebuild
3. Test với user có role "sale"

---

## Support

Nếu có vấn đề, check theo thứ tự:
1. Cache đã clear chưa?
2. Rebuild đã chạy chưa?
3. Tên role có chính xác không?
4. Check logs có error không?
5. File permissions có đúng không?
