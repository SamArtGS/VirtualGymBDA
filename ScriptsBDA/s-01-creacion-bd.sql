--@Autors: Garrido Samuel  y Cárdenas Jorge
--@Fecha: 2 - Feb - 2021
--@Descricción: Creación BD

startup nomount
create database gacabda
user sys identified by samjor
user system identified by samjor
logfile group 1 ( 
	'/u01/app/oracle/oradata/GACABDA/disk_1/redo01a.log',
	'/u01/app/oracle/oradata/GACABDA/disk_2/redo01b.log',
	'/u01/app/oracle/oradata/GACABDA/disk_3/redo01c.log'
	) size 100m blocksize 512,
group 2 (
	'/u01/app/oracle/oradata/GACABDA/disk_1/redo02a.log',
	'/u01/app/oracle/oradata/GACABDA/disk_2/redo02b.log',
	'/u01/app/oracle/oradata/GACABDA/disk_3/redo02c.log'
	) size 100m blocksize 512,
group 3 (
	'/u01/app/oracle/oradata/GACABDA/disk_1/redo03a.log',
	'/u01/app/oracle/oradata/GACABDA/disk_2/redo03b.log',
	'/u01/app/oracle/oradata/GACABDA/disk_3/redo03c.log'
	) size 100m blocksize 512
maxloghistory 1 
maxlogfiles 16
maxlogmembers 3
maxdatafiles 1024
character set AL32UTF8
national character set AL16UTF16
extent management local
datafile '/u01/app/oracle/oradata/GACABDA/disk_4/system01.dbf'
size 700m reuse autoextend on next 10240k maxsize unlimited
sysaux datafile '/u01/app/oracle/oradata/GACABDA/disk_4/sysaux01.dbf'
size 550m reuse autoextend on next 10240k maxsize unlimited
default tablespace users
datafile '/u01/app/oracle/oradata/GACABDA/disk_4/users01.dbf'
size 500m reuse autoextend on maxsize unlimited
default temporary tablespace tempts1
tempfile '/u01/app/oracle/oradata/GACABDA/disk_4/temp01.dbf'
size 1024m reuse autoextend on next 640k maxsize unlimited
undo tablespace undotbs1
datafile '/u01/app/oracle/oradata/GACABDA/disk_4/undotbs01.dbf'
size 2048m reuse autoextend on next 5120k maxsize unlimited;


alter user sys identified by samjor;
alter user system identified by samjor;

-- Creación del diccionario de datos

conn sys/samjor;
@?/rdbms/admin/catalog.sql 
@?/rdbms/admin/catproc.sql 
@?/rdbms/admin/utlrp.sql
conn system/samjor;
@?/sqlplus/admin/pupbld.sql