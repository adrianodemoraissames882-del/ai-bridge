# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky (Hermes).

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-10-14
- **Qué:** **Fase 3 Memoria Persistente CERRADA.** Workspaces confirmados (`honcho.json`: workspace Dracky, peers Adriano/Dracky). RAG Open WebUI (`draky-docs`) probado (responde funnel). Backup volúmenes Honcho (`pgdata`, `redis-data`, `lancedb-data`) + script `~/backups/honcho-backup.sh` + cron diario 04:00. Cron lab semanal 03:00 domingo sigue activo. **Fuera:** Honcho UI, Gemini vídeo, Qwen, auto-update. **Siguiente recomendado:** rotar passwords VM + Open WebUI.

---

## Lab (operativo)

| Ítem | Estado |
|------|--------|
| VM Dracky-lab | OK · `adri` @ `dracky` |
| Docker / Tailscale / Ollama / WebUI / DeepSeek | OK |
| 5 modos + comandos tono | OK |
| Hermes + SOUL + gateway | OK · Honcho provider activo |
| Funnel WebUI | `https://dracky-1.tail78f25d.ts.net` |
| Honcho stack | healthy · api/deriver/db/redis · embeddings Gemini · dreams OFF |
| Workspaces | **Dracky** · peers **Adriano** + **Dracky** · hybrid · dialectic 2 |
| RAG | Open WebUI Knowledge **draky-docs** · prueba OK |
| Backup lab | `~/dracky-recovery/backup.sh` · cron dom 03:00 |
| Backup Honcho | `~/backups/honcho-backup.sh` · cron diario 04:00 · 3 volúmenes |
| Secrets Lovable | OK (chat web funcionando según Adri) |

## Tracker Fase 3 — realidad

| Tarea | Estado |
|-------|--------|
| Honcho (Postgres + pgvector + Redis + LanceDB) | ✅ |
| Gemini para Honcho | ✅ |
| Workspaces | ✅ (uno: Dracky) |
| RAG (vía Open WebUI, no Chroma aparte) | ✅ |
| Backup + cron Honcho | ✅ |
| Script / pasos recuperación Honcho | ✅ (documentados; no probar encima del lab) |
| Honcho UI | ❌ no instalar |
| Gemini análisis vídeo | ❌ |
| Auto-actualización | ❌ a mano |
| Qwen2.5:14b | ❌ tras SSD |

## Pendiente (prioridad)

1. **Rotar contraseñas** VM (`adri`) y Open WebUI (login Funnel es público).
2. Instantánea VirtualBox `post-fase3-memoria-ok`.
3. Front Lovable restante solo si Adri pide (engranaje, CSP, etc.).
4. Qwen / modelos grandes → tras SSD 2TB.

## Volúmenes Honcho (backup)

- `honcho-local_pgdata`
- `honcho-local_redis-data`
- `honcho-local_lancedb-data`

Script: `/home/adri/backups/honcho-backup.sh` → `~/backups/honcho/*.tar.gz`
**No** subir tarballs a git.

## No tocar

- Repo **`dracky`** (Lovable) sin OK de Adri
- API keys en commits
- `OLLAMA_HOST=127.0.0.1`

## Mensaje para Claude / Grok

Fase 3 memoria **cerrada**. No reinstalar Honcho ni RAG. Siguiente: rotar passwords. Leer este STATUS + LOG.
