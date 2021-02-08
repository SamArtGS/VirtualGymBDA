select table_name,
to_number(
extractvalue(
xmltype(dbms_xmlgen.getxml('
  select count(*) c from '||table_name)),
'/ROWSET/ROW/C')) cnt
from all_tables
where owner = 'USER_INFRAESTRUCTURA';


select
sum(to_number(
extractvalue(
xmltype(dbms_xmlgen.getxml('
  select count(*) c from '||table_name)),
'/ROWSET/ROW/C'))) cnt
from all_tables
where owner = 'USER_INFRAESTRUCTURA';


select table_name,
to_number(
extractvalue(
xmltype(dbms_xmlgen.getxml('
  select count(*) c from '||table_name)),
'/ROWSET/ROW/C')) cnt
from all_tables
where owner = 'USER_EMPLEADO';

select
sum(to_number(
extractvalue(
xmltype(dbms_xmlgen.getxml('
  select count(*) c from '||table_name)),
'/ROWSET/ROW/C'))) cnt
from all_tables
where owner = 'USER_EMPLEADO';

select table_name,
to_number(
extractvalue(
xmltype(dbms_xmlgen.getxml('
  select count(*) c from '||table_name)),
'/ROWSET/ROW/C')) cnt
from all_tables
where owner = 'USER_CLIENTE';


select
sum(to_number(
extractvalue(
xmltype(dbms_xmlgen.getxml('
  select count(*) c from '||table_name)),
'/ROWSET/ROW/C'))) cnt
from all_tables
where owner = 'USER_CLIENTE';