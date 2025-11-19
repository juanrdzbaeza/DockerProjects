#!/bin/bash
# Script para generar una URL de recuperación (login) para un usuario existente en Passbolt
# Uso: ./generate-login-url.sh usuario@email.com

if [ -z "$1" ]; then
  echo "Uso: $0 <email-del-usuario>"
  exit 1
fi

EMAIL="$1"

docker compose -f docker-compose-ce.yaml \
exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
  passbolt recover_user \
    -u $EMAIL" -s /bin/sh www-data
