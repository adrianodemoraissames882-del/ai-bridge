# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-10-02
- **Qué:** Fase 1B t18–t20 en **GitHub** (SOUL.md, MEMORY.md, memory/2026-10-02.md). Funnel OK en VM. `.env` chmod 600. **No hay `~/ai-bridge` en la VM** — Claude no debe pedir git local ahí.

---

## Lab (cerrado)

| Ítem | Estado |
|------|--------|
| VM Dracky-lab | OK · `adri` @ `dracky` |
| Docker / Tailscale / Ollama / WebUI / DeepSeek | OK |
| 5 modos + /titanwing | OK |
| Hermes + `~/.hermes/SOUL.md` | OK |
| Funnel | Probado (`dracky-1.…ts.net`); opcional para uso solo Tailscale |
| Secrets | `~/.hermes/.env` chmod 600; no en git público |
| ai-bridge SOUL/MEMORY | **En este repo** |

## No tocar

- Repo **`dracky`** (Lovable) sin OK explícito de Adri
- API keys en commits

## Para Claude

1. Leer SOUL.md, MEMORY.md, STATUS.md, LOG.md en este repo (si el conector no ve privado → Adri pega texto).
2. **No** indicar `cd ~/ai-bridge` en la VM.
3. Siguiente tracker: lo pendiente **después** de 1B memoria (Telegram/skills/web solo si Adri pide).
4. Respuestas cortas (plan gratis Claude).
