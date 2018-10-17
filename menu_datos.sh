#!/bin/bash
clear
while [ "$menu_datos" != 0 ]
do
    echo
    echo "#########################"
    echo "# Menu datos #"
    echo "#########################" 
    echo "
  1) Estructura BD.
  2) Insert ciudades.
  3) Insert institutos.
  4) Insert personas.
  5) Insert personas en institutos.
  6) Insert orientaciones.
  7) Insert Materias.
  8) Insert grupos.
  9) Insert alumnos pertenece a grupos.
  10) Insert alumnos tienen materias.
  0) Volver atras."
    echo
read -p " Seleccione la opcion deseada: " menu_datos
echo

case $menu_datos in

1)clear 
    dbaccess - 1_Tablas.sql;;
2) clear 
    menu_informix.sh;;
3) clear
    menu_datos.sh;;
4) clear
    clamAV_automatico.sh;;    
0) clear
   bash HMG_main_menu.sh;;
*)clear
        echo -e '\e[1;31mOpcion invalida, por favor ingrese una opcion del menu 
        presione enter para continuar\e[0m'
		read -n1
		clear;;

esac
done