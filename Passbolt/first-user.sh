#!/bin/bash
docker compose -f docker-compose-ce.yaml \
exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
  passbolt register_user \
    -u USUARIO@EMAIL.com \
    -f USUARIO \
    -l PASS \
    -r admin" -s /bin/sh www-data