# DockerProjects

This repository contains a collection of Docker projects, each showcasing a different application or service utilizing Docker for containerization and orchestration.

## Getting Started

To get started with the projects, follow these steps:

1. Clone the repository:
   
   ```bash
   git clone https://github.com/juanrdzbaeza/DockerProjects.git
   ```

2. Navigate to the desired project directory:
   
   ```bash
   cd DockerProjects/<project_name>
   ```

3. Build the Docker image:
   
   ```bash
   docker build -t <image_name> .
   ```

4. Run the Docker container:
   
   ```bash
   docker run -d -p <host_port>:<container_port> <image_name>
   ```

## Requirements

- Docker installed on the local machine.

## Installation

The projects can be installed by cloning the repository and following the 'Getting Started' instructions.

## Project Structure

The project's directory structure is as follows:

```
DockerProjects/
├── README.md
├── start-engine.sh
├── license
├── gitlab-docker-server/
│   └── docker-compose.yml
├── linuxserver-gimp/
│   └── docker-compose.yml
├── minipaint/
│   └── docker-compose.yml
├── owncloud-docker-server/
│   └── docker-compose.yml
└── portainer/
    └── docker-compose.yml
```

## Additional Information

The `start-engine.sh` script automates the installation of dependencies, QEMU, Docker, and Colima. It uses Homebrew to manage package installation.

To install Colima, follow these steps:

1. Install jq using Homebrew:
   
   ```bash
   brew install jq
   ```

2. Get the latest version of lima:
   ```bash
   VERSION=$(curl -fsSL https://api.github.com/repos/lima-vm/lima/releases/latest | jq -r .tag_name)
   ```

3. Download and extract lima:
   ```bash
   curl -fsSL "https://github.com/lima-vm/lima/releases/download/${VERSION}/lima-${VERSION:1}-$(uname -s)-$(uname -m).tar.gz" | tar Cxzvm /usr/local
   ```

4. Install Colima:
   ```bash
   brew install colima
   ```

Once Colima is installed, you can use it to manage Docker containers and virtual machines.

## License

This project is licensed under the [MIT License](https://github.com/juanrdzbaeza/DockerProjects/blob/main/license).

