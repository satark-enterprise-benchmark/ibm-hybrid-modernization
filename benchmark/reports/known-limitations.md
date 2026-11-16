# Known limitations — IBM hybrid modernization

1. **Official IBM upstream 404** — using yeekangc fallback approved by user.
2. **Incomplete WIP mirror** — README says work in progress; parity with original IBM sample unknown.
3. **Startup not verified** in Phase 1.
4. **Maven and Java missing** on inspection host.
5. **Privileged Db2** requirement may be blocked in hardened Docker environments.
6. **arm64** compatibility of Db2/Liberty images unknown.
7. **Quarkus 1.1.1** is obsolete — may not build on modern JDK without changes (changes are out of scope for Phase 1 docs-only).
8. **`docker-compose.yml`** under scripts-docker looks inconsistent with this sample.
9. **Transformation Advisor** docs are non-portable personal notes.
10. **Credit/contact PII tables** exist in SQL but API coverage is unclear — do not assume end-to-end card flows work.
11. **No Db2 CDC**; async path is product-price only.
12. **Hibernate drop-and-create** on catalog destroys Postgres state each start.
