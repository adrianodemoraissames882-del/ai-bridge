# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky (Hermes).
> Repo **ai-bridge** = solo estado/handoff. **NO** tocar repo `dracky` (Lovable) sin OK de Adri.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-11-23
- **Qué:** Adri confirma **dual boot CachyOS + Windows hecho**. Actualización de bridge con todo el tramo reciente (rebuild lab, modos, Hermes path, Cachy, Clavis fallido, bookmarks Brave). Lab Dracky (VM) según estado Oct: Fase 3 memoria cerrada; no deshacer Honcho/RAG.

---

## Lab VM Dracky (operativo — última foto Oct 2026)

| Ítem | Estado |
|------|--------|
| VM Dracky-lab (Ubuntu, VirtualBox) | OK · user `adri` @ host `dracky` |
| Docker / Tailscale / Ollama `0.0.0.0:11434` / Open WebUI | OK |
| DeepSeek API (principal) + Groq (respaldo) | OK |
| 5 modos Open WebUI | OK · RÚNICO / FULMÍNEO / ÍGNEO / ARCANO / ETÉREO |
| Personalidad Dracky + regla no-validar + `/titanwing` `/draky` | OK (confirmado por Adri) |
| Hermes + SOUL + gateway | OK · Honcho provider |
| Funnel WebUI | `https://dracky-1.tail78f25d.ts.net` (verificar IP Tailscale actual) |
| Honcho stack | healthy · workspace **Dracky** · peers Adriano/Dracky |
| RAG | Open WebUI Knowledge **draky-docs** |
| Backup lab | `~/dracky-recovery/backup.sh` · cron dom 03:00 |
| Backup Honcho | `~/backups/honcho-backup.sh` · cron 04:00 |

### Rebuild histórico (Sep 2026)

Tras snapshot mayo y pérdida de passwd: VM **desde cero** (Ubuntu 26.04), Docker, Tailscale, Ollama override systemd, Open WebUI, DeepSeek connection UI, 5 custom models con system prompts reforzados, luego Hermes. Ver `INCIDENT_HERMES_ROLLBACK.md` + `RESTORE.md`.

---

## CachyOS (host físico — Nov 2026)

| Ítem | Estado |
|------|--------|
| Dual boot Windows 11 + CachyOS | ✅ **Hecho** (Adri 2026-11-23) |
| Rice / zsh / p10k / catppuccin / fastfetch | Hecho en prueba anterior (VM/sesión) |
| Clavis Shell (niri + quickshell + key-cli) | ⚠️ **Bloqueado** |
| Brave bookmarks (carpetas IA / Dracky) | Pendiente montar en Cachy |

### Incidente Clavis (2026-11-18)

- `curl …/StatIndet/quickshell/main/install.sh \| bash` instala bien niri, quickshell, deps Cachy.
- **Falla al final** empaquetando/registrando `key-cli`: el instalador hace `pacman -Qp` sobre  
  `key-cli-…-x86_64.pkg.tar.zst` y en CachyOS el artefacto no cuadra (arch `x86_64` vs `x86_64_v3` / path limpio en `/tmp`).
- `/tmp/clavis-build-*` se borra al fallar → no hay `.pkg.tar.zst` para `pacman -U` a mano.
- **Workaround documentado:** instalar key-cli desde source:
  ```bash
  git clone --branch v2026.9.25 --depth 1 https://github.com/StatIndet/key-cli.git
  cd key-cli && ./scripts/install.sh
  ```
  (instala en `/usr/local`, sin el bug de arch del instalador one-shot).
- Alternativas tipo Clavis si no se quiere pelear: shells Hyprland (Clave, Caelestia) o quedarse en Plasma Cachy.

Detalle: ver `CACHY.md`.

---

## Tracker fases (resumen realidad)

| Fase | Estado |
|------|--------|
| 1 Base VM + Ollama + WebUI + DeepSeek + 5 modos | ✅ |
| 1B Hermes + SOUL + memoria archivos | ✅ (lab) |
| 3 Memoria Honcho + RAG + backups | ✅ cerrada 2026-10-14 |
| Web Lovable / SEO / logos falsos | Parcial — **no tocar repo dracky** sin Adri |
| Cachy dual boot | ✅ |
| Clavis en Cachy | ⚠️ key-cli |
| Qwen grandes / SSD 2TB / mercado | Pendiente |

---

## Pendiente (prioridad)

1. **Rotar contraseñas** VM `adri` + Open WebUI (Funnel/público).
2. Instantánea VirtualBox estable si aún no (`post-fase3` o posterior).
3. En Cachy: completar **key-cli** source *o* abandonar Clavis y documentar alternativa.
4. Brave en Cachy: carpetas marcadores **IA** y **Dracky** (ver CACHY.md).
5. Front Lovable solo si Adri pide (engranaje, CSP, stats falsas, etc.).
6. Modelos grandes → tras SSD 2TB.

---

## No tocar

- Repo **`dracky`** (código Lovable) sin OK explícito de Adri
- API keys en commits
- Forzar `OLLAMA_HOST=127.0.0.1` (debe ser `0.0.0.0:11434`)
- Reinstalar Honcho/RAG sin necesidad

## Credenciales / IDs útiles (sin secretos)

- Email lab / WebUI: `adrianodemoraissames882@gmail.com`
- Tailnet / Funnel histórico: `dracky-1.tail78f25d.ts.net` — **revalidar** con `tailscale status`
- Personalidad: dragón Dracky/Draky, gruñón sabio, relación tipo Hipo–Desdentado; comandos `/titanwing` (tono neutro) y `/draky` (vuelve personalidad)

## Mensaje para Claude / Grok

Leer **STATUS.md** + **LOG.md** + **CACHY.md** + **SCRIPT_IA.md**.  
Lab memoria Fase 3 **no reabrir**. Host: dual boot Cachy listo; Clavis a medias. Siguiente práctico: passwords lab y/o key-cli en Cachy.
