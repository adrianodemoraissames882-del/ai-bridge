# RESTORE — Recuperar el lab Dracky

Verificado **desde dentro** de la VM `dracky` (adri@dracky) el **2026-10-04**.
Los comandos de este documento se han ejecutado tal cual, salvo los marcados *(HOST)*, que
solo pueden ejecutarse en la máquina anfitriona (VirtualBox).

---

## 0. Qué es recuperable por git y qué NO

| Elemento | ¿En git (ai-bridge)? | Dónde vive de verdad |
|---|---|---|
| `SOUL.md` — personalidad | Sí | `~/.hermes/SOUL.md` (Hermes lo lee siempre) |
| `MEMORY.md` — documento | Sí | `~/.hermes/MEMORY.md` — **Hermes NO lo lee como memoria** |
| Memoria viva del agente | **No** | `~/.hermes/memories/MEMORY.md` (2200 chars) y `~/.hermes/memories/USER.md` (1375) |
| API keys / tokens | **No, nunca** | `~/.hermes/.env` (chmod 600) — se reescribe a mano |
| Chats, usuarios y login de Open WebUI | No | volumen Docker `open-webui` → `/app/backend/data` |
| Sistema completo, Docker, Ollama, Tailscale | No | instantánea VirtualBox *(HOST)* |

> **Un `git clone` NO restaura el lab.** Restaura documentación y `SOUL.md`.
> Keys, memoria viva y volumen de WebUI van aparte — ver `backup.sh`.

---

## 1. (HOST) Restaurar la instantánea de VirtualBox

Listar y restaurar las instantáneas de la VM:

```bash
VBoxManage snapshot "dracky" list
VBoxManage snapshot "dracky" restore "2026-09-30-hermes-ok"
```

Instantáneas conocidas: `2026-09-30-pre-hermes`, `2026-09-30-hermes-ok`.
Si la instantánea elegida es vieja, este documento + `backup.sh` permiten reconstruir lo posterior.

Si se parte de Ubuntu limpio → seguir `HERMES_INSTALL.md` del repo.

---

## 2. Repo de documentación

```bash
git clone https://github.com/adrianodemoraissames882-del/ai-bridge.git ~/ai-bridge
cp ~/ai-bridge/SOUL.md ~/.hermes/SOUL.md          # personalidad (runtime)
cp ~/ai-bridge/MEMORY.md ~/.hermes/MEMORY.md      # documento (NO es la memoria viva)
```

---

## 3. Memoria viva + secretos (a mano, nunca en git)

```bash
mkdir -p ~/.hermes/memories
# MEMORY.md (notas del agente, ≤2200 chars) y USER.md (perfil, ≤1375 chars):
#   - restaurar del backup (~/dracky-recovery/backups/hermes-config-*.tgz), o
#   - reescribir los datos base a mano.

chmod 600 ~/.hermes/.env
```

Claves del `.env` en este lab (valores NO van a git):

```
DEEPSEEK_API_KEY=...
TELEGRAM_BOT_TOKEN=...
TELEGRAM_ALLOWED_USERS=...
TELEGRAM_HOME_CHANNEL=...
```

---

## 4. Servicios

```bash
sudo systemctl start docker tailscaled ollama

# Open WebUI (recrear solo si el contenedor no existe)
docker start open-webui 2>/dev/null || docker run -d --name open-webui --restart always \
  -p 3000:8080 --add-host host.docker.internal:host-gateway \
  -e OLLAMA_BASE_URL=http://host.docker.internal:11434 \
  -v open-webui:/app/backend/data \
  ghcr.io/open-webui/open-webui:main

# Gateway de Hermes (systemd de USUARIO, con linger para que arranque sin login)
hermes gateway install
systemctl --user enable --now hermes-gateway
loginctl enable-linger adri

# Tailscale: acceso privado a Open WebUI
sudo tailscale up
sudo tailscale set --operator=$USER
tailscale funnel reset          # asegurarse de que NO hay Funnel público
tailscale serve --bg 3000       # privado, solo tailnet
```

Rutas y ficheros que importan:

- Ollama: `/etc/systemd/system/ollama.service.d/override.conf` con
  `OLLAMA_HOST=0.0.0.0:11434` y `OLLAMA_ORIGINS=*`
  (lo necesita el contenedor vía `host.docker.internal`; **no** poner 127.0.0.1).
- Gateway: `~/.config/systemd/user/hermes-gateway.service`.

---

## 5. Comprobar que está vivo

```bash
curl -s localhost:11434/api/version                     # ollama
curl -s 172.17.0.1:11434/api/version                     # ollama desde el bridge docker
docker ps                                                # open-webui healthy
tailscale status                                         # nodos de la tailnet
tailscale serve status                                   # "(tailnet only)"
systemctl --user status hermes-gateway --no-pager | head # gateway activo
hermes doctor
curl -sI https://dracky-1.tail78f25d.ts.net/ | head -1    # HTTP/2 200 por tailnet
```

En Telegram: manda un mensaje al bot y `/commands` para ver los comandos disponibles.

---

## 6. Backup (sin secretos)

```bash
~/dracky-recovery/backup.sh              # por defecto: SIN cache de modelos (~60 KB)
FULL=1 ~/dracky-recovery/backup.sh       # completo, incluye cache de modelos (~960 MB)
```

Cron instalado: **domingos 03:00** (slim, log en `~/dracky-recovery/backup.log`).

Genera en `~/dracky-recovery/backups/`:

- `open-webui-data-slim-FECHA.tgz` — chats, usuarios, login, vector_db y uploads (volumen Docker)
- `hermes-config-FECHA.tgz` — SOUL.md, MEMORY.md, memories/, config.yaml, cron/

La diferencia entre slim y completo es solo la carpeta `cache` del volumen (modelos de
embeddings), que se re-descarga sola. El `.env` **no** se copia a propósito: guárdalo
aparte (gestor de contraseñas).

---

## 7. Nombres de comando de tono

`titanwing` / `titanicwing` (dragón OFF) y `dracky` / `draky` (dragón ON).
**En Hermes (CLI/Telegram) se escriben SIN barra**: cualquier `/palabra` desconocida
la intercepta el gateway y no llega al modelo. En Open WebUI funcionan con o sin barra.
