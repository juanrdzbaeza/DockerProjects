#!/usr/bin/env bash
set -euo pipefail

# Script para instalar Docker y permitir uso sin sudo (añadiendo el usuario al grupo docker)
# Compatible con: Debian/Ubuntu (apt), Fedora/RHEL (dnf/yum).
# Uso: ejecutar como usuario normal; el script usará sudo cuando sea necesario.

TARGET_USER="${SUDO_USER:-${USER}}"

log() { echo -e "[INFO] $*"; }
err() { echo -e "[ERROR] $*" >&2; }

detect_distro() {
	if [ -f /etc/os-release ]; then
		. /etc/os-release
		echo "$ID" "$VERSION_ID"
	else
		echo "unknown" "0"
	fi
}

install_debian() {
	log "Instalando dependencias..."
	sudo apt-get update -y
	sudo apt-get install -y ca-certificates curl gnupg lsb-release

	log "Añadiendo clave GPG y repositorio oficial de Docker..."
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	dist_codename=$(lsb_release -cs)
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $dist_codename stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

	log "Actualizando paquetes e instalando Docker Engine..."
	sudo apt-get update -y
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

install_fedora() {
	PKG_MGR="dnf"
	if command -v dnf >/dev/null 2>&1; then
		PKG_MGR=dnf
	elif command -v yum >/dev/null 2>&1; then
		PKG_MGR=yum
	fi

	log "Instalando paquetes requeridos..."
	sudo ${PKG_MGR} -y install dnf-plugins-core curl

	log "Añadiendo repositorio oficial de Docker..."
	sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo || true

	log "Instalando Docker Engine..."
	sudo ${PKG_MGR} -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin || {
		err "Fallo instalando paquetes con ${PKG_MGR}. Intenta ejecutar manualmente con privilegios de root.";
		exit 1;
	}
}

post_install() {
	log "Creando grupo 'docker' si no existe..."
	if ! getent group docker >/dev/null; then
		sudo groupadd docker || true
	fi

	log "Añadiendo usuario '$TARGET_USER' al grupo docker..."
	sudo usermod -aG docker "$TARGET_USER"

	log "Habilitando y arrancando el servicio docker..."
	sudo systemctl enable docker --now || {
		err "No se pudo habilitar/arrancar el servicio systemd. Si tu sistema no usa systemd, arranca containerd/dockerd según corresponda.";
	}

	log "Instalación completada. Para usar Docker sin reiniciar sesión puedes ejecutar:"
	echo "  newgrp docker"
	echo "O cerrar sesión y volver a entrar para que los cambios de grupo surtan efecto."
}

main() {
	read -r id ver <<< "$(detect_distro)"
	case "$id" in
		ubuntu|debian)
			install_debian
			;;
		fedora|centos|rhel)
			install_fedora
			;;
		*)
			err "Distribución no reconocida: $id. Este script soporta Debian/Ubuntu y Fedora/RHEL."
			exit 2
			;;
	esac

	post_install
}

main "$@"


