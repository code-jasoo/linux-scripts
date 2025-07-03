#!/bin/bash
## Run as root

if [ $(whoami) = 'root' ]; then
	echo "Root permissions required."
    exit
fi

apt update -y
apt install -y wget apt-transport-https
wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
apt update -y

apt install temurin-21-jdk
curl -OJ https://meta.fabricmc.net/v2/versions/loader/1.21.1/0.16.14/1.0.3/server/jar