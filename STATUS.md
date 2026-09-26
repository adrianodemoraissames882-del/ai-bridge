# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude. Actualizar al final de cada sesión útil.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-09-26
- **Qué hizo:** Documentó incidente completo Hermes → rollback instantánea mayo 2026 (fallos, contraseñas, Ollama, VirtualBox). Ver `INCIDENT_HERMES_ROLLBACK.md`.

---

## Estado CRÍTICO del lab (VM Ubuntu “Dracky”)

**Situación actual (2026-09-25/26):**

- Se restauró una **instantánea de VirtualBox fechada ~20/05/2026**.
- Eso **borra el progreso de septiembre** (Hermes terminado, resets de Open WebUI, etc.).
- El usuario **no recuerda** contraseña de login VM (`adri`) ni de Open WebUI.
- En la sesión post-instantánea se llegó a tener shell `adri@dracky` y `sudo` en un momento; luego se perdió el acceso al no recordar claves / reinicios.
- **Ollama** en esa foto escuchaba solo en `127.0.0.1:11434` pese a `override.conf` con `OLLAMA_HOST=0.0.0.0`.
- Open WebUI en `http://192.168.1.137:3000` — login email `adrianodemoraissames882@gmail.com`.

**Bloqueadores ya:**

1. Recuperar acceso root/`adri` (recovery GRUB o ISO live + `passwd adri`).
2. Reset password Open WebUI (tabla `auth`, no `user`; bcrypt + `checkpw`).
3. Forzar Ollama en `0.0.0.0` y verificar con `ss -tlnp | grep 11434`.
4. **Nueva instantánea** con nombre datado cuando haya login estable.
5. **Reinstalar Hermes** (el “Installation Complete” de sept. se perdió con el rollback).

Detalle de fallos y comandos: **`INCIDENT_HERMES_ROLLBACK.md`**.

---

## Contexto del usuario

- **Nombre:** Adriano (Adri)
- **Email:** adrianodemoraissames882@gmail.com
- **GitHub:** `adrianodemoraissames882-del`
- **Estudios:** SMR informática
- **PC host:** HP Victus 15L (Ryzen 5 5600G, RTX 3050 8GB, 16GB→plan 32GB, SSD 512GB→plan 2TB, Win11)
- **VM lab:** Oracle VirtualBox, Ubuntu sin GUI (servidor), hostname `dracky`, usuario previsto `adri`
- **Contraseña Linux (histórico chat):** se pidió `passetg0` en la instalación; **ya no es fiable** (falló sudo/login en varios intentos). Hay que **definir una nueva** vía recovery.

---

## Dracky — qué es

IA compañero con personalidad de dragón.

- **Regla de modos (meter en system prompts):** no validar por defecto; si algo está mal, decirlo y proponer el camino más simple.
- **5 modos:** RÚNICO · FULMÍNEO · ÍGNEO · ARCANO · ETÉREO
- **Web:** https://dracky.lovable.app
- **APIs (diseño):** Ollama → DeepSeek → Groq
- **Planes:** Free / Gamer 6.99€ / Pro 9.99€ / Business 24.99€ — sin AdSense; beta cerrada ~1 año

### Stack web (`dracky` privado)

- TS, React, Vite, Lovable, Supabase
- `.env` quitado del git; `.gitignore` con `.env`; rotar keys si hubo fuga

### Stack lab (diseño)

- VM Ubuntu + Tailscale (cuenta Adri)
- Ollama + Open WebUI + (re) Hermes Agent
- Docker para WebUI/Hermes; Ollama nativo con systemd

### Web — deuda conocida

1. Dragones estaciones: fondo blanco + alas recortadas
2. Stats/logos falsos; badge Lovable
3. SEO (lang, canonical, alt, OG, robots, schema)
4. Estaciones por fecha + hemisferio

---

## Cronología breve: Hermes → rollback (sept 2026)

1. **Instalación Hermes Agent** (Docker sandbox): CPU 4, RAM 8192 MB, Disk **51200** (50 GB), persist yes; messaging **Skip** (`hermes setup gateway` después).
2. **Installation Complete** — paths: `~/.hermes/config.yaml`, `.env`, `hermes`, `hermes doctor`, etc.
3. **Open WebUI login roto** — no es password de Ollama; es cuenta WebUI. `passetg0` no sirve ahí.
4. Intentos Claude/Grok de reset: `sqlite3` no está en el contenedor; tabla correcta es **`auth`** (no `user`).
5. UPDATE `auth` + hash bcrypt → `filas tocadas: 1` y aún así login “email or password incorrect” con `admin123`.
6. VirtualBox **crash** al intentar recovery (error memoria VirtualBoxVM.exe).
7. Restauración de **instantánea 20/05/2026** → estado antiguo; claves desconocidas; Ollama otra vez en localhost.

---

## CachyOS

Prueba rice en VM separada: **cerrada** (base OK). Dual-boot con Windows + disco 2 TB: plan documentado en chats (Cachy ~300–400 GB).

---

## GitHub

| Repo | Notas |
|------|--------|
| `ai-bridge` | Puente IAs — **este** |
| `dracky` | Código web privado |
| `draky-backup` | Backup |
| profile README | `adrianodemoraissames882-del` |

Conectores Grok: GitHub, Notion, Vercel, Voice, Automations.

Herramienta útil vista: [cloudflare/security-audit-skill](https://github.com/cloudflare/security-audit-skill) (audit multi-fase; para Claude/Hermes antes de beta).

---

## Hecho (alto nivel)

- [x] ai-bridge + SCRIPT + MODPACK stub
- [x] Profile + limpieza `.env` en `dracky`
- [x] CachyOS rice prueba
- [x] Hermes llegó a “Installation Complete” en sept. (**perdido** por snapshot mayo)
- [x] Documentado incidente rollback (este update)

## Pendiente (prioridad real)

1. **Lab:** recovery/ISO → `passwd adri` (clave anotada)
2. **Lab:** reset Open WebUI (`auth` + bcrypt + `checkpw: True`) → login `admin123` u otra anotada
3. **Lab:** Ollama `OLLAMA_HOST=0.0.0.0` + `systemctl restart` + `ss` no solo 127.0.0.1
4. **Lab:** instantánea nueva datada (no depender de mayo 2026)
5. **Lab:** reinstalar Hermes (mismos params: 4 CPU, 8 GB, 50 GB disk, skip messaging)
6. Web Lovable: dragones + credibilidad/SEO
7. Rotar API keys si aplica; modpack cuando toque

## No tocar

- Secretos en git
- Borrar `dracky` / `draky-backup` sin OK del usuario
- Instantáneas: no restaurar mayo otra vez sin backup del estado bueno

## Enlaces

| Qué | URL |
|-----|-----|
| ai-bridge | https://github.com/adrianodemoraissames882-del/ai-bridge |
| INCIDENTE | https://github.com/adrianodemoraissames882-del/ai-bridge/blob/main/INCIDENT_HERMES_ROLLBACK.md |
| Web | https://dracky.lovable.app |
| security-audit-skill | https://github.com/cloudflare/security-audit-skill |

## Mensaje para la siguiente IA

1. Leer `STATUS.md` + **`INCIDENT_HERMES_ROLLBACK.md`**.
2. Prioridad: **desbloquear VM** (passwd) → Open WebUI → Ollama 0.0.0.0 → snapshot → Hermes de nuevo.
3. No asumir que Hermes sigue instalado ni que `passetg0` / `admin123` funcionan hasta verificar.
4. Web Lovable solo si el usuario lo pide explícito; el lab está roto por rollback.
