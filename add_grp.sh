#!/bin/bash
clear
echo
read  -p "Nombre del grupo a crear: " group
   sudo groupadd $group
   read -n1
bash menu_admin_usuarios.sh
