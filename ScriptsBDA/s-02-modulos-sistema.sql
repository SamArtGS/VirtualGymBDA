create tablespace infraestructura_tbs
datafile '/u01/app/oracle/oradata/GACABDA/disco01/infraestructura/datafile.dbf' 
size 1024m 
autoextend on 
next 102400k 
maxsize 2097152k
extent management local autoallocate
logging
online
segment space management auto;

create tablespace cliente_tbs
datafile '/u01/app/oracle/oradata/GACABDA/disco02/cliente/datafile.dbf' 
size 1024m 
autoextend on 
next 102400k 
maxsize 2097152k
extent management local autoallocate
logging
online
segment space management auto;

create tablespace empleado_tbs
datafile '/u01/app/oracle/oradata/GACABDA/disco03/empleado/datafile.dbf' 
size 1024m 
autoextend on 
next 102400k 
maxsize 2097152k
extent management local autoallocate
logging
online
segment space management auto;

create tablespace blob_tbs
datafile '/u01/app/oracle/oradata/GACABDA/disco04/blob/datafile.dbf'
size 1024m autoextend on 
next 102400k 
maxsize 2097152k
extent management local autoallocate
logging
online
segment space management auto;



