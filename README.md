# ai-bridge

Puente **asíncrono** entre **Grok** y **Claude**.

Este repo **no** es el código de Dracky. Solo estado, handoff y notas de proyectos.

**Código web:** `adrianodemoraissames882-del/dracky` (privado)  
**Perfil:** [github.com/adrianodemoraissames882-del](https://github.com/adrianodemoraissames882-del)

---

## Cómo usarlo (tú)

1. Abre [STATUS.md](./STATUS.md) → **Última mano** y **Pendiente**.
2. Al hablar con Grok o Claude:
   ```text
   Lee https://github.com/adrianodemoraissames882-del/ai-bridge
   (STATUS.md + SCRIPT_IA.md) y continúa desde Pendiente.
   ```
3. Si el tema es el modpack:
   ```text
   Lee MODPACK.md en ai-bridge y sigue desde ahí.
   ```
4. Al terminar la sesión: que la IA actualice STATUS/LOG (y MODPACK si aplica).

## Cómo usarlo (Grok / Claude)

Seguid [SCRIPT_IA.md](./SCRIPT_IA.md).

## Estructura

| Archivo | Uso |
|---------|-----|
| `STATUS.md` | Estado Dracky + CachyOS + GitHub |
| `MODPACK.md` | Notas del modpack (sesión futura) |
| `SCRIPT_IA.md` | Reglas de handoff |
| `LOG.md` | Historial corto |
| `templates/issue-handoff.md` | Issues de traspaso |

## Reglas

- Nunca API keys ni `.env`.
- No meter el código de la app aquí.
- Una “Última mano” clara por update.
