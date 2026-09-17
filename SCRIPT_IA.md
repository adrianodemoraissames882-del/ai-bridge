# SCRIPT PARA GROK Y CLAUDE

Instrucciones fijas. Seguid esto en cada sesión que use este repo.

---

## 1. Al EMPEZAR una sesión

1. Leer `STATUS.md` completo.
2. Si el usuario da otra prioridad, esa manda sobre la lista de pendientes.
3. No asumir chats antiguos: **solo** STATUS + lo que el usuario pegue ahora.

## 2. Durante el trabajo

- Código de la web/app → repo `dracky` (si hay acceso).
- Estado, decisiones, handoff → **solo** este repo `ai-bridge`.
- Commits claros: `feat:`, `fix:`, `docs:`, `status:`.
- Cero secretos en git.

## 3. Al TERMINAR (obligatorio si hubo avance)

Actualizar `STATUS.md`:

1. **Última mano** → tu nombre (Grok o Claude) + fecha + 1–3 líneas de qué hiciste.
2. **Hecho** → mover ítems completados.
3. **Pendiente** → lista ordenada por prioridad.
4. **Mensaje para la siguiente IA** → una frase concreta.

Añadir una línea al principio de `LOG.md` (más reciente arriba):

```text
YYYY-MM-DD | Grok|Claude | resumen en una línea
```

## 4. Handoff por Issue (opcional)

Si la tarea es grande o debe retomarla la otra IA:

1. Crear issue en `ai-bridge` con la plantilla `templates/issue-handoff.md`.
2. Título: `[Handoff] …`
3. En STATUS, en “Mensaje para la siguiente IA”, poner el número de issue.

## 5. Frases que el usuario puede copiaros

**Para arrancar:**

```text
Lee el repo ai-bridge (STATUS.md + SCRIPT_IA.md) y continúa desde Pendiente.
https://github.com/adrianodemoraissames882-del/ai-bridge
```

**Para cerrar sesión:**

```text
Actualiza STATUS.md y LOG.md en ai-bridge según SCRIPT_IA.md.
```

## 6. Identidades

| Quién | Cómo firmar en STATUS |
|-------|------------------------|
| Grok (xAI) | `Grok` |
| Claude (Anthropic) | `Claude` |
| Usuario | `Adriano` / `Adri` |

## 7. Qué no hacer

- No reescribir todo STATUS si solo cambió una cosa.
- No duplicar el tracker completo de fases aquí (solo estado operativo).
- No comunicar “en tiempo real”: este canal es **asíncrono**.
