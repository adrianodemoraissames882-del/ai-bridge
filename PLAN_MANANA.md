# Plan mañana (post 2026-09-30)

Lab base **cerrado**. No reinstalar Ubuntu/Ollama/WebUI/Hermes salvo rotura.

## Checklist

- [ ] Instantánea VBox `2026-09-30-hermes-ok` (si falta)
- [ ] Probar Hermes: 1 tarea con terminal o archivos
- [ ] Probar WebUI: 1 modo (ARCANO) + `/titanwing`
- [ ] (Opcional) `hermes update`
- [ ] (Opcional) Telegram: `hermes gateway setup` cuando Adri quiera
- [ ] (Opcional) Image/Video gen: API FAL/OpenRouter + `hermes setup` / tools
- [ ] Lovable: **solo si Adri lo pide** — en la UI de Lovable, no tocar git `dracky` a ciegas

## Comandos rápidos VM

```bash
# Estado
docker ps
ss -tlnp | grep 11434
tailscale status
hermes doctor

# Arrancar chat agente
hermes

# WebUI
# http://100.66.109.25:3000  (IP Tailscale; confirmar con: tailscale ip -4)
```

## Para Claude

Repo: https://github.com/adrianodemoraissames882-del/ai-bridge  
Leer: STATUS.md · PLAN_MANANA.md · LOG.md · HERMES_INSTALL.md
