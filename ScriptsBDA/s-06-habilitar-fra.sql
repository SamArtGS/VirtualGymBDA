--@Autores: Jorge Cárdenas Cárdenas
--          Samuel Arturo Garrido Sánchez
--@Fecha creación: 03/02/2021
--@Descripción: Creación de objetos

-- Respaldo del spfile
create pfile from spfile;

-- Actualización de Parametros
alter system set db_recovery_file_dest_size = 40G scope = both;
alter system set db_recovery_file_dest='/configurar' scope = both;
alter system set db_flashback_retention_target=14400 scope = both; -- 10 días

alter session set nls_date_format="yyyy-mm-dd hh24:mi:ss";