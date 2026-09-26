# INCIDENTE — Hermes install → rollback instantánea mayo 2026

**Fecha doc:** 2026-09-26 (Grok)  
**Ámbito:** VM Ubuntu “Dracky” en VirtualBox + Open WebUI + Ollama + Hermes  
**Usuario:** Adri (`adrianodemoraissames882@gmail.com`)

---

## Resumen ejecutivo

Se instaló **Hermes Agent** con éxito en septiembre 2026. Luego fallos de **login Open WebUI**, intentos de reset de password, crash de **VirtualBox** al recovery, y restauración de una **instantánea del 20/05/2026** que eliminó el progreso reciente. Estado actual: lab en punto antiguo, **sin contraseñas recordadas**, Ollama mal enlazado a Docker, Hermes a reinstalar.

---

## 1. Instalación Hermes (sept 2026) — lo que SÍ se completó

### Parámetros sandbox Docker (instalador Hermes)

| Parámetro | Valor acordado |
|-----------|----------------|
| Persist filesystem | `yes` |
| CPU cores | `4` |
| Memory | `8192` MB (8 GB) |
| Disk | `51200` MB (**50 GB**) — con ~147 GB libres en disco VM en ese momento |
| Messaging (Telegram/Discord) | **Skip** — configurar luego con `hermes setup gateway` |

### Resultado instalador

- Mensaje: **Installation Complete**
- Usuario host: `adri@dracky`
- Paths típicos:
  - Config: `/home/adri/.hermes/config.yaml`
  - API keys: `/home/adri/.hermes/.env`
  - Data: `~/.hermes/cron/`, `sessions/`, `logs/`
  - Código: `~/.hermes/hermes-agent`
- Comandos: `hermes`, `hermes setup`, `hermes config`, `hermes gateway install`, `hermes doctor`, `source ~/.bashrc`

### Nota repo STATUS anterior

Fase 1B marcaba Hermes como pendiente; en sept. se llegó al complete y **luego se perdió** por el snapshot de mayo.

---

## 2. Fallo Open WebUI (no es “password de Ollama”)

- URL host: `http://192.168.1.137:3000` (también vía red local; “No es seguro” HTTP).
- Pantalla: **Iniciar sesión en Open WebUI**
- Email usado: `adrianodemoraissames882@gmail.com`
- **`passetg0` no es la clave de WebUI** — era la prevista del usuario Linux en la instalación Ubuntu.
- Ollama **no** usa password en `:11434` por defecto.

### Errores al resetear (aprendizaje)

| Intento | Error / resultado |
|---------|-------------------|
| `docker exec … sqlite3 …` | `sqlite3: executable file not found in $PATH` dentro del contenedor |
| `UPDATE user SET password = …` | `sqlite3.OperationalError: no such column: password` |
| Tabla correcta | **`auth`** (columnas: `id`, `email`, `password`, `active`) |
| `UPDATE auth …` + hash | `filas tocadas: 1`, SELECT muestra email + hash `$2b$12$…` |
| Login con `admin123` tras restart | Sigue: **“The email or password provided is incorrect”** |
| Hash de prueba generado en contenedor | `$2b$12$Vh9eNu6ucSbiCYwUi.jz0tMPuxQgIvjx9RiJRkd/3qBVPq1D442` (para `admin123`) — verificar siempre con `bcrypt.checkpw` |

### Script de reset recomendado (cuando haya acceso Docker)

```bash
docker start open-webui 2>/dev/null || true
docker exec -it open-webui python3 -c "
import sqlite3, bcrypt
conn = sqlite3.connect('/app/backend/data/webui.db')
c = conn.cursor()
email = 'adrianodemoraissames882@gmail.com'
plain = 'admin123'
new_hash = bcrypt.hashpw(plain.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
c.execute('UPDATE auth SET password = ?, active = 1 WHERE email = ?', (new_hash, email))
print('auth rows:', c.rowcount)
row = c.execute('SELECT email, password, active FROM auth WHERE email = ?', (email,)).fetchone()
ok = bcrypt.checkpw(plain.encode('utf-8'), row[1].encode('utf-8')) if row else False
print('checkpw:', ok)
conn.commit()
conn.close()
"
docker restart open-webui
```

