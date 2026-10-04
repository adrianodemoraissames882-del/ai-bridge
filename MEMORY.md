# MEMORY — Dracky largo plazo (documento)

> NOTA DE HERMES: este fichero es **documentación** para el repo `ai-bridge`.
> La memoria viva que Hermes inyecta en cada sesión está en:
>   `~/.hermes/memories/MEMORY.md`  (notas del agente, límite 2200 chars)
>   `~/.hermes/memories/USER.md`    (perfil del usuario, límite 1375 chars)
> Copiar este fichero a `~/.hermes/MEMORY.md` NO restaura la memoria del agente.

## Sobre Adri
- Estudia SMR (informática)
- PC: HP Victus 15L, Ryzen 5 5600G, RTX 3050 8GB, 16GB RAM (plan upgrade RAM/SSD)
- Proyecto principal: **Dracky** — IA compañero con personalidad de dragón
- Email/GitHub: adrianodemoraissames882@gmail.com · adrianodemoraissames882-del

## Decisiones clave
- Stack LLMs: Ollama local → DeepSeek (principal) → Groq opcional
- Web: https://dracky.lovable.app (Lovable + Supabase) — repo `dracky` **no tocar** sin OK explícito
- Infra lab: VM Ubuntu en VirtualBox (hostname `dracky`, user `adri`) + Tailscale
- Agente: Hermes Agent + SOUL.md; Open WebUI con 5 modos
- Monetización (diseño): planes Free/Gamer/Pro/Business, sin AdSense
- Beta cerrada ~1 año antes del lanzamiento público (diseño). Sin acceso público: Tailscale serve privado.

## 5 modos (Open WebUI)
| Modo | Base |
|------|------|
| RÚNICO | DeepSeek-V4-Pro |
| ARCANO | DeepSeek-V4.1-Flash |
| FULMÍNEO | llama3.2:3b |
| ÍGNEO | qwen2.5:3b |
| ETÉREO | Arena (o llava) |

## Regla fundamental
Dracky **no valida por defecto**. Si algo está mal lo dice directo y propone el camino más simple.

## Comandos de tono
- `titanwing` / `titanicwing` — personalidad off (IA seria; reglas de calidad se mantienen)
- `dracky` / `draky` — personalidad on
- En Hermes (CLI/Telegram) **sin** barra inicial; con barra los intercepta el gateway.

## Lab (verificado 2026-10-04)
- Gateway Hermes: systemd de **usuario** `hermes-gateway.service` (enabled + linger). Sin VM encendida no hay respuestas.
- Open WebUI: Docker `open-webui`, `3000`→`8080`, volumen `open-webui` montado en `/app/backend/data`.
- Ollama: `OLLAMA_HOST=0.0.0.0:11434` + `OLLAMA_ORIGINS=*` en `/etc/systemd/system/ollama.service.d/override.conf`
  (lo necesita el contenedor vía `host.docker.internal`; NO cambiar a 127.0.0.1).
- Tailscale: Funnel público **desactivado**; `tailscale serve --bg 3000` (solo tailnet). `OperatorUser=adri`.
- `gh` autenticado como adrianodemoraissames882-del.

## Secretos
- API keys solo en `~/.hermes/.env` (chmod 600) y Connections de WebUI
- **Nunca** en este repo ni en commits
