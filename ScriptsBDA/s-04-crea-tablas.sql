--@Autors: Garrido Samuel  y Cárdenas Jorge
--@Fecha: 2 - Feb - 2021
--@Descricción: Creación de objetos

create sequence user_cliente.seq_bitacora
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_cliente.seq_cliente
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_clientes_gimnasio
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_disciplina
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_dispositivo
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_dispositivo_sesion
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_empleado.seq_empleado
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_gimnasio
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_historico_status_disp
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_multimedia
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_empleado.seq_puesto
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_cliente.seq_reporte_fisico
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_sala
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_sala_disciplina
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_cliente.seq_sensor
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_cliente.seq_sesion
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_status_dispositivo
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_infraestructura.seq_tipo_dispositivo
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create sequence user_empleado.seq_url
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20;

create table user_cliente.cliente(
  cliente_id          number(10, 0)    not null,
  nombre              varchar2(40)     not null,
  ap_paterno          varchar2(40)     not null,
  ap_materno          varchar2(40)             ,
  email               varchar2(100)    not null,
  username            varchar2(40)     not null,
  password            varchar2(255)    not null,
  direccion           varchar2(255)    not null,
  fecha_nacimiento    date             not null,
  curp                varchar2(18)     not null,
  foto                blob             not null,
  constraint cliente_pk primary key (cliente_id)
) lob(foto) store as  (tablespace tbs_blob);

create table user_empleado.puesto(
  puesto_id      number(10, 0)    not null,
  nombre         varchar2(40)     not null,
  clave          varchar2(10)     not null,
  descripcion    varchar2(255)    not null,
  constraint puesto_id_pk primary key (puesto_id)
);

create table user_empleado.empleado(
  empleado_id         number(10, 0)    not null,
  nombre              varchar2(40)     not null,
  ap_paterno          varchar2(40)     not null,
  ap_materno          varchar2(40),
  curp                varchar2(18)     not null,
  num_trabajador      number(10, 0)    not null,
  rfc                 varchar2(15)     not null,
  fecha_nacimiento    date             not null,
  email               varchar2(100)    not null,
  foto                blob             not null,
  tipo                char(1)          not null,
  puesto_id           number(10, 0)    not null,
  gimnasio_id         number(10, 0)    not null,
  constraint empleado_pk primary key (empleado_id),
  constraint empleado_puesto_id_fk foreign key (puesto_id)
  references user_empleado.puesto(puesto_id)
) lob(foto) store as  (tablespace tbs_blob);


create table user_empleado.administrativo(
  empleado_id            number(10, 0)    not null,
  login                  varchar2(40)     not null,
  password               varchar2(255)    not null,
  rol                    char(1)          not null,
  certificado_digital    blob             not null,
  constraint administrativo_pk primary key (empleado_id), 
  constraint administrativo_empleado_id_fk foreign key (empleado_id)
  references user_empleado.empleado(empleado_id)
) lob(certificado_digital) store as  (tablespace tbs_blob);

grant select on user_empleado.administrativo to user_infraestructura;
grant references (empleado_id) on user_empleado.administrativo to user_infraestructura;

create table user_infraestructura.gimnasio(
  gimnasio_id    number(10, 0)    not null,
  folio          varchar2(5)      not null,
  nombre         varchar2(40)     not null,
  direccion      varchar2(255)    not null,
  latitud        number(8, 5)     not null,
  longitud       number(8, 5)     not null,
  telefono       varchar2(10)     not null,
  pagina_web     varchar2(255)    not null,
  constraint gimnasio_pk primary key (gimnasio_id)
);

grant references (cliente_id) on user_cliente.cliente to user_infraestructura;

create table user_infraestructura.clientes_gimnasio(
  cliente_gimnasio_id    number(10, 0)    not null,
  gimnasio_id            number(10, 0)    not null,
  cliente_id             number(10, 0)    not null,
  constraint clientes_gimnasio_pk primary key (cliente_gimnasio_id), 
  constraint clientes_gimnasio_cliente_id_fk foreign key (cliente_id)
    references user_cliente.cliente(cliente_id),
  constraint clientes_gimnasio_gimnasio_id_fk foreign key (gimnasio_id)
    references user_infraestructura.gimnasio(gimnasio_id)
);

