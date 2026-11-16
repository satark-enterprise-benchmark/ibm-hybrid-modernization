# Technology stack — IBM hybrid modernization

| Layer | Technology | Evidence |
|-------|------------|----------|
| Legacy app server | WebSphere Liberty / Open Liberty | `monolith-liberty`, `monolith-open-liberty`, `server.xml` |
| Legacy APIs | JAX-RS, EJB-style services, JPA | `CustomerOrderResource`, `persistence.xml` |
| UI | Dojo Toolkit (installed via script) | `scripts/install-dojo.sh`, `frontend-dojo` |
| Strangler | Quarkus **1.1.1.Final** | `catalog/pom.xml` |
| Catalog persistence | Hibernate ORM Panache + PostgreSQL JDBC | quarkus extensions |
| Catalog API | RESTEasy + JSON-B | quarkus-resteasy-jsonb |
| Messaging | Kafka 2.5 (Strimzi image), SmallRye Reactive Messaging, Vert.x Kafka client | compose + `ProductResource` |
| Monolith DB | IBM Db2 `orderdb` | `db2/`, compose `storefront-db2` |
| Edge | nginx reverse proxy | `proxy/*.conf` |
| API exploration | Quarkus Swagger UI `/explorer` | `application.properties` |
| Containers | Docker + Compose v3.5 files | `scripts-docker/` |
| License | Apache-2.0 | `LICENSE` |

## Age / risk

Quarkus 1.1.1 and Kafka 2.5-era images are **old**. Expect dependency and platform friction on modern Docker hosts (especially arm64). Phase 1 did not validate image pulls.
