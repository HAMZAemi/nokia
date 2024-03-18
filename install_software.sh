#!/bin/bash

# Mise à jour du système
sudo yum update -y
# Installation de pip3
sudo yum install epel-release -y
# Installation d'Ansible via pip3
yum repolist | grep epel
# Installation d'Ansible via yum (cette ligne peut être supprimée si vous préférez utiliser Ansible installé via pip)
sudo yum install ansible -y
sudo yum update
# Vérification du statut du service sshd
sudo systemctl status sshd

# Installation des outils nécessaires pour Docker
sudo yum install -y yum-utils
sudo yum update
# Suppression de podman et buildah s'ils sont installés (facultatif, si vous ne les utilisez pas)
sudo yum remove -y podman buildah

# Configuration du repo Docker
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Installation de Docker CE
sudo yum install -y docker-ce
sudo yum update
# Démarrage et activation du service Docker
sudo systemctl start docker
sudo systemctl enable docker
sudo yum update