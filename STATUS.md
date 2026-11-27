# STATUS — Dracky / lab / CachyOS

> **Regla doble agente:** todo avance → STATUS + LOG (SCRIPT_IA.md §0).
> **NO** tocar repo `dracky` (Lovable) sin OK de Adri.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-11-27
- **Qué:** Healthcheck VM OK (Ollama active; WebUI, n8n, Honcho, SearXNG, stack metrics up). Adri recuerda objetivo: **control del PC host**, no solo chat en VM. Gap: Hermes en VM no controla Cachy/Windows sin puente SSH/skills en el host.

---

## Lab VM `dracky-1` (100.66.109.25) — healthy

| Servicio | Estado |
|----------|--------|
| ollama | active |
| open-webui | Up healthy |
| n8n | Up |
| honcho (api/db/redis/deriver) | Up healthy |
| searxng | Up |
| grafana, prometheus, cadvisor, node-exporter | Up |

SSH desde Cachy: ✅ `ssh adri@100.66.109.25`

---

## Objetivo de producto: control del PC

Dracky debe poder actuar en el **host** (Cachy prioritario; Windows en dual boot es más limitado):

- Abrir programas, gestionar archivos, ejecutar scripts
- Skills Hermes / automatización (n8n) hacia el host

**Realidad técnica:** un agente **dentro de la VM** no controla el host solo. Hace falta una de:

| Enfoque | Qué implica |
|---------|-------------|
| **A. Hermes (o agente) en Cachy** | Mejor para “controlar el PC” donde trabajas |
| **B. Puente SSH VM → Cachy** | Hermes en VM ejecuta comandos vía `ssh adriano@100.99.177.2` |
| **C. Solo VM** | Controla archivos/servicios de la VM, no Fortnite/Windows ni el escritorio Cachy |

Recomendación: **A** (agente en Cachy) o **B** corto plazo reutilizando Hermes de la VM.

---

## Red

| Nodo | IP |
|------|-----|
| Cachy `cachyos-x8664-1` | 100.99.177.2 |
| VM `dracky-1` | 100.66.109.25 |

## Pendiente (prioridad)

1. Elegir **A** (Hermes/skills en Cachy) o **B** (SSH VM→Cachy para comandos host).
2. Si B: clave de la VM hacia `adriano@100.99.177.2` + skill/shell seguro.
3. Si A: instalar runtime Hermes/agent en Cachy apuntando a DeepSeek + SOUL.
4. Probar 2–3 acciones reales (abrir app, listar carpeta, script).
5. Migración lab nativo Cachy = fase mayor; no bloquea el puente de control.

## Mensaje para la siguiente IA

Lab VM healthy. Prioridad usuario = **control PC host**. No solo chat. Proponer A o B y ejecutar el puente.
