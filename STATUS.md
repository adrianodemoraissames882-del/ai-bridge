# STATUS — Dracky / lab / CachyOS

> **Regla doble agente:** STATUS + LOG en cada avance (SCRIPT_IA.md §0).
> **NO** tocar repo `dracky` (Lovable) sin OK de Adri.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-11-27
- **Qué:** Alineación **Fase 5** con lectura de Claude. Lab VM healthy. Prioridad Adri = control PC; definición: **Cachy host** (no Windows gaming). Orden Fase 5 acordado abajo.

---

## Fase 5 — Agente e Investigación

| # | Tarea | Estado | Notas |
|---|--------|--------|--------|
| 1 | Investigador autónomo (web → informe) | ✅ Hecho (LOG 2026-10-21) | Telegram/informe |
| 2 | MCP servers en Hermes | ⬜ Pendiente | Empezar 1–2 **solo lectura** |
| 3 | Subagentes (hasta 3 paralelos) | ⬜ Pendiente | Probar con 2; vigilar RAM VM |
| 4 | Control básico del PC | 🔄 Definido / por cablear | Ver sección Control |
| 5 | Open WebUI Tools (Python en WebUI) | ⬜ Dejar para el final | Riesgo con Funnel público; Hermes ya cubre terminal |

**Fase 5B (idea, no tracker formal):** Guardia — vigilancia servicios + aviso Telegram (“Draky Empresas”).

### Orden de ejecución

1. Investigador ✅  
2. MCP (read-only)  
3. Subagentes (2)  
4. **Control PC** (puente host)  
5. Open WebUI Tools solo si aporta algo nuevo  

---

## Control del PC (definición)

- **“PC” = Cachy** (dev/lab), no Windows (Fortnite/Office).
- Hermes hoy vive en la **VM** → no controla el host solo.

| Vía | Qué |
|-----|-----|
| **B (corto)** | Hermes VM → `ssh adriano@100.99.177.2` + lista de comandos permitidos + OK humano en destructivo |
| **A (limpio)** | Agente/Hermes en Cachy, control local |
| Solo VM | Archivos/servicios de la VM — **no** cumple el objetivo de Adri |

---

## Lab / red (operativo)

| Nodo | IP | Notas |
|------|-----|--------|
| Cachy | 100.99.177.2 | sshd; clave adri@cachy |
| VM dracky-1 | 100.66.109.25 | SSH desde Cachy ✅; stack Up |

Ollama, open-webui, n8n, Honcho, SearXNG, metrics: healthy (check 2026-11-27).

## Pendiente inmediato

1. Elegir **B** o **A** para control host y cablear.
2. MCP read-only (docs Hermes).
3. Subagentes ×2 + mirar RAM.
4. Open WebUI Tools al final / opcional.

## Mensaje para la siguiente IA

Fase 5 orden: MCP → subagentes → control Cachy (B o A). No confundir control-VM con control-PC. Funnel = cuidado con WebUI Tools.
