#!/bin/bash
clear 

user=`id -g`

if [ "$user" != 10 ] 
 then
       echo
	if [ "$user" != 0 ]
		then
			if [ "$user" != 1000 ]
		then
			echo "No tienes los privilegios necesarios para utilizar esta opcion"
			exit 1
		fi
			
	fi
fi

while [ "$menu_automatizacion" != 0 ] 
do
    echo
    echo "#########################"
    echo "# Menu automatizacion #"
    echo "#########################" 
    echo "
  1) Server config.
  2) Informix. 
  3) Datos BD.
  4) OpManager.
  0) Volver atras."
    echo
read -p " Seleccione la opcion deseada: " menu_automatizacion
echo

case $menu_automatizacion in

1)clear 
    bash sv_config_SO.sh;;
2) clear 
    bash menu_informix.sh;;
3) clear
    bash menu_datos.sh;;
4) clear
    bash opManager.sh;;    
0) clear
   bash HMG_main_menu.sh;;
*)clear
        echo -e '\e[1;31mOpcion invalida, por favor ingrese una opcion del menu 
                     presione enter para continuar\e[0m'
		        read -n1
		clear;;
             
esac
done