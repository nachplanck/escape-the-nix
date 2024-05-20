# Usar la imagen base de Debian
FROM debian:bookworm-slim

# Actualizar los repositorios e instalar OpenSSH Server, sudo y nano
RUN apt-get update && \
    apt-get install -y openssh-server sudo nano locales && \
    echo "es_ES.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen es_ES.UTF-8 && \
    update-locale LANG=es_ES.UTF-8 && \
    mkdir /var/run/sshd

ENV LANG es_ES.UTF-8
ENV LANGUAGE es_ES:es
ENV LC_ALL es_ES.UTF-8

# Copiar el script de entrada
COPY entrypoint.sh /entrypoint.sh

COPY files /etc/files
COPY levels /etc/levels

RUN chmod +x /entrypoint.sh
# Desactivamos su
RUN chmod 700 /usr/bin/su

# Configurar SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Exponer el puerto 22
EXPOSE 22

# Establecer el punto de entrada
ENTRYPOINT ["/entrypoint.sh"]