create table user_infraestructura.disciplina(
  disciplina_id    number(10, 0)    not null,
  clave            varchar2(10)     not null,
  nombre           varchar2(40)     not null,
  descripcion      varchar2(255)    not null,
  icono            blob             not null,
  constraint disciplina_pk primary key (disciplina_id)
) lob(icono) store as  (tablespace tbs_blob);

create table user_infraestructura.sala(
  sala_id          number(10, 0)    not null,
  clave            varchar2(3)      not null,
  nombre           varchar2(40)     not null,
  capacidad_max    number(3, 0)     not null,
  gimnasio_id      number(10, 0)    not null,
  empleado_id      number(10, 0)    not null,
  constraint sala_pk primary key (sala_id), 
  constraint sala_empleado_id_fk foreign key (empleado_id)
    references user_empleado.administrativo(empleado_id),
  constraint sala_gimnasio_id_fk foreign key (gimnasio_id)
    references user_infraestructura.gimnasio(gimnasio_id)
);

create table user_infraestructura.status_dispositivo(
  status_dispositivo_id    number(10, 0)    not null,
  clave                    varchar2(10)     not null,
  descripcion              varchar2(255)    not null,
  constraint status_dispositivo_pk primary key (status_dispositivo_id)
);

create table user_infraestructura.tipo_dispositivo(
  tipo_dispositivo_id    number(10, 0)    not null,
  nombre                 varchar2(40)     not null,
  descripcion            varchar2(255)    not null,
  constraint tipo_dispositivo_pk primary key (tipo_dispositivo_id)
);

create table user_infraestructura.dispositivo(
  dispositivo_id           number(10, 0)    not null,
  num_inventario           varchar2(18)     not null,
  fecha_adquisicion        date             not null,
  fecha_status             date             not null,
  tipo_dispositivo_id      number(10, 0)    not null,
  sala_id                  number(10, 0)    not null,
  status_dispositivo_id    number(10, 0)    not null,
  constraint dispositivo_pk primary key (dispositivo_id), 
  constraint dispositivo_sala_id_fk foreign key (sala_id)
    references user_infraestructura.sala(sala_id),
  constraint dispositivo_status_dispositivo_id_fk foreign key (status_dispositivo_id)
    references user_infraestructura.status_dispositivo(status_dispositivo_id),
  constraint dispositivo_tipo_dispositivo_id_fk foreign key (tipo_dispositivo_id)
    references user_infraestructura.tipo_dispositivo(tipo_dispositivo_id)
);

create table user_infraestructura.historico_status_dispositivo(
  historico_status_dispositivo_id    number(10, 0)    not null,
  fecha_status                       date             not null,
  status_dispositivo_id              number(10, 0)    not null,
  dispositivo_id                     number(10, 0)    not null,
  constraint historico_status_dispositivo_pk primary key (historico_status_dispositivo_id), 
  constraint historico_status_dispositivo_dispositivo_id_fk foreign key (dispositivo_id)
    references user_infraestructura.dispositivo(dispositivo_id),
  constraint historico_status_dispositivo_status_dispositivo_id_fk foreign key (status_dispositivo_id)
    references user_infraestructura.status_dispositivo(status_dispositivo_id)
);

create table user_infraestructura.multimedia(
  multimedia_id    number(10, 0)    not null,
  archivo          blob             not null,
  tipo_archivo     char(1)          not null,
  vigencia         date             not null,
  gimnasio_id      number(10, 0)    not null,
  constraint multimedia_pk primary key (multimedia_id), 
  constraint multimedia_gimnasio_id_fk foreign key (gimnasio_id)
    references user_infraestructura.gimnasio(gimnasio_id)
) lob(archivo) store as (tablespace tbs_blob);

