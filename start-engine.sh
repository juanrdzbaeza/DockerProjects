#!/bin/bash

# 🍺 Homebrew
# Homebrew es el gestor de paquetes por excelencia en MacOS, para instalarlo solamente basta con ejecutar el siguiente comando en la terminal:

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Dependencies

# Install Ninja using Homebrew
brew install ninja
# Install pkg-config using Homebrew
brew install pkg-config
# Install Glib and GThread using Homebrew
brew install glib 
# Install pixman-1 using Homebrew
brew install pixman

# 🍒 Git
# Instalar Git, haremos uso del gestor de paquetes instalado anteriormente, opcionl 
# brew install git

# 🖥️🖥️ QEMU
curl -LO https://download.qemu.org/qemu-6.2.0.tar.xz
tar -xvf qemu-6.2.0.tar.xz
sudo mv qemu-6.2.0 /usr/local/qemu-6.2.0
# Navigate to the QEMU directory
cd /usr/local/qemu-6.2.0
# Reconfigure QEMU
./configure
# Build QEMU
make
# Install QEMU
sudo make install
#echo 'export PATH=/usr/local/qemu-6.2.0/bin:$PATH' >> ~/.bashrc
#source ~/.bashrc

# 🐳 Docker
# Para instalar Docker, haremos uso del gestor de paquetes instalado anteriormente:

brew install docker
brew install docker-compose


# 🍋 Colima
# Una vez tengamos Docker, instalamos Colima, lanzando desde la terminal el comando:

# Instalar jq con brew
brew install jq

# Obtener la versión más reciente de lima
VERSION=$(curl -fsSL https://api.github.com/repos/lima-vm/lima/releases/latest | jq -r .tag_name)

# Descargar el binario de lima y descomprimirlo en /usr/local
curl -fsSL "https://github.com/lima-vm/lima/releases/download/${VERSION}/lima-${VERSION:1}-$(uname -s)-$(uname -m).tar.gz" | tar Cxzvm /usr/local

# brew install colima

# Descargar el binario
curl -LO https://github.com/abiosoft/colima/releases/latest/download/colima-$(uname)-$(uname -m)

# Hacer el binario descargado ejecutable
chmod +x colima-$(uname)-$(uname -m)

# Crear el directorio /usr/local/bin si no existe
sudo mkdir -p /usr/local/bin

# Mover el binario a un directorio en la ruta del sistema PATH
sudo mv colima-$(uname)-$(uname -m) /usr/local/bin/colima