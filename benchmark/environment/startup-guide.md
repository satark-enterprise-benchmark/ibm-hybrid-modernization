# Startup guide — IBM hybrid modernization

> **Phase 1: Startup not verified.**

## Suggested catalog-strangler sequence (upstream)

1. `./benchmark/scripts/check-prerequisites.sh`
2. `sh scripts/install-dojo.sh`
3. `sh scripts-docker/build-and-run-monolith-db2.sh`
4. `sh scripts-docker/run-database-postgres-catalog.sh`
5. `sh scripts-docker/run-kafka.sh`
6. `sh scripts-docker/build-and-run-catalog.sh`
7. Open http://localhost/CustomerOrderServicesWeb and http://localhost/explorer
8. Exercise curls from root README (Category/Product)

## Stop

```bash
sh scripts-docker/stop-everything.sh
# or stop-services.sh / stop-monolith-db2.sh as appropriate
```

## Verification checklist (future)

- [ ] Db2 accepting connections
- [ ] Monolith UI loads
- [ ] `GET /jaxrs/Customer` returns customer JSON with address
- [ ] Catalog routes return Quarkus log lines
- [ ] Kafka message on price update

**None verified in Phase 1.**
