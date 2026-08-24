# Valkey Admin — points at an existing Valkey instance (e.g. an Aiven for Valkey service)
# Docs: https://valkey-admin.valkey.io/deployment/docker/
FROM valkey/valkey-admin:latest

# Web UI mode
ENV DEPLOYMENT_MODE=Web

ENV VALKEY_AUTH_TYPE="password"
ENV VALKEY_USERNAME="default"
ENV VALKEY_PORT=6789
ENV VALKEY_PASSWORD=""

# Optional: cap how large a value Valkey Admin will render in the UI
ENV KEY_VALUE_SIZE_LIMIT_BYTES="2048"

EXPOSE 8080
