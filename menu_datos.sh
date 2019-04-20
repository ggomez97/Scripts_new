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
  11) Insert listas.
  12) Insert calificaciones.
  13) Inserta alumno tiene materia.
  14) Insert Vista proemedio grupo materia.
  15) Insert vista listado de alumnos por instituto.
  16) Insert cantidad de grupos estudiantes y docentes de los institutos.
  17) Insert permisos y roles 
  0) Volver atras."
    echo
read -p " Seleccione la opcion deseada: " menu_datos
echo

case $menu_datos in

1)clear 
    dbaccess - 1_Tablas.sql;;
2) clear 
    dbaccess - 2_insert_ciudades.sql;;
3) clear
    dbaccess - 3_insert_institutos.sql;;
4) clear
    dbaccess - 4_insert_personas;;
5)clear
    dbaccess - 5_insert_persona_pertenece_grupo.sql;;
6)clear
   dbaccess - 6_insert_orientaciones.sql;;
7)clear
    dbaccess - 7_insert_materias.sql;;     
8)clear
    dbaccess - 8_insert_grupos.sql;;
9)clear
    dbaccess - 9_insert_alumno_pertenece_grupo.sql;;
10)clear
    dbaccess - 10_insert_docente_dicta_materia.sql;;
11)clear
    dbaccess - 11_insert_listas.sql;;
12)clear
    dbaccess - 12_insert_calificaciones.sql;;
13)clear
    dbaccess - 13_insert_alumno_tiene_materia.sql;;
14)clear
    dbaccess - 14_view_promedio_grupo_materia.sql;;
15)clear
    dbaccess - 15_view_listado_alumnos_instituto
16)clear
    dbaccess - 16_view_grupos_estudiantes_docentes_en_instituto.sql;;    
17)clear 
    dbaccess - ULTIMO_permisos.sql;;                       

0) clear
   bash HMG_main_menu.sh;;
*)clear
        echo -e '\e[1;31mOpcion invalida, por favor ingrese una opcion del menu 
        presione enter para continuar\e[0m'
		read -n1
		clear;;

esac
done