#!/bin/bash
 clear
 
 fecha=`date +%Y-%m-%d`
  echo $fecha
 usuario=`whoami`
if [ ! -d /home/its/log_bk  ]; then 
	    mkdir /home/its/log_bk 
        chmod 700 /home/its/log_bk
fi 

read -n1

rm -rf /home/its/log_bk-/backup$fecha
echo "Se esta haciendo el nuevo backup para el dia $fecha"
mkdir /home/its/log_bk/backup$fecha
mkdir /home/its/log_bk/backup$fecha/db /home/its/log_bk/backup$fecha/sistema

cd /home/its/log_bk/backup$fecha/db

dbexport gestion_utu 

su informix -c "ontape -s -L 0"

cp -r /opt/informix/backup_log /home/its/log_bk/backup$fecha/db

#Como utilizar el * para que agarretodo los caracteres despues 


 cp /etc/passwd /home/its/log_bk/backup$fecha/sistema

 cp /etc/group /home/its/log_bk/backup$fecha/sistema

 cp /etc/shadow /home/its/log_bk/backup$fecha/sistema

 cp /etc/sysconfig/network-scripts/ifcfg-enp0s3 /home/its/log_bk/backup$fecha/sistema

 cp /etc/services /home/its/log_bk/backup$fecha/sistema

 cp /var/log/secure /home/its/log_bk/backup$fecha/sistema

 cp /var/log/messages /home/its/log_bk/backup$fecha/sistema


cd /home/its/log_bk

tar -cvjf backup$fecha.tar backup$fecha


 echo "Se realizo el backup"

 read -n1

