#!/bin/bash 
clear
 
user=`id -g`

if [ "$user" != 0 ] 
	then
	echo "No tienes los privilegios necesarios para utilizar esta opcion"
	exit 1
fi

chmod 755 -R ManageEngine_OpManager_64bit.bin

./ManageEngine_OpManager_64bit.bin -console

read -n1

cd /opt/ManagerEngine/OpManager/bin/

bash StartOpManager.sh

sudo echo '@reboot root sleep 1 bash /opt/ManagerEngine/OpManager/bin/StartOpManagerServer.sh' >> /etc/crontab