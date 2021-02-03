# 🗃Proyecto Final BDA: Virtual Gym 🏋️‍♂️

Integrantes: 

- Jorge Cárdenas Cárdenas
- Samuel Arturo Garrido Sánchez

#### Reglas de negocio.


Blablabla


### Modelo lógico

![](Modelo/modelo_logico.jpg)

### Tablespaces 

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
| Cliente | Agrupa todos los objetos asocie | user_cliente |


### Choro consciente

Considerando que tenemos la cantidad de 1500 personas por los mil gimnasios, damos un promedio con base a la estadística de movimiento urbano que un promedio de 40 personas en aforo promedio, que cuenten con sensor, estarán yendo 2 horas diarias. Esto, multiplicado por los 1000 gimnasios nos da una cantidad de 4,800,000 registros en la bitácora que se realizarán. Si esto lo multiplicamos por el tamaño de una tupla que es de 23 bytes, y convirtiéndolo a MB, tendremos que diariamente tendremos la siguiente cantidad de datos:

40\*(1000\*23\*120)/(1024**2) = 105.285 Mb (diarios)

Considerando que el horario del gimnasio sea de 10am a 10 pm, tendremos que finalmente tendremos una consulta de 55-56 por segundo.

40000/(12*60) = 55.5 datos por min aprox.


(23\*1500\*60)/1024*\*2\*120


Para la consultas, serán de 40,000 consultas diarias de reportes de bitácoras, con 

En el caso de 
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIyOTAzMzY5MV19
-->