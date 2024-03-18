#!/bin/bash

# Vérification des privilèges sudo
if [ "$EUID" -ne 0 ]
  then echo "Ce script doit être exécuté avec les privilèges sudo"
  exit
fi

# Commenter la ligne dans le fichier /etc/named.conf
sed -i 's/include "\/etc\/crypto-policies\/back-ends\/bind.config";/#include "\/etc\/crypto-policies\/back-ends\/bind.config";/g' /etc/named.conf

# Affichage d'un message pour confirmer l'opération
echo "La ligne include dans /etc/named.conf a été commentée avec succès."
