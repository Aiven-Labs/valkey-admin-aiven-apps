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

# If the platform only gives us a single REDIS_URL (e.g. rediss://default:pass@host:port),
# split it into VALKEY_HOST/PORT/USERNAME/PASSWORD before starting valkey-admin.
COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
# Re-declare the base image's CMD — setting a new ENTRYPOINT above clears it
# otherwise, and we still need it passed through to docker-entrypoint.sh.
CMD ["node", "apps/server/dist/index.js"]

EXPOSE 8080
