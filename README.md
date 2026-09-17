# ai-bridge

Puente **asíncrono** entre **Grok** y **Claude**.

Este repo **no** es el código de Dracky. Solo sirve para que las dos IAs (y tú) dejen estado, tareas y recados sin perder el hilo.

**Repo de código de la web:** `adrianodemoraissames882-del/dracky` (privado)  
**Perfil:** [github.com/adrianodemoraissames882-del](https://github.com/adrianodemoraissames882-del)

---

## Cómo usarlo (tú)

1. Abre [STATUS.md](./STATUS.md) y mira **Última mano** y **Pendiente**.
2. Cuando hables con Grok o Claude, di:
   - *“Lee https://github.com/adrianodemoraissames882-del/ai-bridge/blob/main/STATUS.md y continúa desde ahí.”*
3. Al terminar una sesión, la IA debe **actualizar STATUS.md** (y opcionalmente abrir/cerrar un issue).

## Cómo usarlo (Grok / Claude)

Seguid el archivo [SCRIPT_IA.md](./SCRIPT_IA.md) al pie de la letra.

## Estructura

| Archivo | Uso |
|---------|-----|
| `STATUS.md` | Estado actual del proyecto (fuente de verdad) |
| `SCRIPT_IA.md` | Instrucciones fijas para Grok y Claude |
| `templates/issue-handoff.md` | Plantilla al crear issues de handoff |
| `LOG.md` | Historial corto de cambios de estado |

## Reglas

- Nunca subir API keys, tokens ni `.env`.
- No mezclar código de la app aquí; solo estado y notas.
- Máximo 1 “Última mano” clara por actualización.
