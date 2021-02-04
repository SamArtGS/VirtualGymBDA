# 🗃Proyecto Final BDA: Virtual Gym 🏋️‍♂️

Integrantes: 

- Jorge Cárdenas Cárdenas
- Samuel Arturo Garrido Sánchez

#### Reglas de negocio.

Virtual Gym es una empresa que cuenta con diversos Gimnasios distribuidos en todo el País. Adicional a los servicios que ofrece en cada un o de sus gimnasios, la empresa ha decidido modernizarse a través del un proyecto que permite a sus clientes tomar clases en línea o a distancia, o inclusive en diferentes gimnasios a los que habitualmente acuden. Se registran los siguientes datos de cada gimnasio: folio de 5 caracteres, nombre, dirección, ubicación (latitud y longitud), teléfono principal, página web. Cada Gimnasio cuenta con una serie de contenido multimedia que se emplea para mantener actualizado el sitio web. Este contenido se guarda en la BD: imágenes y videos. A cada archivo se le asigna una vigencia. Posteriormente, el archivo ya no se emplea en el sitio web. Se desea mantener todo este material, aunque ya esté fuera de línea.

Los empleados de Virtual Gym cuentan con un registro único: nombre, apellidos, CURP, número de trabajador, RFC, fecha de nacimiento y puesto el cual proviene de un catálogo (nombre, clave y descripción), email, foto y sus 10 huellas dactilares. Estos datos se emplean entre otras cosas para configurar los accesos en los gimnasios empleando las huellas dactilares. Existe una clasificación de empleados en 2 grupos: Administrativos e Instructores. Para los administradores se almacena login, password, rol de administrador y un archivo binario con extensión .cer (certificado digital) el cual se emplea para acceder al sitio web de adiminstración. Para los instructores se almacena cédula profesional que lo habilita como instructor calificado, años de experiencia, instructor suplente. Cada instructor puede registrar URLs que pueden ser consultadas públicamente para revisar su trayectoria.

Cada gimnasio está formado por un conjunto de salas. Para cada sala se guarda su clave de 3 caracteres, su nombre, capacidad máxima (número de personas), y una lista de las disciplinas que pueden practicarse en dicha sala. Se cuenta con un catálogo de disciplinas: (clave, nombre, descripción, ícono que descrine la disciplina empleada como logotipo en documentos, y en el sitio web). Cada sala cuenta con un administrador (empleado). Cada gimnasio cuenta con un gerente.

En cada sala se encuentra una serie de aparatos o dispositivos para realizar rutinas. Se cuenta con un inventario en el que se registra: número de inventario (cadena de 18 caracteres), tipo de dispositivo (se cuenta con catálogo), nombre del dispositivo, fecha de adquisición, y descripción. Para cada dispositivo se han definido una serie de status para administrar su ciclo de vida: vigente, obsoleto, averiado, en reparación, fuera de uso. Se requiere guardar estos estados y su correspondiente historial.

Para el caso de los clientes se cuenta con el siguiente registro: nombre, apellidos, email, username, password, dirección (sin desglosar), fecha de nacimiento, CURP, foto. Con este registro el cliente puede acudir al gimnasio de su preferencia. Se le genera una credencial cuyos datos son: folio de 8 caracteres, vigencia, código de barras empleado para acceder a las salas.

Virtual Gym ofrece a sus clientes la posibilidad de adquirir un sensor que permite medir la cantidad de calorías aproximada que se consumen durante cada una de las sesiones del cliente. Se cuenta con una bitácora por en la que cada minuto se registra el valor de las calorías que el cliente logra liberar en dicho intervalo. Para cada sesión se guardan los siguientes datos: Número de sesión (folio consecutivo por cliente), fecha de inicio, duración de la sesión, instructor responsable, dispositivo(s) empleado(s) durante la sesión. Virtual Gym permite que los clientes puedan tener sesiones remotas con sus instructores, por ejemplo, el cliente puede realizar una rutina de 30 min en su casa. El sensor reporta los datos de sus calorías sin importar el lugar donde se encuentre. En base de datos se almacena la sala en la que se realiza la sesión o en su defecto se indica el valor “En línea” para los casos en el que el cliente realiza su rutina en casa. Para cada sensor se almacena su número de serie, fecha de compra y marca.

Finalmente, el cliente puede consultar el sitio web el avance y el resumen de sus sesiones, por ejemplo, el sistema puede mostrarle gráficas en donde se muestra el historial de pérdida de calorías. Para generar reportes más completos, el cliente puede capturar periódicamente los datos de su peso y masa corporal y de ser necesario su estatura.

