#!/bin/bash
clear
read -p "Nombre del grupo a borrar: " grupo
sudo groupdel $group
read -n1
bash menu_admin_usuarios.sh
