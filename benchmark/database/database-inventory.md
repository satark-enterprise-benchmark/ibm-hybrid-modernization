# Database inventory — IBM hybrid modernization

## 1. IBM Db2 — `orderdb`

- Defined in `db2/createOrderDB.sql`, seeded via `orderdb-data.sql` / `populateDB.sh`.
- Container: `scripts-docker/docker-compose-monolith-db2.yml` image `storefront-db2`, ports 5000/50000/60000, `DB2INST1_PASSWORD=db2inst1`, `LICENSE=accept`, **privileged**.
- Primary store for customer, order, product (monolith), and related tables.

## 2. PostgreSQL — catalog

- `scripts-docker/docker-compose-postgres-catalog.yml` — image `postgres`, db/user/password `postgres`, port 5432.
- Quarkus `quarkus.datasource.url=jdbc:postgresql://postgres:5432/postgres` with `drop-and-create` + `import.sql`.

## 3. Messaging (not a DB, listed for completeness)

Kafka + Zookeeper via `docker-compose-kafka.yml`.

## PII classification (Db2)

| Table | PII / sensitive content |
|-------|-------------------------|
| `CUSTOMER` | name, username, address columns, type-specific attributes |
| `SHIPPING_ADDRESS` | address PII |
| `CONTACT_NUMBERS` | phone numbers |
| `CREDIT_INFO` | card number, name, sec number, expiry, billing address |
| `ORDER_REC` | links orders to credit info + address lines |
| `ORDERS` / `LINE_ITEM` | customer-linked commerce data |
| `FAVORITES` | customer-linked |

Catalog Postgres tables (`category`, `product`, …) are product data from `import.sql`.
