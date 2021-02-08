--@Autors: Garrido Samuel  y Cárdenas Jorge
--@Fecha: 2 - Feb - 2021
--@Descricción: Creación de tablespaces

create tablespace tbs_infraestructura
  datafile '/u01/app/oracle/oradata/GACABDA/disk_5/df_infraestructura_01.dbf' 
    size 1024m autoextend on next 1024k maxsize unlimited
  extent management local autoallocate
  logging
  online
  segment space management auto;

create tablespace tbs_cliente
  datafile '/u01/app/oracle/oradata/GACABDA/disk_6/df_cliente_01.dbf' 
    size 4096m reuse autoextend on next 102400k maxsize unlimited,
    '/u01/app/oracle/oradata/GACABDA/disk_6/df_cliente_02.dbf' 
    size 4096m reuse autoextend on next 102400k maxsize unlimited
  extent management local autoallocate
  logging
  online
  segment space management auto;

create tablespace tbs_empleado
  datafile '/u01/app/oracle/oradata/GACABDA/disk_7/df_empleado_01.dbf' 
    size 1024m reuse autoextend on next 1024k maxsize unlimited
  extent management local autoallocate
  logging
  online
  segment space management auto;

create tablespace tbs_blob
  datafile '/u01/app/oracle/oradata/GACABDA/disk_8/df_blob_01.dbf' size 1024m 
    reuse autoextend on next 1024k maxsize unlimited,
  '/u01/app/oracle/oradata/GACABDA/disk_9/df_blob_02.dbf' size 1024m 
    reuse autoextend on next 1024k maxsize unlimited
  extent management local autoallocate
  logging
  online
  segment space management auto;

create tablespace tbs_blob_index
  datafile '/u01/app/oracle/oradata/GACABDA/disk_10/df_blob_index_01.dbf' 
    size 500m autoextend on next 1024k maxsize unlimited
  extent management local autoallocate
  logging
  online
  segment space management auto;

create tablespace tbs_index
  datafile '/u01/app/oracle/oradata/GACABDA/disk_11/df_index_01.dbf' 
    size 500m autoextend on next 1024k maxsize unlimited
  extent management local autoallocate
  logging
  online
  segment space management auto;

create tablespace tbs_partition
  datafile '/u01/app/oracle/oradata/GACABDA/disk_12/df_particion_01.dbf' 
    size 3072m reuse autoextend on next 1024k maxsize unlimited,
    '/u01/app/oracle/oradata/GACABDA/disk_12/df_particion_02.dbf' 
    size 3072m reuse autoextend on next 1024k maxsize unlimited
  extent management local autoallocate
  logging
  online
  segment space management auto;