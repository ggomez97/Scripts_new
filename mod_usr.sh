#!/bin/bash
clear
read -p "Nombre del usuario al cual cambiar la informacion personal:" username
     sudo chfn $username
     echo "Presione enter para volver al menu de usuarios"
     read -n1
     clear
     #PONER PA TODOS (ECHO READ CLEAR) (ES POR ESTO QUE TENES QUE APRETAR 0 MUCHAS VECES ,CREGO JEJ)