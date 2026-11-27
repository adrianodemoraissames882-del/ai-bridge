# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky.
> **Regla doble agente:** todo avance → STATUS + LOG (SCRIPT_IA.md §0).
> **NO** tocar repo `dracky` (Lovable) sin OK de Adri.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-11-27
- **Qué:** **SSH Cachy → VM OK.** `ssh-copy-id` + login `adri@100.66.109.25` sin fricción. Red: Cachy `100.99.177.2`, VM `100.66.109.25`. Siguiente: comprobar servicios lab en VM (Ollama/WebUI) desde Cachy o empezar stack nativo en Cachy.

---

## Red Tailscale

| Nodo | IP | Estado |
|------|-----|--------|
| cachyos-x8664-1 (Cachy) | 100.99.177.2 | online · sshd · clave adri@cachy |
| dracky-1 (VM) | 100.66.109.25 | online · **SSH desde Cachy ✅** |

```bash
# Desde Cachy
ssh adri@100.66.109.25
```

---

## Hecho reciente

- Dual boot Cachy + Windows
- Tailscale en Cachy
- sshd + ed25519 en Cachy
- SSH Cachy→VM por clave
- Passwords VM/WebUI rotadas (antes)
- Clavis desinstalado

## Pendiente (prioridad)

1. Desde Cachy: `curl -s http://100.66.109.25:3000` / o navigar Open WebUI; `ssh` + `systemctl status ollama` / `docker ps`.
2. Decidir: mantener lab en VM un tiempo vs migrar nativo a Cachy.
3. (Opcional) Borrar nodo offline `cachyos-x8664` en Tailscale admin.
4. MagicDNS warning — no bloquea.
5. Brave marcadores; Lovable solo con OK.

## Enlaces

| Qué | URL / comando |
|-----|----------------|
| Web | https://dracky.lovable.app |
| Funnel | https://dracky-1.tail78f25d.ts.net |
| Bridge | https://github.com/adrianodemoraissames882-del/ai-bridge |
| SSH VM | `ssh adri@100.66.109.25` |
| SSH Cachy | `ssh adriano@100.99.177.2` |

## Mensaje para la siguiente IA

SSH lab operativo Cachy↔VM. Adri contento. Siguiente lógico: healthcheck WebUI/Ollama en VM o plan migración nativa Cachy.
