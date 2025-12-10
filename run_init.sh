#!/bin/sh
# run_init.sh - simplified: copies files, runs EspoCRM CLI, then directly INSERT into DB
# Usage: ./run_init.sh [--web-container NAME] [--db-container NAME] [--db-root-pw PW]
# Defaults:
#  web container: pacific-home
#  db container:  pacific-home-db
#  db root pw:   12345678
#
# NOTE: This version removes the SELECT check and always runs the single INSERT.
# Make executable: chmod +x run_init.sh
# Run after docker-compose up (when both web and db containers exist and are running).

set -eu

PACIFIC_HOME_CONTAINER="pacific-home"
DB_CONTAINER="pacific-home-db"
DB_ROOT_PASSWORD="12345678"

while [ $# -gt 0 ]; do
  case "$1" in
    --web-container) PACIFIC_HOME_CONTAINER="$2"; shift 2;;
    --db-container) DB_CONTAINER="$2"; shift 2;;
    --db-root-pw) DB_ROOT_PASSWORD="$2"; shift 2;;
    --help|-h) echo "Usage: $0 [--web-container NAME] [--db-container NAME] [--db-root-pw PW]"; exit 0;;
    *) echo "Unknown arg: $1"; echo "Usage: $0 [--web-container NAME] [--db-container NAME] [--db-root-pw PW]"; exit 1;;
  esac
done

echo "[init-script] Web container: $PACIFIC_HOME_CONTAINER"
echo "[init-script] DB container:  $DB_CONTAINER"

if ! command -v docker >/dev/null 2>&1; then
  echo "[init-script] docker CLI not found" >&2
  exit 2
fi

if ! docker ps --format '{{.Names}}' | grep -wq "$PACIFIC_HOME_CONTAINER"; then
  echo "[init-script] Web container '$PACIFIC_HOME_CONTAINER' not running. Start it first." >&2
  docker ps --format '{{.Names}}'
  exit 3
fi

if ! docker ps --format '{{.Names}}' | grep -wq "$DB_CONTAINER"; then
  echo "[init-script] DB container '$DB_CONTAINER' not running. Start it first." >&2
  docker ps --format '{{.Names}}'
  exit 4
fi

# wait for DB to accept connections
echo "[init-script] Waiting for DB to be ready..."
WAIT_RETRIES=60
WAIT_SLEEP=2
i=0
while ! docker exec "$DB_CONTAINER" mysqladmin ping -uroot -p"$DB_ROOT_PASSWORD" --silent >/dev/null 2>&1; do
  i=$((i+1))
  echo "[init-script] DB not ready yet (attempt $i/$WAIT_RETRIES)..."
  if [ $i -ge $WAIT_RETRIES ]; then
    echo "[init-script] Timeout waiting for DB. Exiting." >&2
    exit 5
  fi
  sleep $WAIT_SLEEP
done
echo "[init-script] DB is ready."

SRC_DIR="./html"

copy_if_exists() {
  src="$1"
  dst="$2"
  if [ -e "$src" ]; then
    echo "[init-script] docker cp $src -> ${PACIFIC_HOME_CONTAINER}:$dst"
    docker cp "$src" "${PACIFIC_HOME_CONTAINER}:$dst"
  else
    echo "[init-script] Source $src not found, skipping"
  fi
}

copy_if_exists "$SRC_DIR/client/custom" "/var/www/html/client/"
copy_if_exists "$SRC_DIR/custom" "/var/www/html/"
copy_if_exists "$SRC_DIR/data/upload" "/var/www/html/data/"

if [ -f "$SRC_DIR/data/config-internal.php" ]; then
  echo "[init-script] Copying config-internal.php"
  docker cp "$SRC_DIR/data/config-internal.php" "${PACIFIC_HOME_CONTAINER}:/var/www/html/data/config-internal.php"
fi
if [ -f "$SRC_DIR/data/config.php" ]; then
  echo "[init-script] Copying config.php"
  docker cp "$SRC_DIR/data/config.php" "${PACIFIC_HOME_CONTAINER}:/var/www/html/data/config.php"
fi

echo "[init-script] Trying chown inside web container (best-effort)"
docker exec -u 0 "$PACIFIC_HOME_CONTAINER" sh -c "chown -R www-data:www-data /var/www/html || true"

echo "[init-script] Running EspoCRM CLI (rebuild + clear-cache) inside $PACIFIC_HOME_CONTAINER"
if docker exec "$PACIFIC_HOME_CONTAINER" sh -c 'command -v php >/dev/null 2>&1 && [ -f /var/www/html/command.php ]'; then
  docker exec "$PACIFIC_HOME_CONTAINER" php /var/www/html/command.php rebuild || echo "[init-script] rebuild failed (non-fatal)"
  docker exec "$PACIFIC_HOME_CONTAINER" php /var/www/html/command.php clear-cache || echo "[init-script] clear-cache failed (non-fatal)"
else
  echo "[init-script] php CLI or /var/www/html/command.php not found in web container; skipping CLI steps"
fi

# Use host system time for the two fields
# TS="$(date '+%Y-%m-%d %H:%M:%S')"
# echo "[init-script] Using timestamp: $TS"

# # Direct INSERT (no pre-check). Replace the two 'thời gian' fields with current TS.
# SQL_INSERT="INSERT INTO attachment VALUES ('693129384a2156b3c','logopacific final.png',0,'image/png',73339,'companyLogo',0,'${TS}','${TS}','Attachment','EspoUploadDir',NULL,0,NULL,NULL,NULL,'Settings',NULL,'693128ca918233887');"

# echo "[init-script] Executing INSERT..."
# # capture stderr to show meaningful error if it fails
# if docker exec -i "$DB_CONTAINER" sh -c "mysql -uroot -p'$DB_ROOT_PASSWORD' espocrm -e \"${SQL_INSERT}\"" >/tmp/run_init_insert_out 2>/tmp/run_init_insert_err; then
#   echo "[init-script] INSERT OK"
#   rm -f /tmp/run_init_insert_out /tmp/run_init_insert_err || true
# else
#   echo "[init-script] INSERT failed. mysql stderr:"
#   cat /tmp/run_init_insert_err || true
#   rm -f /tmp/run_init_insert_out /tmp/run_init_insert_err || true
#   exit 7
# fi

# docker cp ./init_cproduct.sql "${DB_CONTAINER}:/tmp/init_cproduct.sql"
# docker exec -i "$DB_CONTAINER" sh -c "mysql --default-character-set=utf8mb4 -uroot -p'$DB_ROOT_PASSWORD' espocrm < /tmp/init_cproduct.sql"

echo "[init-script] Done."
exit 0