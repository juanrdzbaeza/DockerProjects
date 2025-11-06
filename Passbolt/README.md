# Passbolt Docker Setup

Este sub-proyecto permite desplegar Passbolt (gestor de contraseñas de equipos) usando Docker Compose y MariaDB.

## Estructura de archivos

- `docker-compose-ce.yaml`: Define los servicios de Passbolt y MariaDB.
- `.env`: Variables de entorno para credenciales y configuración.
- `first-user.sh`, `individual-user.sh`, `seconds-users.sh`: Scripts para crear usuarios.
- `generate-login-url.sh`: Script para generar una URL de recuperación para usuarios existentes.
- `download-passbolt-compose.sh`: Descarga el archivo de Docker Compose oficial.
- `README.md`: Este archivo.

## Uso rápido

1. **Configura `.env`**  
	Edita las variables para tu entorno (dominio, usuarios, contraseñas, email SMTP).

2. **Despliega los servicios**  
	```bash
	docker compose -f docker-compose-ce.yaml up -d
	```

3. **Crea el primer usuario (admin)**  
	```bash
	./first-user.sh
	```

4. **Crea usuarios individuales o en lote**  
	- Individual: `./individual-user.sh`
	- Lote: `./seconds-users.sh`

5. **Genera URL de recuperación/login (Cuando sea necesario)**  
	```bash
	./generate-login-url.sh usuario@email.com
	```

## Información sensible

- Las contraseñas en `docker-compose-ce.yaml` y `.env` como `P4ssb0lt`, `your_password`, `your_email_password` son ejemplos, pero si usas valores reales, **no los publiques**.
- Revisa que `.env` no contenga contraseñas reales antes de compartir el proyecto.
- El archivo `docker-compose-ce.yaml` tiene la contraseña de la base de datos (`P4ssb0lt`). Cámbiala por una variable de entorno si quieres mayor seguridad.

## Recomendaciones

- Usa variables de entorno para todas las contraseñas y datos sensibles.
- No publiques `.env` con datos reales.
- Cambia las contraseñas de ejemplo antes de poner en producción.
