# IBM Hybrid Modernization — Phase 1 Benchmark Documentation

Satark AI Enterprise PII Benchmark preparation for the **Java EE → Quarkus application modernization** sample (Customer Order Services), forked from the yeekangc mirror after the official IBM repository returned 404.

| Field | Value |
|-------|-------|
| Fork org | https://github.com/satark-enterprise-benchmark/ibm-hybrid-modernization |
| Originally requested | https://github.com/IBM/application-modernization-javaee-quarkus |
| Actual fork source | https://github.com/yeekangc/application-modernization-javaee-quarkus |
| Baseline SHA | `fba9759fae18697a65d021a97a90a393f7a68625` (branch `master`) |
| Acquisition | 2026-11-16T21:10:24Z |
| License | Apache-2.0 |
| Integrity note | Incomplete WIP mirror of the original IBM sample — treat gaps as first-class limitations |

## Readiness status

| Gate | Status | Notes |
|------|--------|-------|
| Inspected | **Pass** | Monolith, Open Liberty, Dojo frontend, Quarkus catalog, Db2 SQL, Kafka compose reviewed |
| Structure | **Pass** | This `benchmark/` package |
| Environment | **Partial** | Docker present; Maven missing; usable Java missing; Db2 images/scripts are heavy and untested here |
| Startup | **Not verified** | No `scripts-docker/*.sh` build/run executed in Phase 1 |

## Honesty about incompleteness

Root `README.md` begins with **“Work in Progress / to be done”**. Documentation under `documentation/` is sparse and includes machine-local Transformation Advisor notes. Some scripts and compose fragments look experimental (`docker-compose.yml` references unrelated `articles` image). Use this repo as a **coexistence / strangler PII lab**, not as a polished complete IBM sample.

## Package layout

Standard Phase 1 tree under `benchmark/` (architecture, database, data-flow, environment, diagrams, scripts, reports).

Upstream already provides multiple Compose files under `scripts-docker/`. No `docker-compose.benchmark.yml` was added.

## Scripts

```bash
./benchmark/scripts/check-prerequisites.sh
./benchmark/scripts/validate-environment.sh
./benchmark/scripts/environment-info.sh
```
