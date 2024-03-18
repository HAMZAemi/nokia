#!/bin/bash

# Installation de HAProxy
sudo yum install -y haproxy

# Configuration de HAProxy
sudo tee /etc/haproxy/haproxy.cfg > /dev/null <<EOF
# Exemple de configuration HAProxy avec deux serveurs backend

# Global settings
global
    log /dev/log local0
    log /dev/log local1 notice
    chroot /var/lib/haproxy
    stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
    stats timeout 30s
    user haproxy
    group haproxy
    daemon

# Default settings
defaults
    log global
    mode http
    option httplog
    option dontlognull
    timeout connect 5000
    timeout client 50000
    timeout server 50000

# Frontend configuration
frontend http_front
    bind *:80
    default_backend http_back

# Backend configuration
backend http_back
    balance roundrobin
    server node-06 192.168.56.26:80 check
    server node-05 192.168.56.25:80 check
EOF

# Redémarrage du service HAProxy pour appliquer les modifications de configuration
sudo systemctl restart haproxy

# Mise à jour finale du système
sudo yum update -y
