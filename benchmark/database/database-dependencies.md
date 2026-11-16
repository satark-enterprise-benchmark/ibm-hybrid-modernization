# Database dependencies — IBM hybrid modernization

| Application component | Database | Config location |
|-----------------------|----------|-----------------|
| monolith-liberty / open-liberty / frontend backend | Db2 `orderdb` | Liberty `server.xml` + Db2 container |
| catalog (Quarkus) | PostgreSQL `postgres` | `catalog/src/main/resources/application.properties` |
| Debezium / shared JDBC between DBs | none observed | Dual-write not implemented for customers |

## Coexistence implications

During strangler mode:

- **Product reads** for Category/Product HTTP paths go to Postgres (via nginx → catalog).
- **Customer/order PII** remains on Db2.
- Monolith still contains Product JPA entities for non-strangled deployments — dual definitions exist across modes.

## No cross-DB foreign keys

Consistency between Postgres catalog prices and Db2 product rows is **application/eventual** (Kafka price events), not referential.
