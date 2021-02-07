--@Autors: Garrido Samuel  y Cárdenas Jorge
--@Fecha: 2 - Feb - 2021
--@Descricción: Creación de usuarios y roles

declare
  cursor cur_usuarios is
    select username from dba_users where username like 'USER_%';
  cursor cur_roles is
    select role from dba_roles where role like 'ROL_ADMINISTRACION';
begin
  for r in cur_usuarios loop
    execute immediate 'drop user ' ||r.username||' cascade';
  end loop;
  for r in cur_roles loop
    execute immediate 'drop role ' ||r.role;
  end loop;
end;
/

create role rol_administracion;

grant create procedure, create sequence, create session, create synonym, 
  create table, create trigger, create view
to rol_administracion;

create user user_cliente identified by cliente
  default tablespace tbs_cliente
  quota unlimited on tbs_cliente;

grant rol_administracion to user_cliente;

create user user_empleado identified by empleado
  default tablespace tbs_empleado
  quota unlimited on tbs_empleado;

grant rol_administracion to user_empleado;

create user user_infraestructura identified by infraestructura
  default tablespace tbs_infraestructura
  quota unlimited on tbs_infraestructura;

grant rol_administracion to user_infraestructura;