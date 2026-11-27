# SCRIPT PARA GROK, CLAUDE Y DRACKY

Instrucciones fijas. Seguid esto en cada sesión que use este repo.

---

## 0. REGLA OBLIGATORIA — Doble agente (Adri 2026-11-27)

**Cualquier cambio o avance** en Dracky, lab, Cachy, dual boot, SSH, Tailscale, modos, Hermes, web o infraestructura:

1. Actualizar **en el mismo turno** (no “luego”):
   - `STATUS.md` → Última mano + Hecho/Pendiente + mensaje siguiente IA
   - `LOG.md` → una línea arriba (fecha | quién | resumen)
   - `CACHY.md` u otros solo si el cambio es de ese ámbito
2. Actuar como **puente Grok ↔ Claude**: el estado en git debe bastar para que la otra IA continúe sin el chat.
3. Si no hay acceso a GitHub en ese momento: dejar el diff listo en el chat y aplicarlo en cuanto haya conector.
4. Cero secretos (passwords, API keys) en el repo.

Esta regla **manda** sobre omitir updates “para no gastar tokens”.

---

## 1. Al EMPEZAR una sesión

1. Leer `STATUS.md` completo (preferir raw.githubusercontent.com para no quemar tool quota).
2. Si el usuario da otra prioridad, esa manda sobre la lista de pendientes.
3. No asumir chats antiguos: **solo** STATUS + LOG + lo que el usuario pegue ahora.

## 2. Durante el trabajo

- Código de la web/app → repo `dracky` (si hay acceso y OK de Adri).
- Estado, decisiones, handoff → **solo** este repo `ai-bridge`.
- Commits claros: `feat:`, `fix:`, `docs:`, `status:`.
- Cero secretos en git.

## 3. Al TERMINAR (obligatorio si hubo avance)

Actualizar `STATUS.md`:

1. **Última mano** → tu nombre (Grok, Claude o Dracky) + fecha + 1–3 líneas de qué hiciste.
2. **Hecho** / tablas → reflejar realidad.
3. **Pendiente** → lista ordenada por prioridad.
4. **Mensaje para la siguiente IA** → una frase concreta.

Añadir una línea al principio de `LOG.md`:

```text
YYYY-MM-DD | Grok|Claude|Dracky | resumen en una línea
```

## 4. Handoff por Issue (opcional)

Si la tarea es grande o debe retomarla la otra IA:

1. Crear issue en `ai-bridge` con `templates/issue-handoff.md`.
2. Título: `[Handoff] …`
3. En STATUS, mensaje siguiente IA con el nº de issue.

## 5. Frases que el usuario puede copiaros

**Arrancar (bajo token):**

```text
Lee raw en orden:
https://raw.githubusercontent.com/adrianodemoraissames882-del/ai-bridge/main/STATUS.md
https://raw.githubusercontent.com/adrianodemoraissames882-del/ai-bridge/main/LOG.md
https://raw.githubusercontent.com/adrianodemoraissames882-del/ai-bridge/main/SCRIPT_IA.md
Continúa desde Pendiente. No toques repo dracky sin OK.
```

**Cerrar sesión:**

```text
Actualiza STATUS.md y LOG.md en ai-bridge según SCRIPT_IA.md (regla doble agente).
```

## 6. Identidades

| Quién | Firma en STATUS |
|-------|-----------------|
| Grok (xAI) | `Grok` |
| Claude (Anthropic) | `Claude` |
| Dracky (Hermes) | `Dracky` |
| Usuario | `Adriano` / `Adri` |

## 7. Qué no hacer

- No saltarse el update de STATUS/LOG tras un avance.
- No reescribir todo STATUS si solo cambió una cosa.
- No duplicar el tracker completo de fases aquí.
- No comunicar “en tiempo real”: canal **asíncrono** vía git.
