#!/bin/bash

truncate -s 0 /etc/motd 
mv /etc/files/ubuntu_bashrc /etc/skel/.bashrc
rm /etc/update-motd.d/10-uname

for FILE in /etc/levels/*;
do 
    echo $FILE
    chmod +x $FILE;
    sh $FILE;
done

#rm -rf /etc/files

# Iniciar el servidor SSH
exec /usr/sbin/sshd -D
