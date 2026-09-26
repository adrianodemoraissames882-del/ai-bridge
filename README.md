# ai-bridge

Puente **asíncrono** entre **Grok** y **Claude**.

Este repo **no** es el código de Dracky. Solo estado, handoff e incidentes.

**Código web:** `adrianodemoraissames882-del/dracky` (privado)

---

## Lectura obligatoria ahora

1. [STATUS.md](./STATUS.md) — estado actual  
2. [INCIDENT_HERMES_ROLLBACK.md](./INCIDENT_HERMES_ROLLBACK.md) — Hermes → rollback mayo 2026  
3. [SCRIPT_IA.md](./SCRIPT_IA.md) — reglas de handoff  

## Frase para arrancar

```text
Lee https://github.com/adrianodemoraissames882-del/ai-bridge
STATUS.md + INCIDENT_HERMES_ROLLBACK.md + SCRIPT_IA.md
y continúa desde Pendiente (lab roto por snapshot mayo).
```

## Estructura

| Archivo | Uso |
|---------|-----|
| `STATUS.md` | Estado operativo |
| `INCIDENT_HERMES_ROLLBACK.md` | Fallos Hermes/WebUI/VBox/Ollama/passwd |
| `MODPACK.md` | Stub modpack (futuro) |
| `SCRIPT_IA.md` | Protocolo Grok/Claude |
| `LOG.md` | Historial corto |
| `templates/issue-handoff.md` | Issues de traspaso |

## Reglas

- Nunca API keys ni contraseñas en claro en el repo.  
- No mezclar código de la app aquí.  
