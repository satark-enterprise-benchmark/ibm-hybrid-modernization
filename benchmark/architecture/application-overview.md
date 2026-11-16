# Application overview — IBM hybrid modernization

## Purpose

This sample demonstrates **incremental modernization** of a Customer Order Services storefront:

1. **Monolith** on WebSphere Liberty / Open Liberty with JPA entities and JAX-RS resources, backed by **Db2** (`orderdb`).
2. **Split frontend** — Dojo UI separated from backend Liberty apps, fronted by nginx.
3. **Strangled catalog** — Category/Product APIs shifted to a **Quarkus** microservice on **PostgreSQL**, with **Kafka** `product-price-updated` events; nginx routes catalog paths to the new service while customer/order traffic remains on the monolith.

## Business domain

Customer orders for entertainment/electronics-style catalog:

- Customers (residential / business) with embedded addresses
- Orders, line items, products, categories
- SQL also defines `CREDIT_INFO`, `CONTACT_NUMBERS`, `SHIPPING_ADDRESS`, `ORDER_REC` — **high-value PII / PCI-adjacent structures** even if not all are mapped in the JPA entities reviewed

## Modernization states (from root README)

| Mode | Scripts (upstream) |
|------|--------------------|
| Monolith | `install-dojo.sh` + `build-and-run-monolith-db2.sh` + `build-and-run-monolith-app.sh` |
| Split frontend (Liberty) | … + `build-and-run-splitted-frontend.sh` |
| Split frontend (Open Liberty) | … + `build-and-run-splitted-frontend-open.sh` |
| Strangled catalog | Db2 + Postgres catalog + Kafka + `build-and-run-catalog.sh` |

## PII relevance

Monolith customer APIs expose name, address, order history; Db2 schema includes credit card tables. Catalog strangler moves product APIs off the monolith but **customer PII remains on Db2** during coexistence — a realistic dual-store governance problem. Kafka currently carries product id/price strings (low PII) but establishes the async plane for future event leakage scenarios.

## Completeness caveat

yeekangc mirror + WIP README: expect missing docs, aged Quarkus **1.1.1.Final**, and uneven scripts. Benchmark plans must account for repair work before Startup gate.
