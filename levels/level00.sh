#!/bin/bash

# Crear usuarios
useradd -ms /bin/bash "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd
usermod -aG sudo "$USERNAME"

# Eliminar línea de NOPASSWD y añadir SUDOER
sed -i "/$USERNAME ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers
echo "$USERNAME ALL=(ALL) ALL" >> /etc/sudoers

cp -R /etc/files/level00/* /home/$USERNAME/

# Cambiar propietario del directorio /home/$USERNAME
chown -R "$USERNAME":"$USERNAME" /home/"$USERNAME"

# Añadir a .bash_profile el source de .bashrc
echo "source /home/$USERNAME/.bashrc" >> /home/$USERNAME/.bash_profile

cat << 'EOF' >> /home/$USERNAME/.bash_profile
clear
echo "▓█████   ██████  ▄████▄   ▄▄▄       ██▓███  ▓█████    ▄▄▄█████▓ ██░ ██ ▓█████     ███▄    █  ██▓▒██   ██▒";
echo "▓█   ▀ ▒██    ▒ ▒██▀ ▀█  ▒████▄    ▓██░  ██▒▓█   ▀    ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀     ██ ▀█   █ ▓██▒▒▒ █ █ ▒░";
echo "▒███   ░ ▓██▄   ▒▓█    ▄ ▒██  ▀█▄  ▓██░ ██▓▒▒███      ▒ ▓██░ ▒░▒██▀▀██░▒███      ▓██  ▀█ ██▒▒██▒░░  █   ░";
echo "▒▓█  ▄   ▒   ██▒▒▓▓▄ ▄██▒░██▄▄▄▄██ ▒██▄█▓▒ ▒▒▓█  ▄    ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄    ▓██▒  ▐▌██▒░██░ ░ █ █ ▒ ";
echo "░▒████▒▒██████▒▒▒ ▓███▀ ░ ▓█   ▓██▒▒██▒ ░  ░░▒████▒     ▒██▒ ░ ░▓█▒░██▓░▒████▒   ▒██░   ▓██░░██░▒██▒ ▒██▒";
echo "░░ ▒░ ░▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░ ▒▒   ▓▒█░▒▓▒░ ░  ░░░ ▒░ ░     ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░   ░ ▒░   ▒ ▒ ░▓  ▒▒ ░ ░▓ ░";
echo " ░ ░  ░░ ░▒  ░ ░  ░  ▒     ▒   ▒▒ ░░▒ ░      ░ ░  ░       ░     ▒ ░▒░ ░ ░ ░  ░   ░ ░░   ░ ▒░ ▒ ░░░   ░▒ ░";
echo "   ░   ░  ░  ░  ░          ░   ▒   ░░          ░        ░       ░  ░░ ░   ░         ░   ░ ░  ▒ ░ ░    ░  ";
echo "   ░  ░      ░  ░ ░            ░  ░            ░  ░             ░  ░  ░   ░  ░            ░  ░   ░    ░  ";
echo "                ░                                                                                        ";
echo
echo "Bienvenid@ al nivel 0."
echo
echo "Vamos a practicar 2 comandos: 'ls' y 'cat'."
echo "Si tienes dudas  de cómo utilizarlos, recuerda que puedes hacer 'man <comando>' o '<comando> --help'"
echo
EOF