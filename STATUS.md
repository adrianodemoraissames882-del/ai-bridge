# STATUS — Dracky / lab / CachyOS

> Fuente de verdad Grok ↔ Claude. Actualizar al final de cada sesión útil.

## Última mano

- **Quién:** Grok
- **Cuándo:** 2026-09-30 (noche)
- **Qué hizo:** Lab **completo a nivel base**. Hermes Agent instalado + SOUL.md Dracky OK. 5 modos WebUI con personalidad reforzada y `/titanwing`/`/draky`. **No tocar repo `dracky` (Lovable).**

---

## Lab — estado actual (2026-09-30)

| Ítem | Estado |
|------|--------|
| VM **Dracky-lab** | Ubuntu Server · user `adri` · host `dracky` |
| Docker | OK |
| Tailscale | OK · IP típica lab `100.66.109.25` |
| Ollama | OK · escucha `*:11434` · CPU-only · override Environment |
| Open WebUI | OK · `http://100.66.109.25:3000` |
| DeepSeek API | OK en WebUI + Hermes (`https://api.deepseek.com/v1`) |
| Modelos locales | llama3.2:3b · qwen2.5:3b (+ opcionales) |
| DeepSeek models WebUI | V4-Pro · V4.1-Flash · etc. |
| **5 modos** | RÚNICO / FULMÍNEO / ÍGNEO / ARCANO / ETÉREO · base **única** cada uno |
| REGLA no-validar | En system prompts |
| `/titanwing` + `/draky` | WebUI OK |
| **Hermes Agent** | v0.21.5 · install.sh + full setup · modelo default **deepseek-v4-flash** · reasoning **medium** · terminal **Local** |
| Hermes tools | web, browser (Local Chromium), terminal, files, code, vision, video analysis, image gen, video gen (APIs gen a menudo Skip/luego), skills, memory, cron, etc. |
| Search | DuckDuckGo (gratis) |
| TTS | Microsoft Edge TTS (gratis) |
| Image gen provider | Skip / configurar luego (pago) |
| Video gen provider | Skip / configurar luego (pago) |
| Messaging | Ninguna plataforma (Telegram/WA Skip) |
| **SOUL.md** | `~/.hermes/SOUL.md` · personalidad Dracky **funciona** |
| Instantáneas | Recomendadas: `2026-09-30-pre-hermes` · `2026-09-30-hermes-ok` |

### Asignación modos → base (no reutilizar)

| Modo | Base |
|------|------|
| RÚNICO | DeepSeek-V4-Pro |
| ARCANO | DeepSeek-V4.1-Flash |
| FULMÍNEO | llama3.2:3b |
| ÍGNEO | qwen2.5:3b |
| ETÉREO | Arena Model (o llava si visión local) |

### Paths útiles

- Hermes config: `~/.hermes/config.yaml`
- Hermes secrets: `~/.hermes/.env` (**nunca git**)
- Hermes soul: `~/.hermes/SOUL.md`
- WebUI: Docker `open-webui` · puerto 3000

### Lecciones

- **No tocar** repo `dracky` (Lovable) sin OK explícito del usuario.
- Ollama: `Environment=` (no typo) + `ss` debe ser `0.0.0.0` o `*`, no solo 127.0.0.1.
- Hermes nuevo **no** pide CPU/RAM/disco 50GB (eso era sandbox Docker antiguo); usa la VM Local.
- Gen imagen/vídeo = proveedores de pago aparte de DeepSeek.

Histórico incidente snapshot mayo: `INCIDENT_HERMES_ROLLBACK.md`.

---

## Plan MAÑANA (2026-10-01) — prioridad sugerida

1. **Instantánea** `2026-09-30-hermes-ok` si no está hecha.
2. **Probar** Hermes: tarea real (archivo, comando, búsqueda web).
3. **Opcional APIs media:** FAL / OpenRouter / etc. solo si Adri quiere gen imagen/vídeo ya.
4. **Messaging:** Telegram bot (público) cuando toque; WhatsApp solo personal si se retoma.
5. **Web Lovable:** solo si Adri lo pide — arreglar en **Lovable UI**, no commits a ciegas en `dracky`.
6. **ai-bridge:** Claude lee STATUS + este plan con conector o paste.
7. **hermes update** cuando convenga (iba ~16 commits behind).

---

## Contexto usuario

- Adriano / Darcko · adrianodemoraissames882@gmail.com · GH adrianodemoraissames882-del · SMR · HP Victus 15L

---

## Dracky producto

IA compañero dragón. Web: https://dracky.lovable.app  
APIs: Ollama → DeepSeek → (Groq opcional)  
Planes diseño: Free / Gamer / Pro / Business · beta cerrada

---

## GitHub

| Repo | Uso |
|------|-----|
| **ai-bridge** | Handoff Grok↔Claude |
| **dracky** | Lovable — **NO tocar** |
| **dracky-hub** | Docs recuperación web |
| **Darcko** | Profile README |

---

## Hecho (2026-09-30 y rebuild)

- [x] Rebuild VM desde cero
- [x] Docker, Tailscale, Ollama, Open WebUI
- [x] DeepSeek Connections
- [x] 5 modos + REGLA + personalidad fuerte + /titanwing /draky
- [x] Hermes install + DeepSeek + tools + SOUL.md Dracky

## Pendiente

1. Snapshot hermes-ok (confirmar)
2. Telegram / media APIs (opcional)
3. Web Lovable (solo si se pide)
4. hermes update / SOUL ajustes finos

## No tocar

- Repo `dracky` sin petición explícita
- Secretos en git

## Enlaces

| Qué | URL |
|-----|-----|
| ai-bridge | https://github.com/adrianodemoraissames882-del/ai-bridge |
| HERMES_INSTALL.md | en este repo |
| Hermes docs | https://hermes-agent.nousresearch.com/docs/ |
| Web | https://dracky.lovable.app |

## Mensaje para Claude / siguiente IA

1. Leer **STATUS.md** completo (lab base CERRADO).
2. Hermes + SOUL Dracky OK; WebUI 5 modos OK.
3. Mañana: pruebas reales, opcional Telegram/media, Lovable solo si Adri pide.
4. **No modificar** `adrianodemoraissames882-del/dracky`.
