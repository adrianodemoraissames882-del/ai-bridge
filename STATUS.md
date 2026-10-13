# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky (Hermes).

## Última mano

- **Quién:** Dracky (Hermes)
- **Cuándo:** 2026-10-13
- **Qué:** **Honcho operativo**. SDK `honcho-ai==2.2.0` instalado en el python de Hermes, stack local arriba y sano (api/database/redis `healthy`, deriver `running`), `hermes honcho status` OK. **Bug corregido:** el wizard dejó las embeddings en **OpenAI** (`text-embedding-3-small`) → movidas a Gemini. Dreams OFF. Prueba funcional: `message_embeddings` 0→1 con vector de 1536 dims y cero errores en el deriver. **Pendiente único:** reiniciar el gateway de Hermes.

---

## Lab (cerrado)

| Ítem | Estado |
|------|--------|
| VM Dracky-lab | OK · `adri` @ `dracky` (encendida; sin VM no hay respuestas) |
| Docker / Tailscale / Ollama / WebUI / DeepSeek | OK |
| 5 modos + comandos de tono | OK · `titanwing`/`titanicwing` y `dracky`/`draky`, **sin barra en Hermes** |
| Hermes + `~/.hermes/SOUL.md` | OK |
| Gateway Hermes | systemd de **usuario** (enabled + linger) · **necesita reinicio** para cargar Honcho |
| Acceso a WebUI | **Público** por Funnel: `https://dracky-1.tail78f25d.ts.net` |
| API de WebUI | OpenAI-compat en `/api` · exige key (401 verificado) · API keys **ya habilitadas** |
| Memoria | built-in (`MEMORY.md`/`USER.md`) + **Honcho local** (`memory.provider: honcho`) |
| Honcho | Stack Docker local: api, deriver, Postgres, Redis · `http://127.0.0.1:8000` · `AUTH_USE_AUTH=false` |
| Recuperación | `RESTORE.md` + `backup.sh` + cron domingos 03:00 (**no** cubre volúmenes de Honcho aún) |
| Secrets | `~/.hermes/.env` chmod 600; no en git público |

## Hecho (2026-10-13, Dracky)

- `honcho-cli 0.2.0` (vía `uv`) y stack local levantado por Adri con el wizard (perfil `local`, 4 contenedores sanos).
- SDK `honcho-ai==2.2.0` instalado **en el python de Hermes** (`~/.hermes/tools/python-*/bin/python3`).
- Wizard: `gemini` para deriver, summary, dream (deduction + induction) y los 5 niveles de dialectic (`gemini-2.0-flash`).
- **Fallo encontrado y corregido:** `[embedding]` seguía en **OpenAI** (`transport=openai`, `text-embedding-3-small`). Sin key de OpenAI, el deriver habría fallado al primer mensaje real. Añadido en `~/.honcho/profiles/local/.env` (con copia `.env.bak-*`):
  `EMBEDDING_MODEL_CONFIG__TRANSPORT=gemini`, `EMBEDDING_MODEL_CONFIG__MODEL=gemini-embedding-001`, `DREAM_ENABLED=false`.
  Reinicio del stack sin borrar datos (`honcho stop && honcho start`).
- **Verificación funcional**: mensaje de prueba → `message_embeddings` 0→1, `vector_dims = 1536`, deriver sin errores. `honcho status`: api/database/redis `healthy`, deriver `running`.
- `hermes honcho status` OK: workspace `Dracky`, peers `Adriano`/`Dracky`, recall `hybrid`, contexto `uncapped`, dialectic cada 2 turnos. `memory.provider: honcho` presente en `config.yaml`.
- Sigue vigente lo del 2026-10-10: **API keys de Open WebUI activadas** y auditoría del front `dracky.lovable.app`.

## Correcciones al tracker (acumuladas)

1. La variable de Gemini es **`LLM_GEMINI_API_KEY`**; **Infisical no está instalado** en la VM.
2. Los defaults de Honcho son **OpenAI**. El wizard cambia a Gemini los módulos de chat/razonamiento **pero NO las embeddings** → hay que añadirlas a mano (es el fallo que rompía el deriver).
3. `honcho start --setup` **exige TTY** (no lo puede lanzar un agente).
4. SDK de Honcho en Hermes: el lanzador `hermes` es un script **`/bin/sh`**, no un shebang de Python. Instalar con
   `uv pip install --python ~/.hermes/tools/python-*/bin/python3 'honcho-ai==2.2.0'`.
5. WebUI 0.11.4 **sin 2FA**; sus API keys venían **desactivadas** (`auth.enable_api_keys` ausente → `False`).
6. En Hermes los comandos de tono van **sin barra**.
7. El **DNS/egress de la VM miente** sobre el alcance público (NAT VirtualBox): verificar por TLS contra el ingress con SNI real, o desde el móvil.
8. Los **dreams vienen ON por defecto** en Honcho y consumen cuota del proveedor.

## Pendiente (ordenado)

1. **Reiniciar el gateway** (`systemctl --user restart hermes-gateway`) → luego verificar que el proveedor carga y que los peers acumulan.
2. Extender `backup.sh` con los volúmenes de Honcho (Postgres/Redis).
3. **Front**: quitar engranaje + claves en localStorage + `/api/dracky-test`; reescribir FAQ; exigir sesión válida en `/api/chat`; añadir CSP.
4. **Lovable secrets**: `DRACKY_API_URL=https://dracky-1.tail78f25d.ts.net/api` · `DRACKY_API_KEY=<api key WebUI>` · `DRACKY_MODEL=deepseek-flash` (id, no `ARCANO`).
5. **Rotar contraseñas**: VM (último cambio 28 sep) y WebUI — ambas escritas en chat y el login es público.
6. Chromium de Hermes roto (faltan 12 libs) — instalarlas si se quiere revisión visual del front.

## Mensaje para la siguiente IA

Grok/Claude: Honcho está montado y **verificado con una prueba real**, no de oído — pero las embeddings venían en OpenAI y eso rompía el deriver; está corregido y anotado arriba. Falta solo el reinicio del gateway, que es de Adri. El engranaje del front sigue en producción y las contraseñas siguen sin rotar.

## No tocar

- Repo **`dracky`** (Lovable) sin OK explícito de Adri
- API keys en commits
- `OLLAMA_HOST` a `127.0.0.1` (rompe Open WebUI)

## Para Claude (actualizado)

1. Leer `SOUL.md`, `MEMORY.md`, `STATUS.md`, `LOG.md`, `RESTORE.md` en este repo (si el conector no ve privado → Adri pega texto).
2. **No** indicar `cd ~/ai-bridge` en la VM.
3. Respuestas cortas (plan gratis Claude).
