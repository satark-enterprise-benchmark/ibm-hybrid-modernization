# Architecture overview — IBM hybrid modernization

## Patterns present

| Pattern | Implementation |
|---------|------------------|
| Modular monolith | `monolith-liberty`, `monolith-open-liberty` EAR/WAR/EJB layout |
| UI/backend split | `frontend-dojo` + backend Liberty + `proxy` nginx |
| Strangler fig | `catalog` Quarkus service + nginx path routing for Category/Product |
| Dual database | Db2 `orderdb` + Postgres for catalog |
| Eventing | Kafka topic `product-price-updated` |

## Runtime topology (strangled mode)

```
Browser → nginx (proxy)
            ├─ /CustomerOrderServicesWeb/jaxrs/Category|Product → Quarkus catalog :8082
            ├─ /explorer, /openapi → catalog Swagger
            └─ other /CustomerOrderServicesWeb/** → Open Liberty backend
         → Db2 orderdb (monolith JPA)
         → Postgres (catalog Panache entities)
         → Kafka (price update produce/consume)
```

## Monolith internal layers

- **Web**: JAX-RS `CustomerOrderResource`, `CategoryResource`, `ProductResource`
- **EJB/services**: `CustomerOrderServices`, `ProductSearchService`
- **Domain**: JPA entities under `org.pwte.example.domain`
- **Persistence**: `persistence.xml` + Db2

## Trust boundaries

| Boundary | Notes |
|----------|-------|
| nginx → services | Path-based routing; HTTP on :80 |
| Monolith → Db2 | JDBC via Liberty datasource config (`server.xml`) |
| Catalog → Postgres | Quarkus datasource in `application.properties` |
| Catalog ↔ Kafka | Vert.x producer + SmallRye `@Incoming` |
| Customer PII | Remains in monolith/Db2 during catalog strangulation |

## WIP / inconsistent pieces

- Root README is unfinished.
- `scripts-docker/docker-compose.yml` references `articles` / unrelated image names — prefer the named compose files (`docker-compose-monolith-*.yml`, `docker-compose-catalog.yml`, etc.).
