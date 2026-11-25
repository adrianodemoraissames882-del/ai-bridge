# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky (Hermes).
> Repo **ai-bridge** = solo estado/handoff. **NO** tocar repo `dracky` (Lovable) sin OK de Adri.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-11-25
- **Qué:** Adri confirma **Clavis desinstalado**. Dual boot sigue OK. Claude solo pudo leer STATUS (límite de peticiones) y quedó desfasado; el bridge ya tenía Nov-23. Rol Cachy vs Windows aclarado. Siguiente prioritario: **rotar passwords** VM + Open WebUI.

---

## Lab VM Dracky (operativo — última foto Oct 2026)

| Ítem | Estado |
|------|--------|
| VM Dracky-lab (Ubuntu, VirtualBox) | OK · user `adri` @ host `dracky` |
| Docker / Tailscale / Ollama `0.0.0.0:11434` / Open WebUI | OK |
| DeepSeek API (principal) + Groq (respaldo) | OK |
| 5 modos Open WebUI | OK · RÚNICO / FULMÍNEO / ÍGNEO / ARCANO / ETÉREO |
| Personalidad Dracky + regla no-validar + `/titanwing` `/draky` | OK |
| Hermes + SOUL + gateway | OK · Honcho provider |
| Funnel WebUI | `https://dracky-1.tail78f25d.ts.net` (revalidar) |
| Honcho stack | healthy · workspace **Dracky** |
| RAG | Open WebUI Knowledge **draky-docs** |
| Backup lab / Honcho | cron dom 03:00 / diario 04:00 |

---

## CachyOS (host físico)

| Ítem | Estado |
|------|--------|
| Dual boot Windows 11 + CachyOS | ✅ Hecho |
| Clavis Shell | ❌ **Desinstalado** (Adri 2026-11-25) — no reintentar salvo petición |
| Stack Cachy actual | VS Code, VirtualBox, yazi, cava, Brave, terminal rice |
| Brave bookmarks IA/Dracky | Pendiente |

### Rol del dual boot (acuerdo práctico)

| Sistema | Para qué |
|---------|----------|
| **Windows 11** | Fortnite, Minecraft Launcher (Microsoft Store), Word/Office y similares, juegos con anticheat/Easy Anti-Cheat, apps de tienda MS |
| **CachyOS** | Dev (VS Code, terminal, yazi, cava), VirtualBox + lab Dracky, Tailscale, Brave, rice, herramientas Linux que en Windows no hay o van peor |

No hace falta que Cachy sustituya el gaming Windows. Son roles complementarios.

---

## Pendiente (prioridad)

1. **Rotar contraseñas** VM (`passwd`) + Open WebUI (Ajustes → Cuenta). No pegarlas en chats.
2. Instantánea VirtualBox estable si aún no.
3. Brave en Cachy: carpetas marcadores **IA** y **Dracky** (ver CACHY.md).
4. Front Lovable solo si Adri pide.
5. Modelos grandes → tras SSD 2TB.

---

## No tocar

- Repo **`dracky`** (Lovable) sin OK de Adri
- API keys en commits
- `OLLAMA_HOST=127.0.0.1` (mantener `0.0.0.0:11434`)
- Reinstalar Honcho/RAG / Clavis sin petición

## Mensaje para Claude / Grok

Leer **STATUS.md** (esta versión 2026-11-25) + **LOG.md** + **CACHY.md**.  
Clavis **abandonado**. Dual boot con roles claros Windows=gaming/Office, Cachy=dev/lab.  
Siguiente: rotar passwords lab. No reabrir Fase 3 memoria.