create table user_infraestructura.sala_disciplina(
  sala_disciplina    number(10, 0)    not null,
  sala_id            number(10, 0)    not null,
  disciplina_id      number(10, 0)    not null,
  constraint sala_disciplina_pk  primary key (sala_disciplina), 
  constraint sala_disciplina_disciplina_id_fk foreign key (disciplina_id)
    references user_infraestructura.disciplina(disciplina_id),
  constraint sala_disciplina_sala_id_fk foreign key (sala_id)
    references user_infraestructura.sala(sala_id)
);

create table user_empleado.instructor(
  empleado_id           number(10, 0)    not null,
  anios_experiencia     number(2, 0)     not null,
  cedula_profesional    number(10, 0)    not null,
  suplente_id           number(10, 0),
  constraint instructor_pk primary key (empleado_id), 
  constraint instructor_empleado_id_fk foreign key (empleado_id)
    references user_empleado.empleado(empleado_id),
  constraint instructor_suplente_id_fk foreign key (suplente_id)
    references user_empleado.instructor(empleado_id)
);

create table user_cliente.sensor(
  sensor_id       number(10, 0)    not null,
  num_serie       varchar2(20)     not null,
  fecha_compra    date             not null,
  marca           varchar2(40)     not null,
  cliente_id      number(10, 0)    not null,
  constraint sensor_pk primary key (sensor_id), 
  constraint sensor_cliente_id_fk foreign key (cliente_id)
  references user_cliente.cliente(cliente_id)
);

grant references (empleado_id) on user_empleado.instructor to user_cliente;
grant references (sala_id) on user_infraestructura.sala to user_cliente;

create table user_cliente.sesion(
  sesion_id             number(10, 0)    not null,
  num_sesion_cliente    number(10, 0)    not null,
  fecha_inicio          date             not null,
  fecha_fin             date             not null,
  tipo_sesion           char(1)          not null,
  cliente_id            number(10, 0)    not null,
  empleado_id           number(10, 0),
  sala_id               number(10, 0),
  sensor_id             number(10, 0),
  constraint sesion_pk primary key (sesion_id), 
  constraint sesion_cliente_id_fk foreign key (cliente_id)
    references user_cliente.cliente(cliente_id),
  constraint sesion_empleado_id_fk foreign key (empleado_id)
    references user_empleado.instructor(empleado_id),
  constraint sesion_sala_id_fk foreign key (sala_id)
    references user_infraestructura.sala(sala_id),
  constraint sesion_sensor_id_fk foreign key (sensor_id)
    references user_cliente.sensor(sensor_id)
);

create table user_cliente.bitacora(
  bitacora_id            number(10, 0)    not null,
  calorias_consumidas    number(6, 0)     not null,
  fecha_hora_registro    date             not null,
  sesion_id              number(10, 0)    not null,
  constraint bitacora_pk primary key (bitacora_id), 
  constraint bitacora_sesion_id_fk foreign key (sesion_id)
    references user_cliente.sesion(sesion_id)
)
partition by range(fecha_hora_registro) 
interval(numtoyminterval(1,'MONTH'))
( partition 
  p0 values less than(to_date('01-01-2020','dd-mm-yyyy')), 
  partition p1 values less than(to_date('01-02-2020','dd-mm-yyyy')), 
  partition p2 values less than(to_date('01-03-2020','dd-mm-yyyy'))
);

-- alter table user_cliente.bitacora modify partition by range(fecha_hora_registro) interval(numtoyminterval(1,'MONTH'))(partition p0 values less than(to_date('01-01-2020','dd-mm-yyyy')), partition p1 values less than(to_date('01-02-2020','dd-mm-yyyy')), partition p2 values less than(to_date('01-03-2020','dd-mm-yyyy')));

