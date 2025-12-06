#!/bin/bash
set -e

# 3. Chạy các lệnh cần thiết
php command.php rebuild
php command.php clear-cache

# 4. Tiếp tục chạy CMD mặc định
exec "$@"
