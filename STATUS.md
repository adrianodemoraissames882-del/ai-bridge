# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky (Hermes).

## Última mano

- **Quién:** Dracky (Hermes)
- **Cuándo:** 2026-10-10
- **Qué:** Funnel **público ON** (decisión de Adri: la web de Lovable tiene que llegar). Auditado el front `dracky.lovable.app`: sin secretos en cliente, pero **el engranaje sigue público** (guarda `dracky_api_url`/`dracky_api_key` en localStorage) y la FAQ promete servidor propio. **API keys de Open WebUI activadas** (`auth.enable_api_keys` venía en `False`). Instalados `uv` + `honcho-cli`; wizard de Honcho verificado para Gemini.

---

## Lab (cerrado)

| Ítem | Estado |
|------|--------|
| VM Dracky-lab | OK · `adri` @ `dracky` (encendida; sin VM no hay respuestas) |
| Docker / Tailscale / Ollama / WebUI / DeepSeek | OK |
| 5 modos + comandos de tono | OK · `titanwing`/`titanicwing` y `dracky`/`draky`, **sin barra en Hermes** |
| Hermes + `~/.hermes/SOUL.md` | OK |
| Gateway Hermes | systemd de **usuario** `hermes-gateway.service` (enabled + linger) |
| Acceso a WebUI | **Público** por Funnel: `https://dracky-1.tail78f25d.ts.net` (Adri lo usa desde el móvil) |
| API de WebUI | OpenAI-compat en `/api` · exige key (401 verificado) · **API keys ya habilitadas** |
| Secrets | `~/.hermes/.env` chmod 600; no en git público |
| Memoria real del agente | `~/.hermes/memories/{MEMORY,USER}.md` — el `~/.hermes/MEMORY.md` es doc |
| Recuperación | `RESTORE.md` + `backup.sh` + cron domingos 03:00 (slim 62 KB) |
| Honcho | `uv` + `honcho-cli` instalados · stack **sin arrancar** (falta instantánea + key Gemini) |

## Hecho (2026-10-10, Dracky)

- **Front `dracky.lovable.app`** — auditoría del código servido (no renderizado: Chromium de Hermes roto, faltan 12 libs):
  - Sin secretos en cliente (0 `DRACKY_API` / `ts.net` / `sk-`); único JWT = anon key de Supabase (correcto)
  - RLS probada con la anon key contra 8 tablas típicas → todas 404 `PGRST205` (sin fuga fácil)
  - **Engranaje público**: `aria-label="Configuración de Dracky"`, guarda `dracky_api_url` + `dracky_api_key` en localStorage y prueba contra `/api/dracky-test`
  - FAQ pública promete "conecta tu propio servidor" y un "antivirus inteligente" → contradice la decisión de quitar el engranaje
  - `POST /api/chat` → **500** (backend sin enchufar) · sin cabecera CSP · conversaciones en localStorage
- **Open WebUI**: `auth.enable_api_keys` estaba en `False` por defecto → activado en `webui.db` (copia previa en `~/dracky-recovery/backups/webui.db.bak-*`) + reinicio verificado. Ya se puede crear API key para Lovable.
- **Honcho**: `uv 0.13.0` + `honcho-cli 0.2.0` instalados. Verificado en el código del wizard: soporta `gemini` como provider **y** como transporte de embeddings; los defaults de `config.toml.example` son **OpenAI** (`gpt-5.4-mini`, `text-embedding-3-small`, dims 1536). `honcho start --setup` **exige TTY** → lo tiene que correr Adri.
- **Recursos medidos**: 7,3 GiB RAM (5,7 libres) · swap 4 GiB · 55 GB disco · 4 núcleos · Open WebUI solo consume 1,59 GiB.

## Correcciones al tracker (importante)

1. La variable de Gemini es **`LLM_GEMINI_API_KEY`**, no `GEMINI_API_KEY`.
2. **Infisical no está instalado** en la VM → la key va al `.env` del perfil de Honcho (`~/.honcho/profiles/`).
3. Los defaults de Honcho **no** son "Gemini + Anthropic + OpenAI": son **OpenAI**; sin wizard, Gemini solo falla.
4. WebUI 0.11.4 **no tiene 2FA**, y sus API keys venían **desactivadas** (por eso no se podía crear la key de Lovable).
5. En Hermes los comandos de tono van **sin barra** (el gateway intercepta cualquier `/desconocido`).
6. **El DNS/egress de la VM miente** sobre el alcance público (NAT de VirtualBox): verificar por TLS contra el ingress de Tailscale con SNI real, o desde el móvil. Un `dig @1.1.1.1` desde dentro da NXDOMAIN aunque la web funcione.

## Pendiente (ordenado)

1. **Instantánea VirtualBox `pre-honcho`** desde el HOST (el invitado no tiene `VBoxManage`).
2. **Key de Gemini** (Adri) → `honcho start --setup basic` en terminal real → `honcho doctor --json` → revisar el `.env` del perfil.
3. `hermes memory setup honcho` → URL `http://localhost:8000`, token **en blanco** → `hermes honcho status`.
4. Extender `backup.sh` con los volúmenes de Honcho (Postgres/Redis).
5. **Front**: quitar engranaje + claves en localStorage + `/api/dracky-test`; reescribir FAQ; exigir sesión válida en `/api/chat`; añadir CSP.
6. **Lovable secrets**: `DRACKY_API_URL=https://dracky-1.tail78f25d.ts.net/api` · `DRACKY_API_KEY=<api key WebUI>` · `DRACKY_MODEL=deepseek-flash` (id, no `ARCANO`).
7. **Rotar contraseñas**: VM (último cambio 28 sep) y WebUI — ambas escritas en chat, y el login es público.
8. Chromium de Hermes roto (12 libs) — instalarlas si se quiere revisión visual del front.

## Mensaje para la siguiente IA

Grok/Claude: el engranaje sigue en producción y las API keys de WebUI estaban capadas — no son teorías, están verificadas en el código y en la BD. Antes de tocar memoria o red, leed `RESTORE.md`: el lab ya tiene kit de recuperación y el Funnel es público por decisión de Adri, no un descuido. Para Honcho, el wizard exige TTY y la key va como `LLM_GEMINI_API_KEY`.

## No tocar

- Repo **`dracky`** (Lovable) sin OK explícito de Adri
- API keys en commits
- `OLLAMA_HOST` a `127.0.0.1` (rompe Open WebUI)

## Para Claude (actualizado)

1. Leer `SOUL.md`, `MEMORY.md`, `STATUS.md`, `LOG.md`, `RESTORE.md` en este repo (si el conector no ve privado → Adri pega texto).
2. **No** indicar `cd ~/ai-bridge` en la VM.
3. Respuestas cortas (plan gratis Claude).