create table user_cliente.credencial_cliente(
  cliente_id       number(10, 0)    not null,
  vigencia         date             not null,
  codigo_barras    number(15, 0)    not null,
  imagen_barras    blob             not null,
  folio            varchar2(8)      not null,
  constraint credencial_cliente_pk primary key (cliente_id), 
  constraint credencial_cliente_cliente_id_fk foreign key (cliente_id)
    references user_cliente.cliente(cliente_id)
) lob (imagen_barras) store as (tablespace tbs_blob);

create table user_cliente.reporte_fisico(
  reporte_fisico_id    number(10, 0)    not null,
  peso                 number(5, 2)     not null,
  imc                  number(4, 2)     not null,
  estatura             number(3, 2)     not null,
  fecha_registro       date             not null,
  cliente_id           number(10, 0)    not null,
  constraint reporte_fisico_pk primary key (reporte_fisico_id), 
  constraint reporte_fisico_cliente_id_fk foreign key (cliente_id)
    references user_cliente.cliente(cliente_id)
);

create table user_empleado.huella_digital(
  empleado_id          number(10, 0)    not null,
  pulgar_derecho       blob,
  indice_derecho       blob,
  medio_derecho        blob,
  anular_derecho       blob,
  menique_derecho      blob,
  pulgar_izquierdo     blob,
  indice_izquierdo     blob,
  medio_izquierdo      blob,
  anular_izquierdo     blob,
  menique_izquierdo    blob,
  constraint huella_digital_pk primary key (empleado_id), 
  constraint huella_digital_empleado_id_fk foreign key (empleado_id)
    references user_empleado.empleado(empleado_id)
) lob(pulgar_derecho) store as  (tablespace tbs_blob)
lob(indice_derecho) store as  (tablespace tbs_blob)
lob(medio_derecho) store as  (tablespace tbs_blob)
lob(anular_derecho) store as  (tablespace tbs_blob)
lob(menique_derecho) store as  (tablespace tbs_blob)
lob(pulgar_izquierdo) store as  (tablespace tbs_blob)
lob(indice_izquierdo) store as  (tablespace tbs_blob)
lob(medio_izquierdo) store as  (tablespace tbs_blob)
lob(anular_izquierdo) store as  (tablespace tbs_blob)
lob(menique_izquierdo) store as  (tablespace tbs_blob);

create table user_empleado.urls(
  url_id         number(10, 0)    not null,
  url            varchar2(255)    not null,
  empleado_id    number(10, 0)    not null,
  constraint urls_pk primary key (url_id), 
  constraint urls_empleado_id_fk foreign key (empleado_id)
    references user_empleado.instructor(empleado_id)
);

grant references (sesion_id) on user_cliente.sesion to user_infraestructura;

create table user_infraestructura.dispositivo_sesion(
  dispositivo_sesion_id    number(10, 0)    not null,
  dispositivo_id           number(10, 0)    not null,
  sesion_id                number(10, 0)    not null,
  constraint aparto_sesion_pk primary key (dispositivo_sesion_id), 
  constraint dispositivo_sesion_dispositivo_id_fk foreign key (dispositivo_id)
    references user_infraestructura.dispositivo(dispositivo_id),
  constraint dispositivo_sesion_sesion_id_fk foreign key (sesion_id)
    references user_cliente.sesion(sesion_id)
);

alter user user_infraestructura quota unlimited on tbs_blob;
alter user user_empleado quota unlimited on tbs_blob;
alter user user_cliente quota unlimited on tbs_blob;

alter user user_infraestructura quota unlimited on TBS_INDEX;
alter user user_empleado quota unlimited on TBS_INDEX;
alter user user_cliente quota unlimited on TBS_INDEX;

CREATE UNIQUE INDEX USER_INFRAESTRUCTURA.DISCIPLINA_CLAVE_UK ON USER_INFRAESTRUCTURA.DISCIPLINA(CLAVE)
TABLESPACE TBS_INDEX;

CREATE INDEX USER_INFRAESTRUCTURA.GIMNASIO_FOLIO_UX ON USER_INFRAESTRUCTURA.GIMNASIO(FOLIO)
TABLESPACE TBS_INDEX;

