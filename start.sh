#!/bin/bash

# Inicia serviços necessários
service cron start

# Configura o Pi-hole se não estiver configurado
if [ ! -f /etc/pihole/setupVars.conf ]; then
    echo "WEBPASSWORD=${WEBPASSWORD}" > /etc/pihole/setupVars.conf
    echo "PIHOLE_INTERFACE=eth0" >> /etc/pihole/setupVars.conf
    echo "IPV4_ADDRESS=0.0.0.0" >> /etc/pihole/setupVars.conf
fi

# Prepara o Pi-hole
pihole -g
pihole -f

# Inicia o servidor web
lighttpd -D -f /etc/lighttpd/lighttpd.conf
