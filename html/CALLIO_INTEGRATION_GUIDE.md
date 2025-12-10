# Hướng dẫn: Tích hợp Callio Widget cho CProduct - Role Telesale

## Tổng quan

Tính năng này tự động load **Callio Widget** (công cụ gọi điện thoại) vào trang CProduct khi user có role **Telesale** đăng nhập.

## Cách hoạt động

1. User đăng nhập với role "Telesale"
2. Khi vào trang CProduct (List View hoặc Detail View)
3. Script Callio Widget tự động được inject vào page
4. Widget hiển thị và sẵn sàng sử dụng

## Files đã tạo/sửa

### 1. Helper Utility
**`/var/www/html/client/custom/src/helpers/callio-loader.js`**
- Chứa logic kiểm tra role và load widget
- Reusable cho nhiều views khác nhau
- Có error handling và prevent duplicate loading

### 2. Custom Views

**`/var/www/html/client/custom/src/views/CProduct/list.js`**
- Custom list view cho CProduct
- Load widget khi user có role Telesale

**`/var/www/html/client/custom/src/views/CProduct/detail.js`**
- Custom detail view cho CProduct  
- Load widget khi user có role Telesale

### 3. Metadata Configuration
**`/var/www/html/custom/Espo/Custom/Resources/metadata/clientDefs/CProduct.json`**
- Đăng ký custom views vào EspoCRM

## Cấu hình Callio Widget

### Default Configuration
```javascript
{
    baseUrl: 'https://client.callio.vn',
    token: null,
    options: {
        isCall: true,    // Enable tính năng gọi điện
        isInbox: false   // Disable inbox
    }
}
```

### Tùy chỉnh Configuration

Nếu cần thay đổi cấu hình, edit file helper:
```javascript
// File: client/custom/src/helpers/callio-loader.js

callioLoader.loadWidget({
    baseUrl: 'https://client.callio.vn',
    token: 'YOUR_API_TOKEN_HERE',  // Thêm token nếu cần
    isCall: true,
    isInbox: true                   // Enable inbox nếu muốn
});
```

## Kiểm tra Role Name

Code hiện tại hỗ trợ các variant:
- `Telesale`
- `Tele Sale`
- `tele-sale`

(Case-insensitive)

### Thêm variant mới

Edit file `callio-loader.js`:
```javascript
hasTelesaleRole: function (user) {
    var roles = user.get('roles') || [];
    
    for (var i = 0; i < roles.length; i++) {
        var role = roles[i];
        var roleName = (role.name || '').toLowerCase();
        
        // Thêm variant mới ở đây
        if (roleName === 'telesale' || 
            roleName === 'tele sale' ||
            roleName === 'tele-sale' ||
            roleName === 'sales team') {  // <- Thêm mới
            return true;
        }
    }
    
    return false;
}
```

## Testing

### Bước 1: Clear Cache
```bash
php /var/www/html/clear_cache.php
# hoặc
php /var/www/html/bin/command cache:clear
```

### Bước 2: Rebuild (nếu cần)
```bash
php /var/www/html/rebuild.php
```

### Bước 3: Test với Telesale User
1. Tạo/sử dụng user có role "Telesale"
2. Đăng nhập với user đó
3. Vào CProduct List View
4. Mở Console (F12) → kiểm tra log: "Callio Widget loaded successfully"
5. Widget Callio sẽ hiển thị trên page
6. Vào CProduct Detail View → verify widget cũng load

### Bước 4: Test với User khác
1. Đăng nhập với user KHÔNG có role Telesale
2. Vào CProduct
3. Widget KHÔNG nên load
4. Console không có log về Callio

## Debugging

### Widget không load?

1. **Kiểm tra Console**
   ```
   F12 → Console Tab
   Tìm errors hoặc logs về Callio
   ```

2. **Kiểm tra Role Name**
   ```javascript
   // Thêm vào hasTelesaleRole() để debug
   console.log('User roles:', roles);
   console.log('Checking role:', roleName);
   ```

3. **Kiểm tra Script Tag**
   ```
   F12 → Elements/Inspector
   Tìm <script src="https://client.callio.vn/widget-embed.js">
   ```

4. **Kiểm tra Network**
   ```
   F12 → Network Tab
   Filter: widget-embed.js
   Check status code (should be 200)
   ```

### Script load nhiều lần?

Widget có mechanism prevent duplicate loading qua flag `window.CALLIO_LOADED`. Nếu vẫn load nhiều lần:

```javascript
// Reset flag nếu cần
window.CALLIO_LOADED = false;

// Hoặc unload widget
var callioLoader = new CallioLoader();
callioLoader.unloadWidget();
```

## Mở rộng cho nhiều Entities

Nếu muốn load Callio Widget cho entities khác (không chỉ CProduct):

### Cách 1: Tạo view riêng cho từng entity

```javascript
// File: client/custom/src/views/Contact/list.js
define('custom:views/Contact/list', ['views/list', 'custom:helpers/callio-loader'], 
function (Dep, CallioLoader) {
    return Dep.extend({
        setup: function () {
            Dep.prototype.setup.call(this);
            
            var callioLoader = new CallioLoader();
            if (callioLoader.hasTelesaleRole(this.getUser())) {
                callioLoader.loadWidget();
            }
        }
    });
});
```

