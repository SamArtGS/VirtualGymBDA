--@Autores: Jorge Cárdenas Cárdenas
--          Samuel Arturo Garrido Sánchez
--@Fecha creación: 03/02/2021
--@Descripción: Simulación de carga


-- Carga diaria 1

select * from v$log;
alter system CHECKPOINT;
alter system switch LOGFILE;
select thread#,sequence#,blocks*block_size/1024/1024 as datos_mb from V$ARCHIVED_LOG order by first_time desc;
select * from v$log;
--Total cargado
select thread#,sum(trunc(blocks*block_size/1024/1024,2)) as datos_mb from V$ARCHIVED_LOG where sequence#>210 group by thread#;

-- Carga diaria 2

select * from v$log;
alter system CHECKPOINT;
alter system switch LOGFILE;
select thread#,sequence#,blocks*block_size/1024/1024 as datos_mb from V$ARCHIVED_LOG order by first_time desc;
select thread#,sum(trunc(blocks*block_size/1024/1024,2)) as datos_mb from V$ARCHIVED_LOG where sequence#>222 group by thread#;
select * from v$log;
-- Carga diaria 3

select * from v$log;
alter system CHECKPOINT;
alter system switch LOGFILE;
select thread#,sequence#,blocks*block_size/1024/1024 as datos_mb from V$ARCHIVED_LOG order by first_time desc;
select thread#,sum(trunc(blocks*block_size/1024/1024,2)) as datos_mb from V$ARCHIVED_LOG where sequence#>230 group by thread#;
select * from v$log;
-- Carga diaria 4

select * from v$log;
alter system CHECKPOINT;
alter system switch LOGFILE;
select thread#,sequence#,blocks*block_size/1024/1024 as datos_mb from V$ARCHIVED_LOG order by first_time desc;
select thread#,sum(trunc(blocks*block_size/1024/1024,2)) as datos_mb from V$ARCHIVED_LOG where sequence#>241 group by thread#;
select * from v$log;

-- Carga diaria 5

select * from v$log;
alter system CHECKPOINT;
alter system switch LOGFILE;
select thread#,sequence#,blocks*block_size/1024/1024 as datos_mb from V$ARCHIVED_LOG order by first_time desc;
select thread#,sum(trunc(blocks*block_size/1024/1024,2)) as datos_mb from V$ARCHIVED_LOG where sequence#>250 group by thread#;
select * from v$log;

-- Carga diaria 6

select * from v$log;
alter system CHECKPOINT;
alter system switch LOGFILE;
select thread#,sequence#,blocks*block_size/1024/1024 as datos_mb from V$ARCHIVED_LOG order by first_time desc;
select thread#,sum(trunc(blocks*block_size/1024/1024,2)) as datos_mb from V$ARCHIVED_LOG where sequence#>261 group by thread#;
select * from v$log;

-- Carga diaria 7

select * from v$log;
alter system CHECKPOINT;
alter system switch LOGFILE;
select thread#,sequence#,blocks*block_size/1024/1024 as datos_mb from V$ARCHIVED_LOG order by first_time desc;
select thread#,sum(trunc(blocks*block_size/1024/1024,2)) as datos_mb from V$ARCHIVED_LOG where sequence#>267 group by thread#;
select * from v$log;

-- Carga diaria 8

select * from v$log;
alter system CHECKPOINT;
alter system switch LOGFILE;
select thread#,sequence#,blocks*block_size/1024/1024 as datos_mb from V$ARCHIVED_LOG order by first_time desc;
select thread#,sum(trunc(blocks*block_size/1024/1024,2)) as datos_mb from V$ARCHIVED_LOG where sequence#>275 group by thread#;
select * from v$log;

-- Carga diaria 9

select * from v$log;
alter system CHECKPOINT;
alter system switch LOGFILE;
select thread#,sequence#,blocks*block_size/1024/1024 as datos_mb from V$ARCHIVED_LOG order by first_time desc;
select thread#,sum(trunc(blocks*block_size/1024/1024,2)) as datos_mb from V$ARCHIVED_LOG where sequence#>287 group by thread#;
select * from v$log;

-- Carga diaria 10

select * from v$log;
alter system CHECKPOINT;
alter system switch LOGFILE;
select thread#,sequence#,blocks*block_size/1024/1024 as datos_mb from V$ARCHIVED_LOG order by first_time desc;
select thread#,sum(trunc(blocks*block_size/1024/1024,2)) as datos_mb from V$ARCHIVED_LOG where sequence#>298 group by thread#;
select * from v$log;