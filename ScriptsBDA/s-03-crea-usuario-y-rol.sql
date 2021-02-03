create role rol administracion not identified;

create user user cliente identified by cliente default tablespace cliente_tbs quota unlimited on cliente_tbs;

create user user empleado identified by empleado default tablespace empleado_tbs quota unlimited on empleado_tbs;

create user user infraestructura identified by admin default tablespace infraestructura_tbs quota unlimited on infraestructura_tbs;