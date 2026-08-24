#!/bin/sh
# Aiven Apps (and many other platforms) hand services a single connection
# string via REDIS_URL, e.g.:
#   rediss://default:PASSWORD@host:port
#
# valkey-admin instead wants the pieces as separate env vars
# (VALKEY_HOST / VALKEY_PORT / VALKEY_USERNAME / VALKEY_PASSWORD / VALKEY_AUTH_TYPE).
# If REDIS_URL is set, parse it and export the pieces before handing off to
# the image's real entrypoint. Values already set explicitly in the
# environment are left alone.
set -e

if [ -n "$REDIS_URL" ]; then
  parsed="$(REDIS_URL="$REDIS_URL" node -e '
    const u = new URL(process.env.REDIS_URL);
    const shQuote = (s) => "\x27" + String(s).replace(/\x27/g, "\x27\\\x27\x27") + "\x27";
    const lines = [];
    // URL getters return userinfo percent-encoded; decode it back to the raw value.
    if (u.hostname) lines.push(`export VALKEY_HOST=${shQuote(u.hostname)}`);
    if (u.port) lines.push(`export VALKEY_PORT=${shQuote(u.port)}`);
    if (u.username) lines.push(`export VALKEY_USERNAME=${shQuote(decodeURIComponent(u.username))}`);
    if (u.password) {
      lines.push(`export VALKEY_PASSWORD=${shQuote(decodeURIComponent(u.password))}`);
      lines.push(`export VALKEY_AUTH_TYPE=${shQuote("password")}`);
    }
    console.log(lines.join("\n"));
  ')"
  eval "$parsed"
fi

exec docker-entrypoint.sh "$@"
