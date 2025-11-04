#!/bin/bash
curl -LO "https://download.passbolt.com/ce/docker/docker-compose-ce.yaml"
curl -LO "https://github.com/passbolt/passbolt_docker/releases/latest/download/docker-compose-ce-SHA512SUM.txt"
sha512sum -c docker-compose-ce-SHA512SUM.txt && echo "Checksum OK" || (echo "Bad checksum. Aborting" && rm -f docker-compose-ce.yaml)
docker compose -f docker-compose-ce.yaml up -d