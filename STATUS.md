# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky (Hermes).

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-10-14
- **Qué:** **Honcho cerrado de punta a punta.** Gateway reiniciado (`systemctl --user restart hermes-gateway`). `hermes honcho status` → Enabled True, workspace Dracky, peers Adriano/Dracky, hybrid, uncapped, dialectic cada 2 turnos. Prueba de memoria OK (Fortnite + SMR recordados). Funnel `https://dracky-1.tail78f25d.ts.net` → Open WebUI. Secrets Lovable ya puestos; chat web OK según Adri. **Siguiente:** confirmar `~/.hermes/honcho.json` (Paso 5 workspaces), RAG Open WebUI (Paso 6), extender backup volúmenes Honcho (Paso 7).

---

## Lab (cerrado / operativo)

| Ítem | Estado |
|------|--------|
| VM Dracky-lab | OK · `adri` @ `dracky` |
| Docker / Tailscale / Ollama / WebUI / DeepSeek | OK |
| 5 modos + comandos tono | OK · en WebUI con personalidad; Hermes sin barra |
| Hermes + SOUL | OK |
| Gateway Hermes | systemd usuario · **reiniciado 2026-10-13** · Honcho activo |
| Acceso WebUI | Público Funnel: `https://dracky-1.tail78f25d.ts.net` (proxy → 127.0.0.1:3000) |
| API WebUI | OpenAI-compat · keys habilitadas · secrets en Lovable |
| Memoria | Honcho local (`memory.provider: honcho`) · peers acumulando tras 1ª conversación |
| Honcho stack | Docker: api, deriver, Postgres, Redis · healthy · `http://127.0.0.1:8000` · AUTH off |
| Embeddings | **Gemini** (`gemini-embedding-001`) — ya no OpenAI |
| Dreams | OFF |
| Lovable front | Secrets OK · chat backend OK (según Adri 2026-10-13) |
| Recuperación | `RESTORE.md` + `backup.sh` · **aún no** cubre volúmenes Honcho |

## Hecho desde 2026-10-13 → 2026-10-14

- Reinicio gateway → plugin Honcho carga.
- `hermes honcho status` OK post-restart.
- Prueba memoria Telegram/gateway: recuerda Fortnite + SMR.
- Confirmado Funnel + Open WebUI healthy `0.0.0.0:3000→8080`.
- IP Tailscale lab: `100.66.109.25` · hostname `dracky-1`.
- Secrets Lovable (`DRACKY_API_URL` / `DRACKY_API_KEY` / `DRACKY_MODEL`) ya configurados por Adri.

## Tracker Fase 3 — verdad operativa (no marcar optimista)

| Tarea | Estado real |
|-------|-------------|
| Honcho (Postgres + pgvector + Redis) | ✅ |
| Gemini para Honcho (deriver/dialectic/embeddings) | ✅ |
| Honcho UI visual | ❌ no instalada (no necesaria; gasta RAM) |
| Gemini análisis vídeo | ❌ no configurado |
| Workspaces | 🔄 un workspace `Dracky` + peers Adriano/Dracky (bastante; confirmar honcho.json) |
| RAG ChromaDB aparte | ❌ usar RAG nativo Open WebUI (Paso 6) |
| Backup GitHub / cron | 🔄 backup.sh existe; **falta** volúmenes Honcho |
| Script recuperación | 🔄 RESTORE.md existe; actualizar tras backup Honcho |
| Auto-actualización | ❌ a mano mensualmente |
| Qwen2.5:14b | ❌ tras SSD 2TB |

## Pendiente (ordenado — plan Claude + Grok)

1. **Paso 5:** `cat ~/.hermes/honcho.json` (sin claves) → confirmar workspace/peers → marcar workspaces en tracker.
2. **Paso 6 RAG:** Open WebUI → Workspace → Conocimiento `draky-docs` → subir doc → probar con `#`.
3. **Paso 7:** Extender `backup.sh` + `RESTORE.md` con volúmenes Honcho (Postgres/Redis). No subir `.env` ni tokens.
4. Rotar contraseñas VM + Open WebUI (siguen en chats; login Funnel público).
5. Front restante (si aplica): engranaje/localStorage, FAQ, CSP, `/api/chat` endurecido.
6. Instantánea VirtualBox recomendada post-Honcho estable (`post-honcho-ok`).

## Correcciones al tracker (siguen vigentes)

1. Variable Gemini: **`LLM_GEMINI_API_KEY`**; Infisical **no** instalado.
2. Wizard Honcho deja embeddings en **OpenAI** aunque elijas Gemini → hay que forzar Gemini a mano.
3. `honcho start --setup` exige TTY.
4. SDK: `hermes` es `/bin/sh` → `uv pip install --python ~/.hermes/tools/python-*/bin/python3 'honcho-ai==2.2.0'`.
5. WebUI sin 2FA; API keys había que activarlas.
6. Comandos tono en Hermes **sin barra**.
7. DNS/egress VM miente (NAT VirtualBox).
8. Dreams ON por defecto → dejar OFF hasta validar.
9. **No** instalar Honcho UI ni ChromaDB aparte salvo necesidad explícita.

## No tocar

- Repo **`dracky`** (Lovable) sin OK explícito de Adri
- API keys en commits
- `OLLAMA_HOST` a `127.0.0.1` (rompe Open WebUI)

## Repos / directorios (mapa para Claude)

| Dónde | Qué |
|-------|-----|
| `adrianodemoraissames882-del/ai-bridge` (este repo) | STATUS, LOG, SOUL, MEMORY, RESTORE, backup.sh, handoff Grok↔Claude |
| `adrianodemoraissames882-del/dracky` | Código web Lovable — **no tocar** sin OK Adri |
| VM `~/.hermes/` | config.yaml, SOUL.md, honcho.json, .env |
| VM `~/.honcho/` | perfiles local, .env embeddings |
| VM Docker | open-webui, honcho-local-{api,deriver,database,redis} |
| Funnel | `https://dracky-1.tail78f25d.ts.net` → :3000 |

## Mensaje corto para la siguiente IA

Honcho **cerrado y probado**. Lovable secrets + chat OK. Siguiente: Paso 5 (honcho.json) → Paso 6 RAG WebUI → Paso 7 backup volúmenes Honcho. No reinstalar Honcho. No tocar repo `dracky` Lovable.
