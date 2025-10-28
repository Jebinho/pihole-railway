FROM pihole/pihole:2024.06.0

# Variáveis de ambiente essenciais
ENV TZ=America/Sao_Paulo
ENV WEBPASSWORD=senha_admin_123
ENV ServerIP=0.0.0.0
ENV FTLCONF_LOCAL_IPV4=0.0.0.0

# Instala dependências necessárias
RUN apt-get update && apt-get install -y \
    curl \
    dnsutils \
    && rm -rf /var/lib/apt/lists/*

# Cria arquivo de configuração básico
RUN echo "WEBPASSWORD=${WEBPASSWORD}" > /etc/pihole/setupVars.conf && \
    echo "PIHOLE_INTERFACE=eth0" >> /etc/pihole/setupVars.conf && \
    echo "IPV4_ADDRESS=0.0.0.0" >> /etc/pihole/setupVars.conf

# Expõe portas
EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 80/tcp

# Script de inicialização simplificado
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
