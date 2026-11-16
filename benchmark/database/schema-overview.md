# Schema overview — IBM hybrid modernization

## Db2 (`db2/createOrderDB.sql`)

### CUSTOMER

Columns include `CUSTOMER_ID`, `USERNAME`, `OPEN_ORDER`, `NAME`, business flags/description, residential household/frequent flags, `TYPE`, and embedded address columns (`ADDRESSLINE1/2`, `CITY`, `COUNTRY`, `STATE`, `ZIP`).

JPA: `AbstractCustomer` + `@Embedded Address` + inheritance (`RESIDENTIAL` / `BUSINESS`).

### ORDERS / LINE_ITEM / PRODUCT / CATEGORY / PROD_CAT

Standard order-line-product-category model with identity PKs and FKs as in SQL file.

### Additional SQL tables (important for PII benchmarks)

Present in SQL DDL; **not all have matching JPA entities** in the Open Liberty domain package reviewed:

- `CREDIT_INFO` — payment card fields + address
- `CONTACT_NUMBERS` — phone per customer/type
- `SHIPPING_ADDRESS` — per-customer shipping addresses
- `ORDER_REC` — order receipt / payment linkage
- `FAVORITES`

### Live schema verification

**Unavailable** — Db2 was not started in Phase 1.

## Postgres (catalog)

Hibernate `drop-and-create` from Panache entities + `import.sql` seed categories/products. Schema is ephemeral per container recreate.

## orm.xml

`monolith-open-liberty/.../orm.xml` is effectively empty — mappings are annotation-driven.
