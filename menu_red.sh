#!/bin/bash
clear
while [ "$menu_red" != 0 ]
do
    echo
    echo "#########################"
    echo "# Menu de testeo de red #"
    echo "#########################" 
    echo "
  1) Hacer ping a un host.
  2) Testeo de RED.
  0) Volver atras."
    echo
read -p " Seleccione la opcion deseada: " menu_red
echo

case $menu_red in

1)echo 
read -p " Ingrese la IP de host que desea testear: " ping
ping -c 6 $ping
echo "Presione enter para contitunar"
        read -n1
            ;;

2) clear 
netstat | grep EST
echo "Presione enter para contitunar"
        read -n1
            ;;
0) clear
   bash HMG_main_menu.sh;;

*)clear
        echo -e '\e[1;31mOpcion invalida, por favor ingrese una opcion del menu 
        presione enter para continuar\e[0m'
		read -n1
		clear;;

esac
done