# Application data flow — IBM hybrid modernization

## Monolith mode

1. Browser loads Dojo UI (`/CustomerOrderServicesWeb`).
2. JAX-RS `Customer` APIs load customer aggregate (name, address, open order).
3. Address updates via `PUT .../Customer/Address`.
4. Cart-like open order line item add/remove/submit.
5. All persistence through JPA to Db2.

## Split frontend mode

nginx serves UI from frontend container and proxies `/CustomerOrderServicesWeb/jaxrs/` to backend Liberty.

## Strangled catalog mode

1. Same UI entrypoint.
2. `GET Category` / `GET|PUT Product` routed to Quarkus catalog (Postgres).
3. Customer/order JAX-RS remain on Liberty → Db2.
4. Product price PUT emits Kafka `product-price-updated`; catalog also consumes the channel (log/echo style processor).

## PII movement summary

| Flow | Store | Cross-service? |
|------|-------|----------------|
| Customer profile / address | Db2 | Within monolith |
| Orders | Db2 | Within monolith |
| Credit/contact tables | Db2 schema | Potentially unused by APIs — still at rest |
| Catalog product | Postgres | Strangler service |
| Price events | Kafka | Async, non-PII payload today |

Migration challenge: any future extraction of Customer service must move Db2 PII without breaking open-order consistency — **not implemented** in this WIP mirror.