#### Requerimientos no funcionales
- Se tiene un aproximado de 1000 gimnasios distribuidas a lo largo del país.
- Se requiere almacenar todas las mediciones de calorías que el cliente genera a lo largo de su estancia en los gimnasios de Virtual Gym
- Se requiere almacenar toda la historia del material multimedia que tiene Virtual Gym para actualizar sus sitios web.
- Se requiere capacidad para realizar consultas estadísticas para poder mostrar el avance o progreso de un cliente.
- Cada gimnasio ha reportado hasta 1500 usuarios registrados durante un año, existen clientes que realizan hasta 5 rutinas por semana con una duración de hasta 2 hrs.


### Modelo lógico

![](Modelo/modelo_logico.jpg)

### Usuarios

### Tabla de Scripts

| Num. Script | Nombre del Script | Descripción |
|:-----------:|:-----------------:|:-----------:|
| 0 | [s-00-crea-directorios.sh](https://github.com/SamArtGS/VirtualGymBDA/blob/main/ScriptsBDA/s-00-crea-directorios.sh "s-00-crea-directorios.sh") | Creación de los directorios requeridos | 
| 1 |[s-01-creacion-bd.sql](https://github.com/SamArtGS/VirtualGymBDA/blob/main/ScriptsBDA/s-01-creacion-bd.sql "s-01-creacion-bd.sql")|Creación de la BD con los parámetros indicados|
| 2 | [s-02-modulos-sistema.sql](https://github.com/SamArtGS/VirtualGymBDA/blob/main/ScriptsBDA/s-02-modulos-sistema.sql "s-02-modulos-sistema.sql") | Creación de los tablespaces de cada módulo |
| 3 | [s-03-crea-usuario-y-rol.sql](https://github.com/SamArtGS/VirtualGymBDA/blob/main/ScriptsBDA/s-03-crea-usuario-y-rol.sql "s-03-crea-usuario-y-rol.sql") | Creación de los objetos |


#### Configuración inicial de la BD

| Configuración | Descripción y/o configuración |
|:-----------:|:-----------------:|:-----------:|
|Número y ubicación de archivos de control| 3 archivos de control: <ul><li>`/u01/disk1/control01.ctl`</li><li>`/u01/disk2/control02.ctl`</li> <li>`/u01/disk3/control03.ctl`</li></ul> |
| Propuesta de grupos de REDO | 3 grupos de REDO, con 3 archivos cada uno |
| Propuesta de juego de caracteres | Character set; `AL32UTF8`. National character set `AL16UTF16` |
| Tamaño del bloque de datos | 512 Bytes |
| Lista de parámetros que serán configurados al crear la base de datos.	| <ul><li>db_name: gacabda</li><li>memory_target: 4G</li><li>control_files:<br> `(/u01/disk1/control01.ctl`<br>`/u01/disk2/control02.ctl`<br>`/u01/disk3/control03.ctl)`</li></ul> |
| Archivo de passwords | <ul><li>`sys`</li><li>`sysbackup`</li></ul>


### Módulos del sistema

| Nombre del módulo | Descripción | Usuario |
|--|--|--|
| cliente | Agrupa toda la información en forma de objetos de los clientes. | user_cliente |
| infraestructura | Corresponde a todos los objetos relacionados con la infraestructura del gimnasio, como las salas, disciplinas impartidas y dispositivos para hacer ejercicios | user_infraestructura |
| empleado | Contiene la información (datos personales, biométricos, puesto y/o rol) de los empleados que trabajan en el gimnasio | user_empleado |

### Diseño lógico de la Base de Datos 
<center>

| Nombre de la tabla | Nombre del módulo  |
|--|--|
| cliente | cliente |
| credencial_cliente| cliente |
| reporte_fisico | cliente | 
| sensor | cliente |
| sesion | cliente |
| bitacora | cliente |
| gimnasio | infraestructura |
| multimedia | infraestructura |
| sala | infraestructura |
| disciplina | infraestructura |
| sala_disciplina | infraestructura |
| dispositivo | infraestructura |
| tipo_dispositivo | infraestructura |
| status_dispositivo | infraestructura |
| historico_status_dispositivo | infraestructura |
| aparato_sesion| infraestructura |
| cliente_gimnasio | infraestructura |
| empleado | empleado |
| puesto_id | empleado |
| huella_digital | empleado |
| administrador | empleado |
| instructor | empleado |
| urls | empleado |

</center>

### Esquema de Indexado
| Nombre de la tabla | Nombre del indice | Tipo | Propósito |
|--|--|--|--|
| cliente | cliente_username_uk | unique | Validar que no se repitan los nombres de usuario y optimizar las búsquedas |
| cliente | cliente_curp_uk | unique | Validar que no se repitan las curps de los usuarios |
| credencial_cliente | credencial_cliente_codigo_barras_uk | unique | Asegurar que no se repitan códigos de barras y generar consultas eficientes |
| credencial_cliente | credencial_cliente_folio_uk | unique | Generar consultas eficientes por el folio de la credencial |
| sensor| sensor_num_serie_uk | unique | Asegurar la integridad de los números de serie de los sensores |
| puesto | puesto_clave_uk | unique | Mantener la integridad entre las claves de los puestos |
| gimnasio| gimnasio_folio_uk | unique | Validar la integridad y generar consultas eficientes |
| gimnasio| gimnasio_nombre_ix | function | Generar consultas eficientes de acuerdo al nombre del gimnasio |
| empleado | empleado_curp_uk | unique | Validar la integridad y asegurar consultas eficientes |
| empleado | empleado_rfc_uk | unique | Validar la integridad y asegurar consultas eficientes |
| empleado | empleado_email_uk | unique | Validar la integridad y asegurar consultas eficientes |
| administrativo | administrativo_login_uk | unique | Validar la integridad y asegurar consultas eficientes |
| sala | sala_clave_uk | unique | Validar la integridad y asegurar consultas eficientes |
| disciplina | disciplina_clave_uk | unique | Validar la integridad y asegurar consultas eficientes |
| status_dispositivo | status_dispositivo_uk | unique | Validar la integridad y asegurar consultas eficientes |
| tipo_dispositivo | tipo_dispositivo_nombre_ix | function | Generar busquedas eficientes por nombre de dispositivos en mayusculas |
| sesion | sesion_fecha_incio_ix | index | Generar busquedas eficientes por fechas |
| sesion | sesion_fecha_fin_ix | index | Generar busquedas eficientes por fechas |
| reporte_fisico | reporte_fisico_fecha_registro_ix | index | Generar busquedas eficientes por fechas |


### Tablespaces 
| Nombre del tablespace | Configuración  |
|--|--|
| system | Tablaspace con un datafile ubicado en `/u01/app/oracle/oradata/GACABDA/disk_4/system01.dbf`, con un tamaño de `700M` , `reused`, `autoextend` con incrementos de `1M` y de tamaño máximo `unlimited`. |
| sysaux | Tablaspace con un datafile ubicado en `/u01/app/oracle/oradata/GACABDA/disk_4/sysaux01.dbf`, con un tamaño de `550M` , `reused`, `autoextend` con incrementos de `1M` y de tamaño máximo `unlimited`. |
| user01 | Tablaspace con un datafile ubicado en `/u01/app/oracle/oradata/GACABDA/disk_4/sysaux01.dbf`, con un tamaño de `500M` , `reused`, `autoextend` con un tamaño máximo `unlimited`. |
| tempts1 | Tablaspace con un datafile ubicado en `/u01/app/oracle/oradata/GACABDA/disk_4/temp01.dbf`, con un tamaño de `1G` , `reused`, `autoextend` con incrementos de `640K` y de tamaño máximo `unlimited`. |
| undotbs1| Tablaspace con un datafile ubicado en `/u01/app/oracle/oradata/GACABDA/disk_4/undotbs01.dbf`, con un tamaño de `2G` , `reused`, `autoextend` con incrementos de `512K` y de tamaño máximo `unlimited`. |
| tbs_cliente | Tablaspace con dos datafiles ubicados en `/u01/app/oracle/oradata/GACABDA/disk_6/df_cliente_01.dbf` y `/u01/app/oracle/oradata/GACABDA/disk_6/df_cliente_02.dbf`, ambos con un tamaño de `5G` , `reused`, `autoextend` con incrementos de `100M` y de tamaño máximo `unlimited`. El tablespace tiene una configuración `Extent Local Management` y `AutoAllocate`, con un manejo automatico de los segmentos. |
| tbs_infraestructura | Tablaspace con un datafile ubicado en `/u01/app/oracle/oradata/GACABDA/disk_5/df_infraestructura_01.dbf`, con un tamaño de `1G` , `reused`, `autoextend` con incrementos de `1M` y de tamaño máximo `unlimited`. El tablespace tiene una configuración `Extent Local Management` y `AutoAllocate`, con un manejo automatico de los segmentos. |
| tbs_empleado | Tablaspace con un datafile ubicado en `/u01/app/oracle/oradata/GACABDA/disk_7/df_empleado_01.dbf`, con un tamaño de `1G` , `reused`, `autoextend` con incrementos de `1M` y de tamaño máximo `unlimited`. El tablespace tiene una configuración `Extent Local Management` y `AutoAllocate`, con un manejo automatico de los segmentos. |
| tbs_index | Tablaspace con un datafile ubicado en `/u01/app/oracle/oradata/GACABDA/disk_11/df_index_01.dbf`, con un tamaño de `500M` , `reused`, `autoextend` con incrementos de `1M` y de tamaño máximo `unlimited`. El tablespace tiene una configuración `Extent Local Management` y `AutoAllocate`, con un manejo automatico de los segmentos. |
| tbs_blob | Tablaspace con dos datafiles ubicados en `/u01/app/oracle/oradata/GACABDA/disk_8/df_blob_01.dbf` y `/u01/app/oracle/oradata/GACABDA/disk_9/df_blob_02.dbf`, ambos con un tamaño de `1G` , `reused`, `autoextend` con incrementos de `1M` y de tamaño máximo `unlimited`. El tablespace tiene una configuración `Extent Local Management` y `AutoAllocate`, con un manejo automatico de los segmentos. |
| tbs_blob_index | Tablaspace con un datafile ubicado en `/u01/app/oracle/oradata/GACABDA/disk_10/df_blob_index_01.dbf`, con un tamaño de `500M` , `reused`, `autoextend` con incrementos de `1M` y de tamaño máximo `unlimited`. El tablespace tiene una configuración `Extent Local Management` y `AutoAllocate`, con un manejo automatico de los segmentos. |

### Tablespaces por módulo
| Nombre del tablespace | Objetivo/Beneficio | Tipo |
|--|--|--|
| tbs_cliente | Aislamiento de las tablas relacionadas con los clientes. En caso de una falla de medios, el resto de aplicaciones (tablespaces) siguen funcionando | Usuario |
| tbs_ infraestructura | Aislamiento de las tablas relacionadas con la insfraestructura del gimnasio, como salas, disciplinas y dispositivos. En caso de una falla de medios, el resto de aplicaciones (tablespaces) siguen funcionando | Usuario |
| tbs_empleado | Aislamiento de las tablas relacionadas con los empleados. En caso de una falla de medios, el resto de aplicaciones (tablespaces) siguen funcionando | Usuario |
| tbs_ index | Mantener los indices separados de las tablas y demás objetos | Usuario |
| tbs_blob | Almacenar los datos segmentos de los datos blob, con la finalidad de reducir la carga a los tablespace de los objetos | Usuario |
| tbs_blob_index | Almancenar los segmentos de los indices de los datos blob | Usuario |

### Asignación de tablespaces para tablas

| Nombre de la tabla | Nombre del tablespace |
|--|--|
| cliente | tbs_cliente |
| credencial_cliente| tbs_cliente |
| reporte_fisico | tbs_cliente | 
| sensor | tbs_cliente |
| sesion | tbs_cliente |
| bitacora | tbs_cliente |
| gimnasio | tbs_infraestructura |
| multimedia | tbs_infraestructura |
| sala | tbs_infraestructura |
| disciplina | tbs_infraestructura |
| sala_disciplina | tbs_infraestructura |
| dispositivo | tbs_infraestructura |
| tipo_dispositivo | tbs_infraestructura |
| status_dispositivo | tbs_infraestructura |
| historico_status_dispositivo | tbs_infraestructura |
| aparato_sesion| tbs_infraestructura |
| cliente_gimnasio | tbs_infraestructura |
| empleado | tbs_empleado |
| puesto_id | tbs_empleado |
| huella_digital | tbs_empleado |
| administrador | tbs_empleado |
| instructor | tbs_empleado |
| urls | tbs_empleado |

### Asignación de tablespaces para índices
| Nombre del índice | Tipo de índice | Nombre de la Tabla | Nombre de la columna | Nombre del tablespace |
|--|--|--|--|--|
| cliente_username_uk | unique | cliente | username | tbs_index |
| cliente_curp_uk | unique | cliente | curp | tbs_index |
| credencial_cliente_codigo_barras_uk | unique | credencial_cliente |codigo_barras | tbs_index |
| credencial_cliente_folio_uk | unique |credencial_cliente | folio | tbs_index |
| sensor_num_serie_uk | unique | sensor | num_serie | tbs_index |
| puesto_clave_uk | unique | puesto | clave | tbs_index |
| gimnasio_folio_uk | unique | gimnasio | folio | tbs_index |
| gimnasio_nombre_ix | function | gimnasio | nombre | tbs_index |
| empleado_curp_uk | unique | empleado | curp | tbs_index |
| empleado_rfc_uk | unique | empleado | rfc | tbs_index |
| empleado_email_uk | unique | empleado | email | tbs_index |
| administrativo_login_uk | unique | administrativo | login | tbs_index |
| sala_clave_uk | unique | sala | clave | tbs_index |
| disciplina_clave_uk | unique | disciplina | clave | tbs_index |
| status_dispositivo_clave_uk | unique | status_dispositivo | clave | tbs_index |
| tipo_dispositivo_nombre_ix | function | tipo_dispositivo | nombre | tbs_index |
| sesion_fecha_incio_ix | index | sesion | fecha_inicio | tbs_index |
| sesion_fecha_fin_ix | index | sesion | fecha_fin | tbs_index |
| reporte_fisico_fecha_registro_ix | index | reporte_fisico | fecha_registro | tbs_index |

### Asignación de tablespaces para columnas clob/blob
| Nombre de la columna | Nombre del índice asociado a la columna | Nombre de la Tabla | Nombre del tablespace para la columna | Nombre del tablespace para el índice de la columna |
|--|--|--|--|--|
| imagen_barras | credecial_cliente_imagen_barras_bix | credencial_cliente | tbs_blob | tbs_blob_index |
| foto | cliente_foto_bix | cliente | tbs_blob | tbs_blob_index |
| foto | empleado_foto_bix | empleado | tbs_blob | tbs_blob_index |
| certificado_digital | cliente_certificado_digital_bix | administrativo | tbs_blob | tbs_blob_index |
| pulgar_derecho | huella_digital_pulgar_derecho_bix | huella_digital | tbs_blob | tbs_blob_index |
| indice_derecho | huella_digital_indice_derecho_bix | huella_digital | tbs_blob | tbs_blob_index |
| medio_derecho | huella_digital_medio_derecho_bix | huella_digital | tbs_blob | tbs_blob_index |
| anular_derecho | huella_digital_anular_derecho_bix | huella_digital | tbs_blob | tbs_blob_index |
| menique_derecho | huella_digital_menique_derecho_bix | huella_digital | tbs_blob | tbs_blob_index |
| pulgar_izquierdo | huella_digital_pulgar_izquierdo_bix | huella_digital | tbs_blob | tbs_blob_index |
| indice_izquierdo | huella_digital_indice_izquierdo_bix | huella_digital | tbs_blob | tbs_blob_index |
| medio_izquierdo | huella_digital_medio_izquierdo_bix | huella_digital | tbs_blob | tbs_blob_index |
| anular_izquierdo | huella_digital_anular_izquierdo_bix | huella_digital | tbs_blob | tbs_blob_index |
| menique_izquierdo | huella_digital_menique_izquierdo_bix | huella_digital | tbs_blob | tbs_blob_index |
| archivo | multimedia_archivo_bix | multimedia | tbs_blob | tbs_blob_index |
| icono | disciplina_icono_bix | disciplina | tbs_blob | tbs_blob_index |

### Choro consciente

Considerando que tenemos la cantidad de 1500 personas por los mil gimnasios, damos un promedio con base a la estadística de movimiento urbano que un promedio de 40 personas en aforo promedio, que cuenten con sensor, estarán yendo 2 horas diarias. Esto, multiplicado por los 1000 gimnasios nos da una cantidad de 4,800,000 registros en la bitácora que se realizarán. Si esto lo multiplicamos por el tamaño de una tupla que es de 23 bytes, y convirtiéndolo a MB, tendremos que diariamente tendremos la siguiente cantidad de datos:

40\*(1000\*23\*120)/(1024**2) = 105.285 Mb (diarios)

Considerando que el horario del gimnasio sea de 10am a 10 pm, tendremos que finalmente tendremos una consulta de 55-56 por segundo.

40000/(12*60) = 55.5 datos por min aprox.


(23\*1500\*60)/1024*\*2\*120


Para la consultas, serán de 40,000 consultas diarias de reportes de bitácoras, con 

En el caso de 
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTk0OTEyNTA3NCw4Mjk5MDQ3MDhdfQ==
-->