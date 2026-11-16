#!/usr/bin/env bash
# Safe prerequisite checks for IBM hybrid modernization benchmark (read-only).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"
echo "=== IBM hybrid modernization prerequisite check ==="
echo "Repo root: $ROOT"
pass=0; fail=0; warn=0
check_cmd() {
  if command -v "$1" >/dev/null 2>&1; then
    echo "[PASS] $1: $(command -v "$1")"; pass=$((pass+1))
  else
    echo "[FAIL] $1 not found"; fail=$((fail+1))
  fi
}
check_cmd docker
check_cmd git
if docker compose version >/dev/null 2>&1; then
  echo "[PASS] docker compose available"; pass=$((pass+1))
else
  echo "[FAIL] docker compose unavailable"; fail=$((fail+1))
fi
if command -v mvn >/dev/null 2>&1; then echo "[PASS] mvn"; pass=$((pass+1)); else echo "[WARN] mvn missing"; warn=$((warn+1)); fi
if command -v java >/dev/null 2>&1 && java -version >/dev/null 2>&1; then echo "[PASS] java"; pass=$((pass+1)); else echo "[WARN] usable java missing"; warn=$((warn+1)); fi
for f in README.md LICENSE scripts-docker/docker-compose-monolith-db2.yml catalog/pom.xml db2/createOrderDB.sql; do
  if [[ -e "$f" ]]; then echo "[PASS] found $f"; pass=$((pass+1)); else echo "[FAIL] missing $f"; fail=$((fail+1)); fi
done
echo "Summary: pass=$pass warn=$warn fail=$fail"
[[ "$fail" -eq 0 ]]
