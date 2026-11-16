#!/usr/bin/env bash
# Non-destructive validation; does not build or start Db2/catalog.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"
echo "=== IBM hybrid modernization environment validation ==="
ok=0
for f in scripts-docker/docker-compose-monolith-db2.yml \
         scripts-docker/docker-compose-postgres-catalog.yml \
         scripts-docker/docker-compose-kafka.yml \
         scripts-docker/docker-compose-catalog.yml; do
  echo "[INFO] parsing $f"
  if docker compose -f "$f" config >/dev/null; then
    echo "[PASS] $f"
    ok=$((ok+1))
  else
    echo "[FAIL] $f"
  fi
done
echo "[INFO] docker ps (informational)"
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' 2>/dev/null | head -n 30 || true
echo "[WARN] Startup not claimed; compose parse checks only"
echo "Parsed OK count: $ok"
