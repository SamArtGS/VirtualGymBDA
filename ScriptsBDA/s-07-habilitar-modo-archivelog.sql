--@Autores: Jorge Cárdenas Cárdenas
--          Samuel Arturo Garrido Sánchez
--@Fecha creación: 03/02/2021
--@Descripción: Habilitación del modo archive log

-- Respaldo del spfile
create pfile from spfile;

-- Detener la instancia de forma ordenada para evitar instance recovery.
shutdown immediate
startup

connect sys/system as sysdba

-- Configuración de parámetros
alter system set log_archive_max_processes = 5 scope=spfile;
alter system set log_archive_format = 'arch_gacabda_%t_%s_%r.arc' scope = spfile;
alter system set log_archive_dest_1 = 'location=use_bd_recovery_file_dest' scope = spfile;
alter system set log_archive_dest_2 = 'location=/u01/FRA/onlineredolog' scope = spfile;
alter system set log_archive_min_succeed_dest = 1 scope = spfile;
alter system set DB_CREATE_ONLINE_LOG_DEST_1 = 'location=use_bd_recovery_file_dest' scope = spfile;

-- Inciar la instancia en modo mount
shutdown immediate
startup mount

-- Habilitar el modo archivelog.
alter database archivelog;
alter database open;

-- Comprobar cambios
archive log list