Exigir **`checkpw: True`** y **`auth rows: 1`** antes de confiar en el login.  
Si `auth rows: 0` → listar emails: `SELECT email FROM auth;`

Doc oficial: https://docs.openwebui.com/troubleshooting/password-reset (tabla `auth`; a veces `htpasswd -bnBC 10`).

---

## 3. Contraseñas Linux / sudo

| Clave | Estado |
|-------|--------|
| `passetg0` (pedida en install Ubuntu) | **No fiable** — falló en login y en `sudo` en varios intentos |
| `passwd` sin argumentos | Pide *current password* → inútil sin la vieja |
| `sudo passwd adri` | Ideal si `sudo` funciona; si no, recovery |
| Tras snapshot mayo | Usuario **no recuerda ninguna** |

### Recovery (si VirtualBox no crashea)

1. Reiniciar VM → Esc/Shift → Advanced → recovery → root shell  
2. `mount -o remount,rw /`  
3. `passwd adri` → nueva clave anotada  
4. `sync && reboot -f`

### Si VirtualBox crashea (visto en host Windows)

Error tipo: *VirtualBoxVM.exe — la instrucción … la memoria no se pudo written*.

- Cerrar VBoxSVC/VirtualBoxVM, restaurar otra instantánea, desactivar 3D, bajar CPUs/RAM de la VM.  
- Alternativa: arrancar **ISO Ubuntu live**, montar disco, `chroot`, `passwd adri`.

**Usuario de login correcto:** `adri` (no `dracky` = hostname; no usar la password como login).

---

## 4. Ollama y Docker (post-snapshot y antes)

Síntoma recurrente:

```text
ss -tlnp | grep 11434
LISTEN ... 127.0.0.1:11434
```

Aunque exista:

`/etc/systemd/system/ollama.service.d/override.conf`

```ini
[Service]
Environment="OLLAMA_HOST=0.0.0.0"
Environment="OLLAMA_ORIGINS=*"
```

- `curl http://0.0.0.0:11434` puede decir “Ollama is running” pero Docker (`172.17.0.1:11434`) falla si solo escucha localhost.
- Tras editar override: `daemon-reload` + **`restart`** (no solo start) + `pkill ollama` si hace falta.
- Verificar: `systemctl show ollama -p Environment` y `ss` debe mostrar `0.0.0.0:11434` o `*:11434`.

Open WebUI ↔ Ollama: host gateway / `host.docker.internal` / IP del host en `docker0` solo útil si Ollama no está preso en 127.0.0.1.

---

## 5. Rollback instantánea

- **Fecha instantánea restaurada:** ~**20/05/2026**
- **Efecto:** pérdida de trabajo de sept. (Hermes complete, intentos de fix WebUI, configs nuevas).
- **Lección:** crear instantáneas **datadas** tras hitos (`2026-09-25-hermes-ok`) y no restaurar mayo salvo emergencia; tras recuperar acceso, snapshot inmediato.

---

## 6. Checklist de recuperación (orden)

1. [ ] Entrar a la VM (recovery/ISO) → `passwd adri` → anotar clave  
2. [ ] `docker ps -a` / `docker start open-webui`  
3. [ ] Reset WebUI (`auth` + checkpw) → login navegador  
4. [ ] Ollama `0.0.0.0` + restart + `ss`  
5. [ ] Instantánea nueva VirtualBox  
6. [ ] Reinstalar Hermes (4 CPU / 8192 RAM / 51200 disk / skip messaging)  
7. [ ] `source ~/.bashrc` ; `hermes doctor`  
8. [ ] Actualizar este STATUS cuando el lab vuelva a ser usable  

---

## 7. Qué NO hacer

- No subir passwords ni `.env` a git.  
- No `UPDATE user` para WebUI (usar `auth`).  
- No asumir que el snapshot de mayo tiene Hermes.  
- No borrar volumen `open-webui` salvo aceptar perder chats/ajustes.  

---

## 8. Referencias chat

- Regla modos Dracky: no validar por defecto.  
- Disco lab / dual-boot 2 TB: documentado en chat Grok (Cachy 300–400 GB, Windows ~1 TB).  
- Cloudflare security-audit-skill: útil pre-beta, no prioritario mientras lab esté caído.  