Đăng ký trong metadata:
```json
// File: custom/Espo/Custom/Resources/metadata/clientDefs/Contact.json
{
    "views": {
        "list": "custom:views/Contact/list",
        "detail": "custom:views/Contact/detail"
    }
}
```

### Cách 2: Tạo global view base class

```javascript
// File: client/custom/src/views/base-with-callio.js
define('custom:views/base-with-callio', ['views/list', 'custom:helpers/callio-loader'], 
function (Dep, CallioLoader) {
    
    return Dep.extend({
        
        setup: function () {
            Dep.prototype.setup.call(this);
            this.initCallioWidget();
        },
        
        initCallioWidget: function () {
            var callioLoader = new CallioLoader();
            
            if (callioLoader.hasTelesaleRole(this.getUser())) {
                callioLoader.loadWidget({
                    baseUrl: 'https://client.callio.vn',
                    token: null,
                    isCall: true,
                    isInbox: false
                });
            }
        }
    });
});
```

Sau đó các views khác extend từ base này:
```javascript
// CProduct list
define('custom:views/CProduct/list', ['custom:views/base-with-callio'], 
function (Dep) {
    return Dep.extend({
        // Custom logic
    });
});

// Contact list
define('custom:views/Contact/list', ['custom:views/base-with-callio'], 
function (Dep) {
    return Dep.extend({
        // Custom logic
    });
});
```

## Advanced: Lấy Token từ Config

Nếu muốn store Callio token trong EspoCRM config:

### Bước 1: Thêm config vào database
```php
// Via Admin Panel: Administration → Settings → Advanced
// Hoặc edit file: data/config.php

'callioApiToken' => 'YOUR_TOKEN_HERE',
```

### Bước 2: Lấy config trong view
```javascript
setup: function () {
    Dep.prototype.setup.call(this);
    
    var callioLoader = new CallioLoader();
    
    if (callioLoader.hasTelesaleRole(this.getUser())) {
        // Lấy token từ config
        var token = this.getConfig().get('callioApiToken');
        
        callioLoader.loadWidget({
            baseUrl: 'https://client.callio.vn',
            token: token,
            isCall: true,
            isInbox: false
        });
    }
}
```

## Performance Notes

### Widget Load Time
- Widget chỉ load **1 lần** cho mỗi session (nhờ flag `CALLIO_LOADED`)
- Script load async, không block page render
- Nếu navigate giữa các pages, script không load lại

### Memory Management
- Widget script được cache bởi browser
- Nếu cần unload (khi user logout chẳng hạn), gọi:
  ```javascript
  callioLoader.unloadWidget();
  ```

## Security Notes

### HTTPS Required
- Callio widget yêu cầu HTTPS
- Đảm bảo EspoCRM chạy trên HTTPS

### CORS
- Widget từ `client.callio.vn` phải được allow CORS
- Thường Callio đã config sẵn

### Token Security
- Nếu dùng token, **KHÔNG** commit vào git
- Store trong config hoặc environment variables
- Có thể encrypt trong database

## Troubleshooting

| Vấn đề | Nguyên nhân | Giải pháp |
|--------|-------------|-----------|
| Widget không hiện | Role name không match | Check console log, verify role name |
| Script 404 | Callio URL sai | Kiểm tra baseUrl config |
| Script blocked | HTTPS/CORS issue | Verify SSL cert, check browser console |
| Load nhiều lần | Flag reset issue | Clear browser cache, check CALLIO_LOADED flag |
| Widget bị conflict | Multiple instances | Ensure only one widget loaded |

## Backup & Rollback

Nếu cần remove tính năng:

### Rollback Views
```bash
# Delete custom views
rm /var/www/html/client/custom/src/views/CProduct/detail.js
rm /var/www/html/client/custom/src/helpers/callio-loader.js

# Restore original list.js (nếu có backup)
```

### Rollback Metadata
```json
// Restore clientDefs/CProduct.json
{
    "views": {
        "list": "custom:views/CProduct/list"
        // Remove "detail" entry
    }
}
```

### Clear Cache
```bash
php /var/www/html/clear_cache.php
php /var/www/html/rebuild.php
```

## Tóm tắt

✅ **Files tạo mới:**
- `client/custom/src/helpers/callio-loader.js` - Helper utility
- `client/custom/src/views/CProduct/detail.js` - Detail view

✅ **Files đã sửa:**
- `client/custom/src/views/CProduct/list.js` - Update để dùng helper
- `custom/Espo/Custom/Resources/metadata/clientDefs/CProduct.json` - Đăng ký views

✅ **Chức năng:**
- Auto-load Callio Widget cho Telesale users
- Áp dụng cho cả List và Detail views
- Prevent duplicate loading
- Error handling
- Dễ mở rộng cho entities khác

✅ **Next steps:**
1. Clear cache
2. Test với Telesale user
3. Verify widget hoạt động
4. (Optional) Add token nếu cần
5. (Optional) Extend cho entities khác
