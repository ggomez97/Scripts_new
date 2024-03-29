#!/bin/bash
    clear                                   #Este comando limpia la pantalla
hostnamectl set-hostname servidor.its       #Cambia el nombre del servidor
  
cd /etc/sysconfig/network-scripts           #Se mueve entre directorios

sudo echo 'IPADDR="192.168.10.141"' >> ifcfg-enp0s3 
sudo echo 'PREFIX="24"' >> ifcfg-enp0s3
sudo echo 'GATEWAY="192.168.10.1"' >> ifcfg-enp0s3
sudo echo 'IPV6_PRIVACY="no"' >> ifcfg-enp0s3
sudo echo 'ZONE="public"' >> ifcfg-enp0s3
sudo sed -E -i 's/(BOOTPROTO=")([a-zA-Z]*)(")/\1none\3/g' ifcfg-enp0s3
#Todos estos comandos agregan o cambian valores en el archivo ifcfg-enp0s3

systemctl stop NetworkManager #Detiene el servicio NetworkManager
systemctl disable NetworkManager #Deshabilita el servicio NetworkManager
systemctl restart network.service #Reinicia el servicio NetworkManager

hostnamectl  #Nos muestra que de verdad se hallan realizado los cambios

cd /home/its/Scripts 

sudo cat login_defs.txt > /etc/login.defs

sudo echo '30 00 * * * root bash /home/its/Scripts/backup.sh' >> /etc/crontab
sudo echo '00 02 * * * root bash /home/its/Scripts/old_bk.sh' >> /etc/crontab
sudo echo '59 00,13 * * 2,3,4,5,6,7 informix ontape -s -L 1 &' >> /etc/crontab
sudo echo '00 00 * * 1 informix ontape -s -L 0 &' >> /etc/crontab

read -n1

sudo groupadd informix                                    # Crear un grupo llamado informix
sudo useradd -g informix -d /opt/informix informix            # Crear usuario informix y lo agrega al grupo informix
sudo passwd informix                                      # Asigna una contraseÃ±a del usuario informix


sudo useradd -d /dev/null usuario.invitados
sudo usermod -s /bin/false usuario.invitados

sudo groupadd docente
sudo useradd -g docente -d /dev/null usuario.docente
sudo passwd usuario.docente 
sudo usermod -s /bin/false usuario.docente
 
sudo groupadd gestion 
sudo useradd -g gestion -d /dev/null usuario.gestion
sudo passwd usuario.gestion
sudo usermod -s /bin/false usuario.gestion

sudo groupadd administrador 
sudo useradd -g wheel -m usuario.admin
sudo passwd usuario.admin 
sudo usermod -aG administrador usuario.admin
sudo chown -R usuario.admin /home/usuario.admin
sudo chmod 770 /home/usuario.admin 



