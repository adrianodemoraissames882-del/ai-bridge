# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky (Hermes).

## Última mano

- **Quién:** Dracky (Hermes)
- **Cuándo:** 2026-10-04
- **Qué:** Funnel público **OFF** → `tailscale serve --bg 3000` (solo tailnet). `SOUL.md` y `MEMORY.md` unificados (alias de tono + formato sin barra en Hermes). Añadidos `RESTORE.md`, `backup.sh` y cron semanal en la VM. Verificado de punta a punta.

---

## Lab (cerrado)

| Ítem | Estado |
|------|--------|
| VM Dracky-lab | OK · `adri` @ `dracky` (encendida; sin VM no hay respuestas) |
| Docker / Tailscale / Ollama / WebUI / DeepSeek | OK |
| 5 modos + comandos de tono | OK · `titanwing`/`titanicwing` y `dracky`/`draky`, **sin barra en Hermes** |
| Hermes + `~/.hermes/SOUL.md` | OK |
| Gateway Hermes | systemd de **usuario** `hermes-gateway.service` (enabled + linger) |
| Acceso a WebUI | OK · **privado**: `https://dracky-1.tail78f25d.ts.net` (tailnet only) |
| Secrets | `~/.hermes/.env` chmod 600; no en git público |
| Memoria real del agente | `~/.hermes/memories/{MEMORY,USER}.md` — el `~/.hermes/MEMORY.md` es doc |
| ai-bridge SOUL/MEMORY/RESTORE/backup.sh | **En este repo** |

## Hecho (2026-10-04, Dracky)

- Funnel público desactivado + `tailscale serve --bg 3000` privado. `OperatorUser=adri`.
- `SOUL.md`: alias `titanwing|titanicwing` / `dracky|draky`, typos corregidos y regla del formato sin barra.
- `MEMORY.md`: unificado + aviso de dónde vive la memoria real de Hermes.
- `RESTORE.md` + `backup.sh` (slim 62 KB por defecto / `FULL=1` 964 MB) + cron semanal (domingos 03:00).
- Skill oficial de Tailscale instalado y verificado en la VM.
- Ollama: **no se toca** — `OLLAMA_HOST=0.0.0.0:11434` lo necesita el contenedor vía `host.docker.internal`.

## Pendiente (ordenado)

1. Probar en Telegram: mensaje al bot + `/commands` (los comandos de tono van **sin** barra).
2. Verificar la instantánea VirtualBox vigente desde el HOST (`VBoxManage snapshot "dracky" list`).
3. Tracker Fase 2 (Telegram/skills/web) solo si Adri lo pide.
4. Guardar el `.env` fuera de la VM: el backup no lo incluye a propósito.

## Mensaje para la siguiente IA

Grok: el Funnel público ya no existe — si vuelves a tocar red en la VM, parte de `~/dracky-recovery/RESTORE.md`, no de notas viejas. Claude: sigue sin haber `~/ai-bridge` en la VM, y ahora hay un tercer firmante (`Dracky`).

## No tocar

- Repo **`dracky`** (Lovable) sin OK explícito de Adri
- API keys en commits
- `OLLAMA_HOST` a `127.0.0.1` (rompe Open WebUI)

## Para Claude (actualizado)

1. Leer `SOUL.md`, `MEMORY.md`, `STATUS.md`, `LOG.md`, `RESTORE.md` en este repo (si el conector no ve privado → Adri pega texto).
2. **No** indicar `cd ~/ai-bridge` en la VM.
3. Respuestas cortas (plan gratis Claude).
