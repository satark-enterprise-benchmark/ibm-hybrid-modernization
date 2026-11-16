# API → database mapping — IBM hybrid modernization

## Monolith JAX-RS (Liberty)

Base: `/CustomerOrderServicesWeb/jaxrs/` (see `postman.json` and resources).

| API (representative) | Backend | Database |
|----------------------|---------|----------|
| `GET /Customer` | `CustomerOrderResource` | Db2 `CUSTOMER` (+ address fields), open `ORDERS` |
| `PUT /Customer/Address` | customer services | Db2 customer address columns |
| `.../Customer/OpenOrder/LineItem` | order services | Db2 `ORDERS`, `LINE_ITEM` |
| `GET /Customer/Orders` | order history | Db2 `ORDERS` |
| `GET /Category` (monolith mode) | `CategoryResource` | Db2 `CATEGORY` |
| `GET /Product/?categoryId=` (monolith mode) | `ProductResource` | Db2 `PRODUCT` / `PROD_CAT` |

## Quarkus catalog (strangler)

| API | Handler | Database |
|-----|---------|----------|
| `GET /CustomerOrderServicesWeb/jaxrs/Category` | `CategoryResource` | Postgres `category` |
| `GET /CustomerOrderServicesWeb/jaxrs/Product?categoryId=` | `ProductResource` | Postgres `product` / `productcategory` |
| `PUT /CustomerOrderServicesWeb/jaxrs/Product/{id}` | `ProductResource.update` | Postgres `product` + Kafka event |

## Unmapped / unavailable

- Exact Liberty datasource JNDI names and runtime JDBC URLs were not live-checked.
- Whether REST APIs touch `CREDIT_INFO` / `CONTACT_NUMBERS` is **not confirmed** from the limited resource methods reviewed — tables exist in SQL regardless.
