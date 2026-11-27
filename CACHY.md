# CachyOS — host físico Adri

## Dual boot

- Windows 11: Fortnite, Minecraft Store, Word/Office.
- CachyOS: dev + lab + Tailscale. Usuario: **adriano**.

## Tailscale (2026-11-27)

- Nodo actual: **cachyos-x8664-1** → **100.99.177.2**
- VM lab: **dracky-1** → **100.66.109.25**
- Nodo viejo offline: cachyos-x8664 (100.81.53.63) — candidado a borrar en admin
- MagicDNS: warning resolved+NM; usar IPs 100.x

## SSH

- sshd: enabled
- Clave host: `~/.ssh/id_ed25519` / `.pub` comentario `adri@cachy`
- Ver pública: `cat ~/.ssh/id_ed25519.pub`
- Entrar a Cachy: `ssh adriano@100.99.177.2`
- Entrar a VM desde Cachy: `ssh adri@100.66.109.25` (tras copiar pub a authorized_keys de la VM)

## Clavis

Desinstalado. No reintentar.
