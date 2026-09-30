# Hermes Agent — instalación en lab Dracky (VM Ubuntu)

Docs: https://hermes-agent.nousresearch.com/docs/

## En la VM (`adri@dracky`)

### 0) Instantánea VirtualBox
Nombre: `2026-09-30-pre-hermes`

### 1) Instalar CLI

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
source ~/.bashrc
hermes --version
```

### 2) Setup

```bash
hermes setup
```

- Proveedor: **OpenAI-compatible** / custom si aparece
- Base URL DeepSeek: `https://api.deepseek.com/v1`
- API key: la misma de Open WebUI (no subir a git)
- Modelo: p.ej. deepseek-chat / el que liste el panel
- **Messaging / gateway (Telegram, etc.): Skip** por ahora

Alternativa por pasos:

```bash
hermes model
hermes doctor
```

### 3) Probar

```bash
hermes
```

### 4) Datos

- Config: `~/.hermes/config.yaml`
- Secrets: `~/.hermes/.env` (**nunca** a GitHub)
- Personalidad opcional: `~/.hermes/SOUL.md` (texto Dracky)

### 5) Instantánea
`2026-09-30-hermes-ok`

### Nota Docker

Opción alternativa (si se prefiere contenedor):

```bash
mkdir -p ~/.hermes
docker run -it --rm -v ~/.hermes:/opt/data nousresearch/hermes-agent setup
```

En este lab se recomienda el **install.sh** en la VM (más simple con Tailscale/SSH).
