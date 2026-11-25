# CachyOS — host físico Adri

## Dual boot

- Windows 11 + CachyOS (confirmado 2026-11-23).
- **Windows:** Fortnite, Minecraft Launcher (Microsoft Store), Word/Office, juegos con anticheat.
- **Cachy:** VS Code, VirtualBox, yazi, cava, Brave, terminal/rice, lab Dracky, Tailscale.

## Clavis

- Intentado 2026-11-18; key-cli falló (arch x86_64 vs Cachy).
- **Desinstalado 2026-11-25.** No reintentar salvo Adri lo pida.
- Si algún día: key-cli vía `./scripts/install.sh` del repo StatIndet/key-cli, no el one-liner roto.

## Brave

Carpetas objetivo **IA** y **Dracky** (marcadores) — aún pendiente montar en Cachy.

## SSH hacia/desde Windows

Usuario Windows con carpeta SSH: `C:\Users\dracky-ssh\.ssh\`

Error conocido: se escribió el placeholder literal en `authorized_keys`. Corregir con la **clave pública real** (una línea `ssh-ed25519 AAAA... comentario`).
