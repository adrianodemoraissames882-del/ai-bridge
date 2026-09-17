# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude. Actualizar al final de cada sesión útil.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-09-17
- **Qué hizo:** STATUS completo con historial Dracky + CachyOS + GitHub; creado `MODPACK.md` (stub; se hablará después).

---

## Contexto del usuario

- **Nombre:** Adriano (Adri)
- **Email (cuenta):** adrianodemoraissames882@gmail.com
- **GitHub:** `adrianodemoraissames882-del` (display name a veces “Darcko”)
- **Estudios:** SMR informática
- **PC host:** HP Victus 15L (Ryzen 5 5600G, RTX 3050 8GB, 16GB RAM → plan 32GB, SSD 512GB → plan 2TB, Win11). Uso: gaming, VMs, programación, fangames Pokémon, emulación.

---

## Dracky — qué es

IA compañero con **personalidad de dragón** (no “Jarvis genérico”).

- **Nombre:** Dracky / Draky (web: Dracky)
- **Tono:** majestuoso; serio o ligero según el pedido; de vez en cuando “alma propia”; relación tipo Hipo–Desdentado; curioso, un poco cascarrabias, sabio; proactivo y eficiente.
- **Regla de modos:** no validar por defecto si algo está mal; decirlo y proponer el camino más simple.
- **5 modos:** RÚNICO (análisis) · FULMÍNEO (velocidad) · ÍGNEO (creatividad) · ARCANO (código) · ETÉREO (visión)
- **Web:** https://dracky.lovable.app
- **Logo:** escudo hexagonal, dragón low-poly morado/azul, núcleo cian, runas — documentado en chats previos.
- **APIs en cascada (diseño):** Ollama → DeepSeek → Groq (y otras según fase)
- **Monetización prevista:** Free / Gamer 6.99€ / Pro 9.99€ / Business 24.99€ — sin AdSense; beta cerrada ~1 año con invitaciones.
- **Diferenciador:** IA compañero para gamers, privada, personalidad propia.

### Stack web (repo `dracky`, privado)

- TypeScript, React, Vite, Lovable, Supabase
- Hay carpeta `.lovable`, `src`, `public`, `supabase`
- **Hecho en git:** quitado `.env` del árbol; `.gitignore` ignora `.env`; README de proyecto añadido
- **Pendiente seguridad:** rotar keys si el `.env` antiguo tuvo secretos reales

### Stack lab / backend (diseño tracker)

- VM Ubuntu (Dracky) + Tailscale (cuenta Adri)
- Ollama en `0.0.0.0:11434`, Open WebUI, personalidad en WebUI
- DeepSeek + Groq conectados en fases anteriores
- **Fase 1B pendiente fuerte:** Hermes Agent (Docker), SOUL.md / MEMORY.md, skills, Telegram/WhatsApp según plan
- Docker útil para WebUI, Hermes, DB, n8n; Ollama puede ir nativo
- Voz prevista: Kokoro / Kokoro-FastAPI
- Acceso remoto: Tailscale; móvil posible con Conduit u Open WebUI PWA

### Web — bugs / deuda conocida

1. Dragones por estación (`dragon-spring/summer/autumn/winter.webp`): **fondo blanco** y **alas recortadas** en el canvas.
2. Stats falsas (“40+ países”, etc.) y logos falsos “Confían en Dracky”.
3. Badge “Edit with Lovable”.
4. SEO: lang=es, canonical, alt, OG, robots/sitemap, Schema.org.
5. Estaciones por **fecha + hemisferio**, no cambio prematuro.
6. Dropdown de modos estable.

Prompts Lovable ya redactados en chat con Grok (estadísticas, logos, API link, 404, SEO, estaciones, dropdown).

### Tracker

- Existió tracker React v10–v12+ en chats Claude (fases 1…11).
- **Fuente operativa ahora:** este `STATUS.md` + issues en `ai-bridge`.
- Notion conectado a Grok (opcional como tracker vivo).

---

## CachyOS — lab

- **Objetivo:** probar distro + rice KDE (no dual-boot obligatorio aún).
- **Entorno:** Oracle VirtualBox, usuario tipo `adri`.
- **Hecho:** install CachyOS+KDE; yay; docker/utils; CLI (btop, fastfetch, eza…); Catppuccin donde se pudo; **zsh + Oh My Zsh + Powerlevel10k** (wizard: Lean/estilo según elección, Unicode, few icons, transient, etc.); fastfetch en `.zshrc`.
- **Prueba de rice:** considerada **cerrada** (base OK).
- **Opcional después:** Meslo Nerd Font; gaming-meta solo si dual-boot real; Ollama en Cachy si se usa esta VM para Dracky.
- **Repos útiles GH:** CachyOS/linux-cachyos, CachyOS-Settings, wiki; para Dracky: ollama, open-webui, NousResearch/hermes-agent, Kokoro-FastAPI, local-ai-packaged.

---

## GitHub (estado repos)

| Repo | Notas |
|------|--------|
| `ai-bridge` | Puente IAs — **este** |
| `dracky` | Código web privado |
| `draky-backup` | Backup privado |
| `adrianodemoraissames882-del` | Profile README |
| `Adriano` | Eliminado (era “Hola”) |

Conectores Grok útiles: GitHub, Notion, Vercel, Voice, Automations.

---

## Hecho (checklist corto)

- [x] ai-bridge + SCRIPT_IA + handoff template
- [x] Profile README
- [x] Limpieza git `dracky` (.env fuera, gitignore, README)
- [x] CachyOS VM rice base
- [x] Documentación puente actualizada (esta revisión)
- [x] Stub modpack → `MODPACK.md`

## Pendiente (prioridad)

1. Lovable: dragones sin blanco ni recortes
2. Lovable: credibilidad + SEO + badge
3. Lab: Hermes + memoria (Fase 1B)
4. Rotar API keys si aplica
5. Conversación **modpack** → rellenar `MODPACK.md`
6. Opcional: Meslo font; Notion tracker; Vercel si sale de Lovable

## No tocar

- Secretos en git
- Borrar `dracky` / `draky-backup` sin OK del usuario

## Enlaces

| Qué | URL |
|-----|-----|
| ai-bridge | https://github.com/adrianodemoraissames882-del/ai-bridge |
| STATUS | https://github.com/adrianodemoraissames882-del/ai-bridge/blob/main/STATUS.md |
| MODPACK | https://github.com/adrianodemoraissames882-del/ai-bridge/blob/main/MODPACK.md |
| dracky (código) | https://github.com/adrianodemoraissames882-del/dracky |
| Web | https://dracky.lovable.app |

## Mensaje para la siguiente IA

1. Leer `STATUS.md` + `SCRIPT_IA.md`.
2. Si el usuario habla de **modpack**, ir a `MODPACK.md` (aún incompleto a propósito).
3. Si sigue Dracky web → pendientes 1–2 (Lovable).
4. Si sigue agente → Hermes / Fase 1B.
