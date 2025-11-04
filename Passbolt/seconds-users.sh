#!/bin/bash
# Script para crear usuarios normales en Passbolt
# Edita la lista de usuarios según tus necesidades

USERS=(
  "usuario1@email.com:usuario1:apellido1"
  "usuario2@email.com:usuario2:apellido2"
  "usuario3@email.com:usuario3:apellido3"
  "usuario4@email.com:usuario4:apellido4"
  "usuario5@email.com:usuario5:apellido5"
  "usuario6@email.com:usuario6:apellido6"
)

for entry in "${USERS[@]}"; do
  IFS=":" read -r EMAIL FIRST LAST <<< "$entry"
  docker compose -f docker-compose-ce.yaml \
    exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
      passbolt register_user \
        -u $EMAIL \
        -f $FIRST \
        -l $LAST \
        -r user \
        -i" -s /bin/sh www-data
done
