# Repository assessment — IBM hybrid modernization

## Verdict

**Useful but incomplete** hybrid-modernization PII benchmark. The coexistence story (Db2 customer PII + Postgres catalog + Kafka) is exactly on-theme; the yeekangc WIP mirror and aged stack reduce Environment/Startup confidence.

## Strengths

- Explicit strangler routing in nginx
- Rich Db2 DDL including credit/contact tables
- Multiple deployment topologies scripted
- Postman collection for smoke APIs

## Weaknesses

- WIP README / thin documentation
- Quarkus 1.1 / old Kafka images
- Possible missing upstream assets vs original IBM repo
- Inconsistent compose file present
- Heavy Db2 privileged dependency
- Customer domain not yet extracted (PII still monolith-bound)

## Readiness

| Gate | Status |
|------|--------|
| Inspected | Pass |
| Structure | Pass |
| Environment | Partial |
| Startup | Not verified |