CREATE INDEX USER_INFRAESTRUCTURA.GIMNASIO_NOMBRE_IX ON USER_INFRAESTRUCTURA.GIMNASIO(UPPER(NOMBRE))
TABLESPACE TBS_INDEX;

CREATE INDEX USER_INFRAESTRUCTURA.SALA_CLAVE_IX ON USER_INFRAESTRUCTURA.SALA(CLAVE)
TABLESPACE TBS_INDEX;

CREATE UNIQUE INDEX USER_INFRAESTRUCTURA.STATUS_DISPOSITIVO_CLAVE_UK ON USER_INFRAESTRUCTURA.STATUS_DISPOSITIVO(CLAVE)
TABLESPACE TBS_INDEX;

CREATE INDEX USER_INFRAESTRUCTURA.TIPO_DISPOSITIVO_NOMBRE_IX ON USER_INFRAESTRUCTURA.TIPO_DISPOSITIVO(UPPER(NOMBRE))
TABLESPACE TBS_INDEX;

CREATE INDEX USER_CLIENTE.FECHA_IX ON USER_CLIENTE.BITACORA(FECHA_HORA_REGISTRO)
TABLESPACE TBS_INDEX;

CREATE INDEX USER_CLIENTE.CLIENTE_USERNAME_UK ON USER_CLIENTE.CLIENTE(USERNAME)
TABLESPACE TBS_INDEX;

CREATE UNIQUE INDEX USER_CLIENTE.CLIENTE_CURP_UK ON USER_CLIENTE.CLIENTE(CURP)
TABLESPACE TBS_INDEX;

CREATE UNIQUE INDEX USER_CLIENTE.CREDENCIAL_CLIENTE_CODIGO_BARRAS_UK ON USER_CLIENTE.CREDENCIAL_CLIENTE(CODIGO_BARRAS)
TABLESPACE TBS_INDEX;

CREATE INDEX USER_CLIENTE.CREDENCIAL_CLIENTE_FOLIO_UK ON USER_CLIENTE.CREDENCIAL_CLIENTE(FOLIO)
TABLESPACE TBS_INDEX;

CREATE INDEX USER_CLIENTE.REPORTE_FISICO_FECHA_REGISTRO_IX ON USER_CLIENTE.REPORTE_FISICO(FECHA_REGISTRO)
TABLESPACE TBS_INDEX;

CREATE INDEX USER_CLIENTE.SENSOR_NUM_SERIE_UK ON USER_CLIENTE.SENSOR(NUM_SERIE)
TABLESPACE TBS_INDEX;

CREATE INDEX USER_CLIENTE.SESION_FECHA_INICIO_IX ON USER_CLIENTE.SESION(FECHA_INICIO)
TABLESPACE TBS_INDEX;

CREATE INDEX USER_CLIENTE.SESION_FECHA_FIN_IX ON USER_CLIENTE.SESION(FECHA_FIN)
TABLESPACE TBS_INDEX;

CREATE UNIQUE INDEX USER_EMPLEADO.ADMINISTRATIVO_LOGIN_UK ON USER_EMPLEADO.ADMINISTRATIVO(LOGIN)
TABLESPACE TBS_INDEX;

CREATE UNIQUE INDEX USER_EMPLEADO.EMPLEADO_CURP_UK ON USER_EMPLEADO.EMPLEADO(CURP)
TABLESPACE TBS_INDEX;

CREATE UNIQUE INDEX USER_EMPLEADO.EMPLEADO_RFC_UK ON USER_EMPLEADO.EMPLEADO(RFC)
TABLESPACE TBS_INDEX;

CREATE UNIQUE INDEX USER_EMPLEADO.EMPLEADO_EMAIL_UK ON USER_EMPLEADO.EMPLEADO(EMAIL)
TABLESPACE TBS_INDEX;

CREATE UNIQUE INDEX USER_EMPLEADO.PUESTO_CLAVE_UK ON USER_EMPLEADO.PUESTO(CLAVE)
TABLESPACE TBS_INDEX;
