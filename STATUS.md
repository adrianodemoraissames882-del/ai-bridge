# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky.
> **Regla doble agente:** todo avance → STATUS + LOG (SCRIPT_IA.md §0).
> **NO** tocar repo `dracky` (Lovable) sin OK de Adri.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-11-27
- **Qué:** Tailscale en Cachy **OK**. Host activo: `cachyos-x8664-1` → **100.99.177.2**. sshd enabled. Clave `ed25519` generada (`adri@cachy`). VM `dracky-1` online en **100.66.109.25**. Aviso MagicDNS (systemd-resolved + NM). Siguiente: SSH Cachy→VM y/o stack lab nativo en Cachy.

---

## Red Tailscale (foto 2026-11-27)

| Nodo | IP | SO | Estado |
|------|-----|-----|--------|
| **cachyos-x8664-1** | **100.99.177.2** | linux | **online** (Cachy actual, user adriano) |
| dracky-1 | 100.66.109.25 | linux | online (VM lab) |
| cachyos-x8664 | 100.81.53.63 | linux | offline ~75d (nodo viejo; se puede borrar en admin) |
| familia-de-mora | 100.73.240.62 | windows | offline |
| redmi-note-13-5g | 100.105.50.84 | android | offline |
| tfg | 100.69.78.9 | linux | offline |

- Cuenta tailnet: `adrianodemoraissames882@`
- Health: MagicDNS puede fallar (resolved + NetworkManager); IPs `100.x` sí sirven.

---

## CachyOS (host)

| Ítem | Estado |
|------|--------|
| Dual boot | ✅ |
| Usuario | `adriano` |
| Tailscale | ✅ `100.99.177.2` |
| sshd | ✅ enable --now |
| Clave SSH | ✅ `~/.ssh/id_ed25519` (comentario adri@cachy) |
| authorized_keys (entrantes) | Opcional; vacío OK hasta móvil |
| Clavis | ❌ off |
| Stack lab nativo | Pendiente |

## Lab VM dracky-1

| Ítem | Estado |
|------|--------|
| IP Tailscale | 100.66.109.25 |
| SSH desde Cachy | 🔄 Siguiente (copiar pub Cachy → authorized_keys de `adri` en VM) |
| Ollama/WebUI/Hermes | Siguen en VM hasta migración nativa |

---

## Dirección

Lab objetivo = **Cachy nativo**. VM sigue online para no romper nada mientras migramos.

## Enlaces

| Qué | URL |
|-----|-----|
| Web | https://dracky.lovable.app |
| Funnel (revalidar) | https://dracky-1.tail78f25d.ts.net |
| Bridge | https://github.com/adrianodemoraissames882-del/ai-bridge |
| Tailscale admin | https://login.tailscale.com/admin/machines |
| SSH a Cachy | `ssh adriano@100.99.177.2` |
| SSH a VM | `ssh adri@100.66.109.25` |

---

## Pendiente (prioridad)

1. **SSH Cachy → VM:** `ssh-copy-id` o pegar `id_ed25519.pub` de Cachy en `adri@dracky-1:~/.ssh/authorized_keys`.
2. Probar: `ssh adri@100.66.109.25` desde Cachy.
3. (Opcional) Limpiar nodo offline `cachyos-x8664` en admin Tailscale.
4. (Opcional) Arreglar MagicDNS resolved/NM — no bloquea IPs 100.x.
5. Stack lab nativo en Cachy (Docker, Ollama, WebUI, modos, Hermes).
6. Brave marcadores; hub/Lovable solo con OK.

## No tocar

- Repo dracky sin OK
- Secretos / claves privadas en git o chats
- Borrar VM hasta tener lab nativo estable

## Mensaje para la siguiente IA

Cachy en tailnet: **100.99.177.2**. VM **100.66.109.25** online. Siguiente: SSH Cachy→VM con la pub de Cachy; luego migración lab o pruebas WebUI por Tailscale.
