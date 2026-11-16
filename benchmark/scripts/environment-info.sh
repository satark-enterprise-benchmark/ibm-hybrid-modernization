#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"
echo "=== IBM hybrid modernization environment info ==="
echo "date: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "repo: $ROOT"
echo "git_branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unavailable)"
echo "git_sha: $(git rev-parse HEAD 2>/dev/null || echo unavailable)"
echo "uname: $(uname -a)"
echo
docker version 2>/dev/null | head -n 20 || true
docker compose version 2>/dev/null || true
java -version 2>&1 || true
mvn -version 2>&1 | head -n 5 || true
echo
echo "-- top-level --"
ls -1
echo
echo "-- scripts-docker compose files --"
ls -1 scripts-docker/docker-compose*.yml
echo
du -sh . 2>/dev/null || true
