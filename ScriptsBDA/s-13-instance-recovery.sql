@bitacora.sql

shutdown abort;

startup;

alter system set fast_start_mttr_target=20 scope=both;

@bitacora.sql

shutdown abort;

startup;