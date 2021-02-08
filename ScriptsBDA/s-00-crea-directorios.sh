#!/bin/bash

# @Autor: Jorge Cárdenas Cárdenas
#         Samuel Arturo Garrido Sánchez
# @Fecha: 01/02/2021
# @Descripción: Script ejercicio 2 - BDA

if [ -d /u01/disk1/ ]; then
    echo "Carpeta /u01/disk1/ existe."
else
    mkdir /u01/disk1/
fi

if [ -d /u01/disk2/ ];then
    echo "Carpeta /u01/disk2/ existe."
else
    mkdir /u01/disk2/
fi

if [ -d /u01/disk3/ ];then
    echo "Carpeta /u01/disk3/ existe."
else
    mkdir /u01/disk3/
fi

if [ -d /u01/app/oracle/oradata/GACABDA/ ];then
    echo "La carpeta /u01/app/oracle/oradata/GACA/ ya existe."
else
    mkdir /u01/app/oracle/oradata/GACABDA/
fi

if [ -d /u01/app/oracle/oradata/GACABDA/ ];then
    echo "La carpeta /u01/app/oracle/oradata/GACA/ ya existe."
else
    mkdir /u01/app/oracle/oradata/GACABDA/
fi

if [ -d /u01/app/oracle/oradata/GACABDA/ ];then
    echo "La carpeta /u01/app/oracle/oradata/GACA/ ya existe."
else
    mkdir /u01/app/oracle/oradata/GACABDA/
fi

echo "ORACLE_SID: ${ORACLE_SID}"
 
if [ -f "/u01/app/oracle/product/18.0.0/dbhome_1/dbs/orapwgacabda" ]; then
   echo "El archivo de passwords existe." 
else
    orapwd FORCE=Y \
    FILE='/u01/app/oracle/product/18.0.0/dbhome_1/dbs/orapwgacabda' \
    FORMAT=12.2 \
    SYS=password
fi

echo \
"db_name='gacabda'
memory_target=4G
control_files=(/u01/disk1/control01.ctl,
/u01/disk2/control02.ctl,/u01/disk3/control03.ctl)" > $ORACLE_HOME/dbs/initgacabda.ora

export ORACLE_SID=gacabda