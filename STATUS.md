# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude. Actualizar al final de cada sesión útil.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-09-29
- **Qué hizo:** Lab reconstruido desde cero. VM vieja borrada. Nueva **Dracky-lab** con Ubuntu Server instalado (usuario `adri`, hostname `dracky`, OpenSSH). Empieza stack: apt → Docker → Tailscale → Ollama → Open WebUI → Hermes. **No tocar repo `dracky` (Lovable).**

---

## Lab — estado actual (2026-09-29)

| Ítem | Estado |
|------|--------|
| VM antigua (bloqueada / snapshot mayo) | **Eliminada** |
| VM nueva **Dracky-lab** | **Ubuntu instalado** |
| Usuario / host | `adri` @ `dracky` |
| OpenSSH | Instalado en el setup |
| Disco | ~80–87 GB VDI, LVM (ampliar root si quedó ~42G libre) |
| RAM / CPU VBox | 8 GB / 4 CPUs recomendado |
| Docker / Tailscale / Ollama / WebUI / Hermes | **Pendiente instalar ahora** |

### Orden de instalación (en curso)

1. [ ] `timedatectl` NTP + `apt update && upgrade`
2. [ ] Ampliar LVM si `/` ~42G y hay free en VG
3. [ ] Docker + grupo docker
4. [ ] Tailscale (cuenta Adri)
5. [ ] Ollama + `OLLAMA_HOST=0.0.0.0:11434` (palabra **Environment** correcta)
6. [ ] Open WebUI (Docker) — **anotar** email+password día 1
7. [ ] Instantánea VBox `2026-09-29-base-ok`
8. [ ] Hermes (4 CPU / 8192 RAM / 51200 disk / skip messaging)
9. [ ] Instantánea `2026-09-29-hermes-ok`

### Lecciones (no repetir)

- Anotar contraseñas Linux y Open WebUI el día 1.
- Override Ollama: `Environment=` (no typo) + `daemon-reload` + **restart** + `ss -tlnp \| grep 11434` → debe ser `0.0.0.0`, no solo `127.0.0.1`.
- WebUI ≠ Ollama (Ollama sin password).
- Instantáneas **datadas**; no restaurar basura antigua.
- **Repo `dracky` (Lovable): no tocar** salvo petición explícita del usuario.

Histórico incidente: `INCIDENT_HERMES_ROLLBACK.md`.

---

## Contexto del usuario

- **Nombre:** Adriano (Adri) / Darcko
- **Email:** adrianodemoraissames882@gmail.com
- **GitHub:** `adrianodemoraissames882-del`
- **Estudios:** SMR informática
- **PC host:** HP Victus 15L (Ryzen 5 5600G, RTX 3050 8GB, 16GB RAM, Win11)

---

## Dracky — producto

IA compañero dragón. Modos: RÚNICO · FULMÍNEO · ÍGNEO · ARCANO · ETÉREO.  
Regla: no validar por defecto; decir errores y proponer lo simple.  
Web: https://dracky.lovable.app (gestión en **Lovable**, código en repo privado `dracky`).  
APIs diseño: Ollama → DeepSeek → Groq.

### Stack lab objetivo

Ubuntu Server + Tailscale + Ollama + Open WebUI + Hermes Agent + Docker.

---

## CachyOS

Prueba rice en VM separada: **cerrada** (base OK).

---

## GitHub

| Repo | Uso | ¿Tocar? |
|------|-----|--------|
| **`ai-bridge`** | Handoff Grok↔Claude | Sí |
| **`dracky-hub`** | Docs / recuperación web | Sí (docs) |
| **`Darcko`** | Profile README | OK |
| **`dracky`** | Código Lovable | **NO** sin OK usuario |
| `draky-backup` | Backup | No borrar |

---

## Hecho

- [x] ai-bridge + incidentes documentados
- [x] CachyOS rice prueba
- [x] VM vieja eliminada; **Dracky-lab** Ubuntu limpio instalado (2026-09-29)
- [x] Profile README Darcko actualizado

## Pendiente (prioridad)

1. **Lab ahora:** NTP + apt + Docker + Tailscale + Ollama + WebUI
2. Snapshot base
3. Hermes + snapshot
4. Personalidad / 5 modos en WebUI
5. Web Lovable: solo si el usuario lo pide (arreglar en Lovable UI, no commits sueltos en `dracky`)

## No tocar

- Repo **`dracky`** (Lovable) sin petición explícita
- Secretos en git de forma innecesaria
- Borrar backups sin OK

## Enlaces

| Qué | URL |
|-----|-----|
| ai-bridge | https://github.com/adrianodemoraissames882-del/ai-bridge |
| INCIDENTE (histórico) | https://github.com/adrianodemoraissames882-del/ai-bridge/blob/main/INCIDENT_HERMES_ROLLBACK.md |
| Web | https://dracky.lovable.app |

## Mensaje para la siguiente IA

1. Leer este `STATUS.md`.
2. Lab = **VM nueva** ya con Ubuntu; instalar stack en orden (apt→Docker→Tailscale→Ollama 0.0.0.0→WebUI→snapshot→Hermes).
3. **No modificar** `adrianodemoraissames882-del/dracky`.
4. Contraseñas: las que el usuario anotó en el instalador (no asumir `passetg0`).
