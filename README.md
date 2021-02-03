# 🗃Proyecto Final BDA: Virtual Gym 🏋️‍♂️

Integrantes: 

- Jorge Cárdenas Cárdenas
- Samuel Arturo Garrido Sánchez

#### Reglas de negocio.


Blablabla


### Modelo lógico

![](Modelo/modelo_logico.jpg)

### Usuarios

### Tabla de Scripts

| Num. Script | Nombre del Script | Descripción |
|:-----------:|:-----------------:|:-----------:|
|1|s-01-creacion-bd.sql|Creación de la BD con los parámetros indicados|


#### Configuración inicial de la BD

| Configuración | Descripción y/o configuración |
|:-----------:|:-----------------:|:-----------:|
|Número y ubicación de archivos de control|  |

### Módulos del sistema

| Nombre del módulo | Descripción | Usuario |
|--|--|--|
| CLIENTE | Agrupa toda la información en forma de objetos de los clientes. | user_cliente |
| INFRAESTRUCTURA | Corresponde a todos los objetos relacionados con la infraestructura del gimnasio, como las salas, disciplinas impartidas y dispositivos para hacer ejercicios | user_infraestructura |
| EMPLEADO| Contiene la información (datos personales, biométricos, puesto y/o rol) de los empleados que trabajan en el gimnasio | user_empleado |

### Diseño lógico de la Base de Datos 
<center>

| Nombre de la tabla | Nombre del módulo  |
|--|--|
| CLIENTE | CLIENTE |
| CREDENCIAL_CLIENTE | CLIENTE |
| REPORTE_FISICO | CLIENTE | 
| SENSOR | CLIENTE |
| SESION | CLIENTE|
| BITACORA | CLIENTE |
| GIMNASIO | INFRAESTRUCTURA |
| MULTIMEDIA | INFRAESTRUCTURA |
| SALA | INFRAESTRUCTURA |
| DISCIPLINA | INFRAESTRUCTURA |
| SALA_DISCIPLINA | INFRAESTRUCTURA |
| DISPOSITIVO | INFRAESTRUCTURA |
| TIPO_DISPOSITIVO | INFRAESTRUCTURA |
| STATUS_DISPOSITIVO | INFRAESTRUCTURA |
| HISTORICO_STATUS_DISPOSTIVO | INFRAESTRUCTURA |
| APARATO_SESION | INFRAESTRUCTURA |
| CLIENTE_GIMNASIO | INFRAESTRUCTURA |
| EMPLEADO | EMPLEADO |
| PUESTO_ID | EMPLEADO |
| HUELLA_DIGITAL | EMPLEADO |
| ADMINISTRADOR | EMPLEADO |
| INSTRUCTOR | EMPLEADO |
| URLS | EMPLEADO |

</center>

### Esquema de Indexado
| Nombre de la tabla | Nombre del indice | Tipo | Propósito |
|--|--|--|--|
| cliente | cliente_username_uk | unique | Validar que no se repitan los nombres de usuario y optimizar las búsquedas |
| cliente | cliente_curp_uk | unique | Validar que no se repitan las curps de los usuarios |
| credencial_cliente | credencial_cliente_codigo_barras_uk | unique | Asegurar que no se repitan códigos de barras y generar consultas eficientes |
| sensor| sensor_num_serie_uk | unique | Asegurar la integridad de los números de serie de los sensores |
| puesto | puesto_clave_uk | unique | Mantener la integridad entre las claves de los puestos |
| gimnasio| gimnasio_folio_uk | unique | Validar la integridad y generar consultas eficientes |
| empleado | empleado_curp_uk | unique | Validar la integridad y asegurar consultas eficientes |
| empleado | empleado_rfc_uk | unique | Validar la integridad y asegurar consultas eficientes |
| empleado | empleado_email_uk | unique | Validar la integridad y asegurar consultas eficientes |
| administrativo | administrativo_login_uk | unique | Validar la integridad y asegurar consultas eficientes |
| sala | sala_clave_uk | unique | Validar la integridad y asegurar consultas eficientes |
| disciplina | disciplina_clave_uk | unique | Validar la integridad y asegurar consultas eficientes |
| status_dispositivo | status_dispositivo_uk | unique | Validar la integridad y asegurar consultas eficientes |

