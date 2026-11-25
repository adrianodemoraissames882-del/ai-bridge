# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky (Hermes).
> Repo **ai-bridge** = solo estado/handoff. **NO** tocar repo `dracky` (Lovable) sin OK de Adri.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-11-25 (tarde)
- **Qué:** Adri confirma **passwords VM + Open WebUI ya rotadas** (no pegar en chats). Clavis desinstalado. Dual boot roles claros. Claude falló leyendo CACHY/LOG por límite de tool calls — usar un solo prompt con raw links. Pendiente: arreglar `authorized_keys` en Windows (host `dracky-ssh`) si quedó el placeholder del Set-Content.

---

## Lab VM Dracky (operativo)

| Ítem | Estado |
|------|--------|
| VM Dracky-lab (Ubuntu, VirtualBox) | OK · user `adri` @ host `dracky` |
| Docker / Tailscale / Ollama `0.0.0.0:11434` / Open WebUI | OK |
| DeepSeek (principal) + Groq | OK |
| 5 modos + personalidad + `/titanwing` `/draky` | OK |
| Hermes + SOUL + Honcho | OK (Fase 3 memoria cerrada) |
| Funnel WebUI | `https://dracky-1.tail78f25d.ts.net` (revalidar) |
| Passwords VM + Open WebUI | ✅ **Rotadas** (2026-11-25) — no documentar valor |
| RAG draky-docs + backups cron | OK |

---

## CachyOS (host físico)

| Ítem | Estado |
|------|--------|
| Dual boot Windows 11 + CachyOS | ✅ |
| Clavis | ❌ Desinstalado — no reintentar |
| Stack Cachy | VS Code, VirtualBox, yazi, cava, Brave, rice |

### Roles dual boot

| Sistema | Uso |
|---------|-----|
| **Windows 11** | Fortnite, Minecraft Launcher (MS Store), Word/Office, juegos EAC/anticheat |
| **CachyOS** | Dev (VS Code, yazi, cava), VirtualBox + lab, Tailscale, Brave, Linux tools |

Complementarios, no sustitutos.

### SSH Windows (host dracky-ssh)

Adri ejecutó mal:
`Set-Content ... authorized_keys -Value "ssh-ed25519 PEGA_AQUI_..."`
Hay que **sustituir** por la clave pública real de la máquina que debe entrar (p. ej. Cachy o la que genere `ssh-keygen`), una sola línea, Encoding ascii. Ver nota en LOG.

---

## Enlaces Dracky (producto / lab)

| Qué | URL |
|-----|-----|
| Web Lovable (casa) | https://dracky.lovable.app |
| Funnel Open WebUI | https://dracky-1.tail78f25d.ts.net |
| Bridge Grok↔Claude | https://github.com/adrianodemoraissames882-del/ai-bridge |
| Repo código web | `dracky` (privado) — **no tocar** sin OK |
| Tailscale admin | https://login.tailscale.com/admin/machines |

Hub HTML / páginas extra: Adri quiere retocar el HTML del hub; coordinar sin romper Lovable.

---

## Pendiente (prioridad)

1. ~~Rotar passwords~~ ✅
2. Arreglar `authorized_keys` en Windows si el placeholder sigue ahí.
3. Instantánea VirtualBox estable.
4. Brave marcadores IA/Dracky en Cachy.
5. Hub HTML / front Lovable solo si Adri pide.
6. Modelos grandes → tras SSD 2TB.

## No tocar

- Repo **dracky** (Lovable) sin OK
- API keys en commits
- `OLLAMA_HOST=127.0.0.1`
- Reinstalar Honcho / Clavis sin petición

## Mensaje corto para IAs

Passwords rotadas. Clavis off. Dual boot: Win=gaming/Office, Cachy=dev/lab. Leer raw STATUS+LOG+CACHY. No reabrir Fase 3.
