# CachyOS — host físico Adri

## Dual boot

- **Estado:** Windows 11 + CachyOS instalados (confirmado 2026-11-23).
- Cachy usado para rice, terminal (zsh/fish), pruebas de shell, Brave.

## Clavis Shell

Objetivo: desktop shell tipo Quickshell sobre **niri** (no Plasma).

### Qué funcionó

- One-liner oficial:
  `curl -fsSL https://raw.githubusercontent.com/StatIndet/quickshell/main/install.sh | bash`
- Respuestas usadas: keyboard Y, power Y, enable shell Y, clipboard Y, start_now **N** (estaba en Plasma).
- Pacman instaló: niri, quickshell, matugen, awww, grim, slurp, hyprpicker, fuentes, etc.

### Qué falló

- Empaquetado final de **key-cli** (y split packages keyboard/cpu-power):
  ```
  Installation failed during source build key-cli:
  pacman -Qp .../key-cli-2026.9.25-1-x86_64.pkg.tar.zst → exit 1
  ```
- Causa probable: CachyOS empaqueta/optimiza como `x86_64_v3`; el installer espera nombre `x86_64`. Además limpia `/tmp/clavis-build-*` al fallar.
- `clavis` del AUR es **otro proyecto** (password manager). No confundir.

### Workaround key-cli

```bash
sudo pacman -S --needed base-devel cmake ninja python python-pip qt6-base
cd ~
git clone --branch v2026.9.25 --depth 1 https://github.com/StatIndet/key-cli.git
cd key-cli
./scripts/install.sh   # usuario normal; sudo solo al desplegar /usr/local
command -v key && key version && key doctor
```

Luego cerrar sesión → SDDM → sesión **niri**.

### Alternativas parecidas (si se abandona Clavis)

| Proyecto | Base | Notas |
|----------|------|--------|
| Clave (Andrew-most-likely/clave) | Hyprland | Desktop completo menú/dock; `bash <(curl -fsSL https://raw.githubusercontent.com/Andrew-most-likely/clave/main/setup.sh)` |
| Caelestia Shell | Hyprland + Quickshell | AUR `caelestia-shell` + `caelestia-cli` |
| Plasma Cachy (default) | KDE | Ya estable; rice con catppuccin etc. |

## Brave — carpetas marcadores objetivo

**IA:** Claude, NotebookLM, Lovable, PixVerse, Groq console, ChatGPT, Grok, DeepSeek chat  
**Dracky:** dracky.lovable.app, Open WebUI (Tailscale IP:3000), Tailscale admin, Infisical, Cloudflare  

Open WebUI: preferir IP Tailscale de la VM, no solo LAN.

## Relación con el lab

Cachy es el **host**. La VM Dracky sigue en VirtualBox (Windows o Cachy según arranque). Tailscale une ambos.
