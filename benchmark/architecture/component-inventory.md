# Component inventory — IBM hybrid modernization

## Top-level components

| Path | Role |
|------|------|
| `monolith-liberty/` | WebSphere Liberty monolith (includes tests) |
| `monolith-open-liberty/` | Open Liberty variant of monolith |
| `frontend-dojo/` | Separated Dojo UI + Liberty packaging |
| `catalog/` | Quarkus strangler for Category/Product |
| `db2/` | Db2 Dockerfile, `createOrderDB.sql`, seed scripts, OCP YAML |
| `proxy/` | nginx Dockerfiles + conf per topology |
| `scripts/` | `install-dojo.sh` |
| `scripts-docker/` | Build/run/stop shell scripts + compose files |
| `documentation/` | Sparse notes (Transformation Advisor) |
| `postman.json` | API collection for Customer/Product paths |

## Catalog Quarkus classes

| Class | Role |
|-------|------|
| `CategoryResource` | GET categories |
| `ProductResource` | GET by category; PUT price + Kafka emit |
| `ProductPriceChanged` | `@Incoming("product-price-updated")` consumer |
| `Category`, `Product`, `ProductCategory` | Panache entities |

## Monolith domain entities

`AbstractCustomer`, `ResidentialCustomer`, `BusinessCustomer`, `Address`, `Order`, `LineItem`, `Product`, `Category`, …

## Explicit gaps

- No complete narrative docs / architecture guide in-repo (WIP).
- Transformation Advisor payloads not shipped.
- ~92 Java files / ~420 total files — smaller than a full enterprise sample; some IBM original assets may be missing from this mirror.
