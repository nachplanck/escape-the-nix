#!/bin/bash

chmod +x /etc/files/examen_level01.sh

useradd -ms /bin/bash "richard.stallman"
echo "richard.stallman:gnu" | chpasswd

cp -R /etc/files/level01/* /home/richard.stallman/

chown -R "richard.stallman":"richard.stallman" /home/richard.stallman
chown "richard.stallman":"richard.stallman" /home/$USERNAME/leeme.txt

# touch /home/richard.stallman/.test_passed

cat << 'EOF' >> /home/richard.stallman/.bashrc
cd() {
    builtin cd "$@" && [ -f .evidencias ] && cat .evidencias
}

alias cd='cd'
EOF

cat << 'EOF' >> /home/richard.stallman/.bash_profile
source /home/richard.stallman/.bashrc
clear

if [ ! -f ~/.test_passed ]; then
    /etc/files/examen_level01.sh
    if [ $? -ne 0 ] && [ ! -f ~/.test_passed ]; then
        exit 1
    fi
fi

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
echo "Bienvenid@ al nivel 1."
echo
echo "Vamos a practicar otro comando muy importante, "cd"."
echo "Si tienes dudas  de cómo utilizarlos, recuerda que puedes hacer 'man <comando>' o '<comando> --help'"
echo
EOF