# Shutdown guide — IBM hybrid modernization

Upstream helpers:

```bash
sh scripts-docker/stop-everything.sh
sh scripts-docker/stop-services.sh
sh scripts-docker/stop-monolith-db2.sh
```

Compose-down equivalents depend on which compose file was used; inspect the corresponding `build-and-run-*.sh` / `run-*.sh` for project names.

**Warning:** Db2 and Postgres volumes may persist data including PII seeds — scrub volumes intentionally when resetting benchmarks.

Phase 1 started no containers, so no shutdown was required.
