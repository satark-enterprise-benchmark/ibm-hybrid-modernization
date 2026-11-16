# Troubleshooting — IBM hybrid modernization

## WIP repository

If scripts fail, assume **mirror incompleteness** before assuming operator error. Root README is unfinished.

## Common risk areas

| Issue | Guidance |
|-------|----------|
| Official IBM repo 404 | Expected — this fork uses yeekangc source |
| arm64 image failures | Db2/Liberty may need platform emulation — untested |
| Privileged Db2 denied | Docker security settings must allow privileged containers |
| Kafka advertised listeners | README: change for host-side Quarkus dev |
| `drop-and-create` wipes catalog | Quarkus property resets Postgres schema each start |
| Wrong compose file | Avoid ambiguous `scripts-docker/docker-compose.yml` |
| Missing Dojo | Run `scripts/install-dojo.sh` before UI builds |
| Maven/Java missing | Install before any `build-and-run-*.sh` |

## Transformation Advisor doc

`documentation/TransformationAdvisor.md` references another author's local paths — **not usable** as-is in this clone.
