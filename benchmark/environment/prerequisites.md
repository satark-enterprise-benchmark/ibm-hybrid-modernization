# Prerequisites — IBM hybrid modernization

## Upstream-implied requirements

- Docker + Docker Compose
- Ability to run **privileged** Db2 containers (`LICENSE=accept`)
- Maven (to build Liberty/Quarkus images per scripts)
- JDK suitable for Liberty + Quarkus 1.1-era builds (exact JDK **not** pinned clearly in root README — treat as **unknown/unavailable** until validated)
- Network access to pull base images (Db2, Postgres, Strimzi Kafka, Liberty)
- `scripts/install-dojo.sh` for UI resources
- Sufficient disk/RAM for Db2 image

## Phase 1 inspection host

| Tool | Status |
|------|--------|
| Docker 29.8.0 | Present |
| Maven | **Missing** |
| Java runtime | **Unusable** (`java -version` failed) |
| Architecture | darwin arm64 — Db2/Liberty images may need emulation; **not tested** |

## Benchmark scripts

```bash
./benchmark/scripts/check-prerequisites.sh
./benchmark/scripts/validate-environment.sh
./benchmark/scripts/environment-info.sh
```
