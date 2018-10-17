#!/bin/bash
clear
read -p "Nombre del usuario del que se desea cambiar la clave: " username
 sudo passwd $username
 read -n1
bash menu_admin_usuarios.sh
