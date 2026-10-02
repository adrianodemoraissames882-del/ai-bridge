# MEMORY — Dracky largo plazo

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
- Beta cerrada ~1 año antes de lanzamiento público (diseño)

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
- `/titanwing` — personalidad off (IA seria; reglas de calidad se mantienen)
- `/draky` — personalidad on

## Secretos
- API keys solo en `~/.hermes/.env` (chmod 600) y Connections de WebUI
- **Nunca** en este repo ni en commits
