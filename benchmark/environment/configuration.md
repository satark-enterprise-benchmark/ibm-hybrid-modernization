# Configuration — IBM hybrid modernization

## Compose files (`scripts-docker/`)

| File | Purpose |
|------|---------|
| `docker-compose-monolith-db2.yml` | Db2 |
| `docker-compose-monolith-app.yml` | Monolith app + proxy |
| `docker-compose-splitted-frontend.yml` | Split UI + Liberty backend |
| `docker-compose-splitted-frontend-open.yml` | Split UI + Open Liberty |
| `docker-compose-postgres-catalog.yml` | Postgres for catalog |
| `docker-compose-kafka.yml` | Zookeeper + Kafka |
| `docker-compose-catalog.yml` | Proxy + Open Liberty backend + frontend + catalog |
| `docker-compose.yml` | **Suspect / inconsistent** — references `articles`; avoid unless understood |

All expect external network `store-front-network`.

## Quarkus

`catalog/src/main/resources/application.properties` (+ `.template` with placeholders).

Notable: `quarkus.hibernate-orm.database.generation=drop-and-create` (destructive on restart).

## Liberty

`monolith-*/liberty/server.xml` — datasources, features, HTTP ports 9080/9443.

## nginx

`proxy/nginx-*.conf` — routing matrices per topology.

## Secrets

Db2 password `db2inst1`, Postgres `postgres/postgres` appear in compose — local demo defaults only.

## Benchmark compose overlay

Not added; upstream files are numerous. Prefer documenting/using existing named files over inventing a new overlay until Startup gate repair work begins.