### Tablespaces 
| Nombre del tablespace | Configuración  |
|--|--|
| tbs_cliente | Tablaspace con un solo datafile ubicado en `/disco/disco01/cliente/datafile.dbf` con un tamaño de `1024M` `autoextend` con incrementos de `100M` y de tamaño máximo `unlimited`. `Local Managed` y `AutoAllocate Extents` |
| tbs_infraestructura | Tablaspace con un solo datafile ubicado en `/disco/disco01/cliente/datafile.dbf` con un tamaño de `1024M` `autoextend` con incrementos de `100M` y de tamaño máximo `unlimited`. `Local Managed` y `AutoAllocate Extents` |
| tbs_empleado | Tablaspace con un solo datafile ubicado en `/disco/disco01/cliente/datafile.dbf` con un tamaño de `1024M` `autoextend` con incrementos de `100M` y de tamaño máximo `unlimited`. `Local Managed` y `AutoAllocate Extents` |
| tbs_blob | Tablaspace con un solo datafile ubicado en `/disco/disco01/cliente/datafile.dbf` con un tamaño de `1024M` `autoextend` con incrementos de `100M` y de tamaño máximo `unlimited`. `Local Managed` y `AutoAllocate Extents` |

### Tablespaces por módulo
| Nombre del módulo | Objetivo/Beneficio | Tipo |
|--|--|--|
| ? | ? | ? |

### Asignación de tablespaces para tablas

| Nombre de la tabla | Nombre del módulo  |
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
|  |  |


### Asignación de tablespaces para columnas clob/blob
| Nombre de la columna | Nombre del índice asociado a la columna | Nombre de la Tabla | Nombre del tablespace para la columna | Nombre del tablespace para el índice de la columna |
|--|--|--|--|--|
| imagen_barras | credecial_cliente_imagen_barras_bix | credencial_cliente | tbs_blob | |
| foto | cliente_foto_bix | cliente | tbs_cliente | |
| foto | empleado_foto_bix | empleado | tbs_cliente | |
| certificado_digital | cliente_certificado_digital_bix | administrativo | tbs_cliente | |
| pulgar_derecho | huella_digital_pulgar_derecho_bix | huella_digital | tbs_cliente | |
| pulgar_derecho | huella_digital_pulgar_derecho_bix | huella_digital | tbs_cliente | |
| indice_derecho | huella_digital_indice_derecho_bix | huella_digital | tbs_cliente | |
| medio_derecho | huella_digital_medio_derecho_bix | huella_digital | tbs_cliente | |
| anular_derecho | huella_digital_anular_derecho_bix | huella_digital | tbs_cliente | |
| menique_derecho | huella_digital_menique_derecho_bix | huella_digital | tbs_cliente | |
| pulgar_izquierdo | huella_digital_pulgar_derecho_bix | huella_digital | tbs_cliente | |
| pulgar_derecho | huella_digital_pulgar_derecho_bix | huella_digital | tbs_cliente | |
| indice_derecho | huella_digital_indice_derecho_bix | huella_digital | tbs_cliente | |
| medio_derecho | huella_digital_medio_derecho_bix | huella_digital | tbs_cliente | |
| anular_derecho | huella_digital_anular_derecho_bix | huella_digital | tbs_cliente | |
| menique_derecho | huella_digital_menique_derecho_bix | huella_digital | tbs_cliente | |
| archivo | multimedia_archivo_bix | multimedia | tbs_blob | |
| icono | disciplina_icono_bix | disciplina | tbs_cliente | |

### Choro consciente

Considerando que tenemos la cantidad de 1500 personas por los mil gimnasios, damos un promedio con base a la estadística de movimiento urbano que un promedio de 40 personas en aforo promedio, que cuenten con sensor, estarán yendo 2 horas diarias. Esto, multiplicado por los 1000 gimnasios nos da una cantidad de 4,800,000 registros en la bitácora que se realizarán. Si esto lo multiplicamos por el tamaño de una tupla que es de 23 bytes, y convirtiéndolo a MB, tendremos que diariamente tendremos la siguiente cantidad de datos:

40\*(1000\*23\*120)/(1024**2) = 105.285 Mb (diarios)

Considerando que el horario del gimnasio sea de 10am a 10 pm, tendremos que finalmente tendremos una consulta de 55-56 por segundo.

40000/(12*60) = 55.5 datos por min aprox.


(23\*1500\*60)/1024*\*2\*120


Para la consultas, serán de 40,000 consultas diarias de reportes de bitácoras, con 

En el caso de 
<!--stackedit_data:
eyJoaXN0b3J5IjpbMzA4NDg3NTE3XX0=
-->