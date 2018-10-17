#!/bin/bash
clear 

user=`id -g`

if [ "$user" != 0 ] 
	then
	echo "No tienes los privilegios necesarios para utilizar esta opcion"
	exit 1
fi

while [ "$menu_informix" != 0 ]
do
    echo
    echo "#########################"
    echo "# Menu informix #"
    echo "#########################" 
    echo "
  1) Informix parte 1.
  2) Informix parte 2.
  3) Informix parte 3.
  0) Volver atras."
    echo
read -p " Seleccione la opcion deseada: " menu_informix
echo

case $menu_informix in

1)clear 
    bash informix_automatico1.sh;;

2) clear 
    bash informix_automatico2.sh;;

3) clear
    bash informix_automatico3.sh;;
    
0) clear
   bash automatizacion.sh;;

*)clear
        echo -e '\e[1;31mOpcion invalida, por favor ingrese una opcion del menu 
        presione enter para continuar\e[0m'
		read -n1
		clear;;
   
esac
done