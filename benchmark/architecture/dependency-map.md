# Dependency map — IBM hybrid modernization

## Component dependencies

```
frontend-dojo ──► nginx ──► monolith backend (Customer/Order JAX-RS)
nginx (catalog mode) ──► catalog Quarkus (Category/Product)
monolith-* ──► Db2 orderdb
catalog ──► PostgreSQL
catalog ──► Kafka (produce/consume product-price-updated)
proxy images ──► nginx conf variants
scripts-docker ──► local Docker images (storefront-*, proxy-nginx, storefront-db2)
```

## Build-time

Maven multi-module trees under each Liberty folder and `catalog/pom.xml`. Dojo assets fetched by `scripts/install-dojo.sh` before UI builds.

## Network

Compose files expect external Docker network `store-front-network` (created by scripts).

## PII dependency notes

- Customer/Address/Order PII: **monolith → Db2 only** in inspected code.
- Catalog Postgres: product/category — not customer PII.
- Kafka messages: `productId#price` strings from `ProductResource.sendMessageToKafka`.
- SQL `CREDIT_INFO` / `CONTACT_NUMBERS` depend on Db2 schema even if unused by current JAX-RS paths — still in attack/compliance surface if DB is shared.
