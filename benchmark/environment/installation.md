# Installation — IBM hybrid modernization

Phase 1 did **not** build images or install Dojo. Upstream flow (from root README):

## Common

```bash
sh scripts/install-dojo.sh
```

## Monolith

```bash
sh scripts-docker/build-and-run-monolith-db2.sh
sh scripts-docker/build-and-run-monolith-app.sh
```

Open http://localhost/CustomerOrderServicesWeb

## Split frontend variants

Use `build-and-run-splitted-frontend.sh` or `build-and-run-splitted-frontend-open.sh` after Db2.

## Strangled catalog

```bash
sh scripts-docker/build-and-run-monolith-db2.sh
sh scripts-docker/run-database-postgres-catalog.sh
sh scripts-docker/run-kafka.sh
sh scripts-docker/build-and-run-catalog.sh
```

## Local Quarkus dev

Adjust Postgres/Kafka URLs in `application.properties` and `KAFKA_ADVERTISED_LISTENERS`, then `mvn quarkus:dev`.

## Benchmark docs

Documentation-only; no extra installers under `benchmark/` beyond check scripts.
