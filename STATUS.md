# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude ↔ Dracky.
> Repo **ai-bridge** = estado/handoff. **NO** tocar repo `dracky` (Lovable) sin OK de Adri.
> **Regla doble agente:** todo avance → STATUS + LOG en el mismo turno (ver SCRIPT_IA.md §0).

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-11-27
- **Qué:** Adri fija regla obligatoria de actualizar ai-bridge en cada avance. Objetivo: **lab Dracky en Cachy** (host). Siguiente inmediato: **Tailscale + sshd en Cachy** (conexión). Passwords VM/WebUI ya rotadas. Clavis off.

---

## Dirección del proyecto

| Antes | Ahora |
|-------|--------|
| Lab en VM Ubuntu (VirtualBox; host Win/Cachy) | **Lab en Cachy** (nativo preferido; VM en Cachy solo si Adri lo pide) |
| Tailscale sobre todo en la VM | **Tailscale en Cachy** (obligatorio para móvil / fuera de casa / Funnel) |

Windows sigue para Fortnite, Minecraft Store, Word. Cachy = dev + lab + Tailscale.

---

## Lab (transición)

| Ítem | Estado |
|------|--------|
| VM Ubuntu histórica | Sigue existiendo; migrar servicios a Cachy |
| Passwords VM + Open WebUI | ✅ Rotadas |
| 5 modos + personalidad + comandos | OK en stack anterior |
| Hermes / Honcho / RAG | OK en VM; re-desplegar o apuntar cuando Cachy sea host |
| Funnel | `https://dracky-1.tail78f25d.ts.net` (revalidar tras Tailscale en Cachy) |
| **Tailscale en Cachy** | 🔄 **En curso — paso actual** |
| sshd en Cachy | Pendiente con Tailscale |
| Stack Docker/Ollama/WebUI nativo Cachy | Pendiente tras red |

---

## CachyOS

| Ítem | Estado |
|------|--------|
| Dual boot | ✅ |
| Clavis | ❌ Desinstalado |
| Herramientas | VS Code, VirtualBox, yazi, cava, Brave |
| Tailscale + sshd | 🔄 Siguiente paso |

---

## Enlaces

| Qué | URL |
|-----|-----|
| Web | https://dracky.lovable.app |
| Funnel WebUI | https://dracky-1.tail78f25d.ts.net |
| Bridge | https://github.com/adrianodemoraissames882-del/ai-bridge |
| Tailscale admin | https://login.tailscale.com/admin/machines |

---

## Pendiente (prioridad)

1. **Tailscale up en Cachy** + comprobar `tailscale status` / IP 100.x.
2. **sshd** en Cachy + `authorized_keys` (móvil/otro PC → Cachy).
3. Decidir nativo vs VM-en-Cachy para Ollama/WebUI/Hermes (default: **nativo**).
4. Instalar stack lab en Cachy y revalidar Funnel/modos.
5. Instantánea / backup cuando el host Cachy esté estable.
6. Brave marcadores IA/Dracky.
7. Hub HTML / Lovable solo con OK de Adri.

## No tocar

- Repo **dracky** sin OK
- Secretos en git
- Reinstalar Clavis / reabrir Fase 3 memoria en VM sin necesidad

## Mensaje para la siguiente IA

Adri en **conexión Cachy**: Tailscale (+ sshd). Regla §0 SCRIPT_IA obligatoria. Lab se migra a Cachy; no asumir que la VM es el host definitivo.
