#!/bin/bash
clear

oninit -ivy 
onstat -

read -n1

cd /mis_dbspaces
touch ITS_dbspace.dbspace
chown informix.informix ITS_dbspace.dbspace 
chmod 660 ITS_dbspace.dbspace

onspaces -c -d ITS_dbspace -p /mis_dbspaces/ITS_dbspace.dbspace -o 0 -s 1000000 

mkdir /opt/informix/backup_log
chmod 770 /opt/informix/backup_log

sudo echo '@reboot root source /etc/profile.d/infromix.sh && (/opt/informix/bin/oninit -vy)' >> /etc/crontab
