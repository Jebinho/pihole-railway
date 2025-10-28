FROM pihole/pihole:latest

# Variáveis de ambiente
ENV VIRTUAL_HOST='pihole.railway.app'
ENV ServerIP='0.0.0.0'

# Expõe portas
EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 80/tcp

# Inicia Pi-hole
CMD ["/s6-init"]
