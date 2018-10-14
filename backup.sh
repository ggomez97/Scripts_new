#!/bin/bash
 clear
 
 fecha=`date +%Y-%m-%d`
  echo $fecha
 usuario=`whoami`
if [ ! -d /home/usuario.admin/log_bk  ]; then 
	sudo mkdir /home/usuario.admin/log_bk 
fi 

read -n1

rm -rf /home/usuario.admin/log_bk-/backup$fecha
echo "Se esta haciendo el nuevo backup para el dia $fecha"
mkdir /home/usuario.admin/log_bk/backup$fecha
mkdir /home/usuario.admin/log_bk/backup$fecha/db /home/usuario.admin/log_bk/backup$fecha/sistema

cd /home/usuario.admin/log_bk/backup$fecha/db

dbexport gestion_utu 

su informix -c "ontape -s -L 0"

#Como utilizar el * para que agarretodo los caracteres despues 
su informix -c "mv /home/usuario.admin/backup/* /home/usuario.admin/backup/backup$fecha/db"

sudo cp /etc/passwd /home/usuario.admin/log_bk/backup$fecha/sistema

sudo cp /etc/group /home/usuario.admin/log_bk/backup$fecha/sistema

sudo cp /etc/shadow /home/usuario.admin/log_bk/backup$fecha/sistema

sudo cp /etc/sysconfig/network-scripts/ifcfg-enp0s3 /home/usuario.admin/log_bk/backup$fecha/sistema

sudo cp /etc/services /home/usuario.admin/log_bk/backup$fecha/sistema

sudo cp /var/log/secure /home/usuario.admin/log_bk/backup$fecha/sistema

sudo cp /var/log/messages /home/usuario.admin/log_bk/backup$fecha/sistema

sudo cp /opt/informix/backup /home/usuario.admin/log_bk/backup$fecha/sistema

cd /home/usuario.admin/log_bk

sudo tar -cvjf backup$fecha.tar backup$fecha


 echo "Se realizo el backup"

 read -n1

