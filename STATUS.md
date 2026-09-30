# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude. Actualizar al final de cada sesión útil.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-09-30
- **Qué hizo:** Lab base operativo. Open WebUI + DeepSeek + 5 modos + `/titanwing`/`/draky`. Siguiente: instalar **Hermes Agent**. **No tocar repo `dracky` (Lovable).**

---

## Lab — estado actual (2026-09-30)

| Ítem | Estado |
|------|--------|
| VM **Dracky-lab** | Ubuntu Server, user `adri`, host `dracky` |
| Docker | OK (`docker` en groups) |
| Tailscale | OK — IP lab ~`100.66.109.25` |
| Ollama | OK — `*:11434` / `0.0.0.0`, CPU-only en VM |
| Open WebUI | OK — `http://100.66.109.25:3000`, login hecho |
| DeepSeek API | Conectada en WebUI (OpenAI-compat `https://api.deepseek.com/v1`) |
| Modelos base | llama3.2:3b, qwen2.5:3b, DeepSeek-V4-Pro, DeepSeek-V4.1-Flash, Arena |
| **5 modos Dracky** | Creados (base **única** cada uno) + REGLA no-validar |
| `/titanwing` + `/draky` | En system prompts (personalidad off/on; reglas del modo se mantienen) |
| Hermes Agent | **Pendiente instalar** |
| Instantáneas | Hacer `2026-09-30-pre-hermes` antes de Hermes; luego `…-hermes-ok` |

### Asignación modos → base (no reutilizar)

| Modo | Base |
|------|------|
| RÚNICO | DeepSeek-V4-Pro |
| ARCANO | DeepSeek-V4.1-Flash |
| FULMÍNEO | llama3.2:3b |
| ÍGNEO | qwen2.5:3b |
| ETÉREO | Arena Model (o llava si se prefiere visión) |

### Stack lab objetivo

Ubuntu + Tailscale + Ollama + Open WebUI + **Hermes** + DeepSeek (API) + local fallback.

### Lecciones

- No tocar **`dracky`** (Lovable) sin OK explícito.
- Ollama override: `Environment=` correcto; verificar `ss` → no solo 127.0.0.1.
- Anotar passwords WebUI/Linux día 1.
- Instantáneas datadas.

Histórico: `INCIDENT_HERMES_ROLLBACK.md`.

---

## Contexto usuario

- Adriano / Darcko · `adrianodemoraissames882@gmail.com` · GH `adrianodemoraissames882-del` · SMR · HP Victus 15L

---

## Dracky producto

IA compañero dragón. Web: https://dracky.lovable.app (solo Lovable UI).  
APIs: Ollama local → DeepSeek → (Groq opcional).

---

## GitHub

| Repo | Uso |
|------|-----|
| **ai-bridge** | Handoff Grok↔Claude |
| **dracky** | Lovable — **NO tocar** |
| **dracky-hub** | Docs web |
| **Darcko** | Profile README |

---

## Hecho

- [x] Rebuild VM desde cero (sept 2026)
- [x] Docker, Tailscale, Ollama 0.0.0.0, Open WebUI
- [x] DeepSeek en Connections
- [x] 5 modos + REGLA + /titanwing /draky
- [x] Chat local verificado

## Pendiente

1. Instantánea pre-Hermes
2. **Instalar Hermes** (install.sh oficial + setup DeepSeek; messaging Skip de momento)
3. Instantánea post-Hermes
4. SOUL.md personalidad Dracky en Hermes (opcional)
5. Web Lovable solo si el usuario lo pide

## No tocar

- Repo `dracky` sin petición explícita
- Secretos en git

## Enlaces

| Qué | URL |
|-----|-----|
| ai-bridge | https://github.com/adrianodemoraissames882-del/ai-bridge |
| Hermes docs install | https://hermes-agent.nousresearch.com/docs/ |
| Web | https://dracky.lovable.app |

## Mensaje para la siguiente IA

1. Leer este STATUS.
2. Lab casi completo; falta Hermes en VM `dracky`.
3. Install: `curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash` luego `hermes setup` con DeepSeek.
4. **No** modificar `dracky` (Lovable).
