#!/bin/bash
clear
echo 
fecha=`date +%Y-%m-%d`
fechaVieja=`date +%Y-%m-%d -d "8 days ago"`

while [ "$op" != 0 ]
 do
  echo
  echo "#################################"
  echo "#  Menu de tratamiento de logs  #"
  echo "#################################"
  echo "
   1) Ver el archivo messages.
   2) Ver el archivo secure.
   3) Ver ultimos 20 usuarios logeados
   4) Ver intentos 20 de accesos fallidos
   0) Atras."
  echo
  read -p " Seleccione la opcion deseada: " op 
   
   case $op in
    
    1)clear
	sudo less /var/log/messages ;;
	 
    2)clear
	sudo less /var/log/secure ;;
    
    3)clear 
        sudo last -ain 20;;
        echo "Presione enter para contitunar"
        read -n1
            ;;
    4)clear 
        sudo lastb -ain 20;;
    echo "Presione enter para contitunar"
        read -n1
            ;;
    0)clear
       bash HMG_main_menu.sh;;
    
    *)clear
        echo -e '\e[1;31mOpcion invalida, por favor ingrese una opcion del menu 
                     presione enter para continuar\e[0m'
		        read -n1
		clear;;
            
   esac
done
