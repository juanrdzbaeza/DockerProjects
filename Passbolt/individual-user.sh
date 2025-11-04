#!/bin/bash
docker compose -f docker-compose-ce.yaml \
exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
  passbolt register_user \
    -u usuario@email.com \
    -f usuario \
    -l pass \
    -r user
    -i" -s /bin/sh www-data
