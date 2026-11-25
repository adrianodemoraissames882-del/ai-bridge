# CachyOS — host físico Adri

## Dual boot

- **Estado:** Windows 11 + CachyOS (confirmado 2026-11-23).
- **Clavis:** instalado a medias (niri/quickshell) → **desinstalado 2026-11-25**. No es prioritario.

## Rol frente a Windows

| Windows | CachyOS |
|---------|---------|
| Fortnite, Minecraft Launcher (MS Store) | VS Code, terminal (zsh/fish), yazi, cava |
| Word / Office y similares | VirtualBox (VM Dracky) |
| Juegos con anticheat estricto | Brave, Tailscale, rice, pacman/AUR |
| Apps Microsoft Store | Herramientas Linux nativas |

Cachy **no** tiene que correr Fortnite ni el launcher de la Store. Complementa Windows.

## Clavis (histórico — cerrado)

- Fallo: `key-cli` packaging (`x86_64` vs Cachy `x86_64_v3` / `/tmp` limpio).
- Adri desinstaló Clavis. Plasma Cachy es el escritorio actual.
- Si algún día se retoma: source install de key-cli o Hyprland shells (Clave / Caelestia). Ver commits anteriores.

## Stack instalado (mencionado por Adri)

- VS Code
- VirtualBox
- yazi (file manager TUI)
- cava (visualizador audio)
- Brave (marcadores IA/Dracky pendientes)

## Brave — carpetas marcadores objetivo

**IA:** Claude, NotebookLM, Lovable, PixVerse, Groq, ChatGPT, Grok, DeepSeek  
**Dracky:** dracky.lovable.app, Open WebUI (IP Tailscale:3000), Tailscale admin, Infisical, Cloudflare

## Relación con el lab

Cachy o Windows pueden arrancar VirtualBox; la VM Dracky es la misma. Tailscale une host + VM + móvil.
