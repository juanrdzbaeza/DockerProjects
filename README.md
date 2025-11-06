
# DockerProjects

Este repositorio contiene una colección de proyectos Docker, cada uno mostrando una aplicación o servicio diferente usando contenedores y orquestación con Docker Compose.

## Requisitos

- Docker instalado en el sistema (Linux o MacOS).
- Permisos de usuario para ejecutar Docker.

## Instalación rápida

1. Clona el repositorio:
   ```bash
   git clone https://github.com/juanrdzbaeza/DockerProjects.git
   cd DockerProjects
   ```

2. Instala Docker y dependencias usando los scripts incluidos:

   - **Linux:**
     ```bash
     ./start-engine-linux.sh
     ```
     Este script instala Docker y configura el usuario para usarlo sin sudo.

   - **MacOS:**
     ```bash
     ./start-engine-macos.sh
     ```
     Este script instala Homebrew, QEMU, Docker, Colima y dependencias necesarias.

3. Accede al subproyecto que desees:
   ```bash
   cd <subproyecto>
   ```
   Por ejemplo: `cd Passbolt` o `cd portainer`

4. Levanta el servicio con Docker Compose:
   ```bash
   docker compose -f docker-compose.yml up -d
   ```
   (El nombre del archivo puede variar según el subproyecto)

## Estructura del proyecto

```
DockerProjects/
├── README.md
├── start-engine-linux.sh
├── start-engine-macos.sh
├── license
├── gitlab-docker-server/
│   └── docker-compose.yml
├── linuxserver-gimp/
│   └── docker-compose.yml
├── minipaint/
│   └── docker-compose.yml
├── owncloud-docker-server/
│   └── docker-compose.yml
├── portainer/
│   └── docker-compose.yml
└── Passbolt/
    ├── docker-compose-ce.yaml
    ├── .env
    ├── first-user.sh
    ├── individual-user.sh
    ├── seconds-users.sh
    ├── generate-login-url.sh
    └── README.md
```

## Información sobre los scripts de arranque

- `start-engine-linux.sh`: Automatiza la instalación de Docker en sistemas Linux compatibles (Debian, Ubuntu, Fedora, RHEL). Añade el usuario al grupo docker y habilita el servicio.
- `start-engine-macos.sh`: Instala Homebrew, dependencias, QEMU, Docker y Colima en MacOS. Permite gestionar contenedores y máquinas virtuales.

## Subproyectos destacados

- **Passbolt:** Gestor de contraseñas para equipos, con scripts para automatizar usuarios y recuperación de cuentas.
- **Portainer:** Interfaz web para gestionar contenedores Docker.
- **OwnCloud:** Almacenamiento y sincronización de archivos.
- **Minipaint, GIMP, Gitlab:** Otros servicios y aplicaciones dockerizadas.

Cada subproyecto tiene su propio archivo `docker-compose.yml` y puede incluir scripts adicionales para facilitar la gestión.

## Seguridad y buenas prácticas

- No publiques archivos `.env` con contraseñas reales.
- Cambia las contraseñas de ejemplo antes de poner en producción.
- Usa variables de entorno para datos sensibles siempre que sea posible.

## Licencia

Este proyecto está licenciado bajo la [MIT License](https://github.com/juanrdzbaeza/DockerProjects/blob/main/license).

