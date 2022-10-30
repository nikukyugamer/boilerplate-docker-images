#!/usr/env/bin -bash
set -exuo pipefail

echo "GRANT ALL ON *.* TO '"$MYSQL_USER"'@'%' ;" | "${mysql[@]}"
echo 'FLUSH PRIVILEGES ;' | "${mysql[@]}"
