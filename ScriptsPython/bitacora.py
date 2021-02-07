import random
from datetime import date
from datetime import datetime
from datetime import timedelta


fecha_actual = datetime(2020, 2, 15, 8, 00, 00, 00000)
sql_ini = "insert into user_cliente.bitacora (bitacora_id, calorias_consumidas, fecha_hora_registro, sesion_id) values("
sql_fin = ");\n" 

n_cliente = 1

lista_sesiones = []
lista_sensores = []
lista_sesion_dispositivo = []
lista_clientes = {}
count = 1

def random_date(start, end):
  """Generate a random datetime between `start` and `end`"""
  return start + timedelta(
    # Get a random amount of seconds between `start` and `end`
    seconds=random.randint(0, int((end - start).total_seconds())),
  )

class Cliente():
  def __init__(self):
    self.num_sesion = 1

class Sensor():
  def __init__(self):
    global n_cliente
    valores = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    self.num_serie = "".join([random.choice(valores) for i in range(20)])
    self.fecha_compra = random_date(datetime(2019, 2, 15, 8, 00, 00, 00000), datetime(2020, 12, 31, 8, 00, 00, 00000))
    rand = random.randint(1,3)
    if rand == 1: self.marca = "Polar H9"
    elif rand == 2: self.marca = "Deporprive"
    else: self.marca = "Garmin"
    n_cliente += random.randint(1, 5)
    self.cliente_id = n_cliente

class Sesion():
  def __init__(self, fecha_inicio):
    global lista_clientes
    self.fecha_inicio = fecha_inicio
    self.fecha_fin = fecha_inicio + timedelta(hours=2)
    if random.randint(1,4) == 1: 
      self.tipo_sesion = 'V'
      self.sala_id = 'null'
    else: 
      self.tipo_sesion = 'P'
      self.sala_id = str(random.randint(1,4000))
      lista_sesion_dispositivo.append(count)
    cliente = random.randint(1, 100000)
    if lista_clientes.get(cliente) != None: 
      lista_clientes[cliente].num_sesion += 1
    else:
      lista_clientes[cliente] = Cliente()
    self.cliente_id = cliente
    self.empleado_id = random.randint(3000, 15000)
    if random.randint(1,3) == 1: self.sensor_id = str(random.randint(1, 30000)) # Número de sensores:
    else: self.sensor_id = 'null'



class Bitacora():
  def __init__(self, sesion_id, fecha_inicio, fecha_fin, sensor_id):
    self.sesion_id = sesion_id
    self.fecha_inicio = fecha_inicio
    self.fecha_fin = fecha_fin
    self.sensor_id = sensor_id

def actualizarTiempo():
  global fecha_actual
  fecha_actual += timedelta(minutes=1)

def actualizarTiempoSesion():
  global fecha_actual
  fecha_actual += timedelta(hours=random.randint(0,2), minutes=random.randint(1,60))


def revisarFechas():
  global fecha_actual
  global lista_sesiones
  for sesion in lista_sesiones:
    if (fecha_actual > sesion.fecha_fin):
      lista_sesiones.remove(sesion)

f1 = open("bitacora.sql", "w")

def generarSesionesDispositivo():
  f2 = open("dispositivo-sesion.sql", "w")
  for sesion_id in lista_sesion_dispositivo:
    for i in range(random.randint(1,5)):
      f2.write(
        "insert into user_infraestructura.dispositivo_sesion(dispositivo_sesion_id, dispositivo_id, sesion_id)"
        + "values (user_infraestructura.seq_dispositivo_sesion.nextval, " + str(random.randint(1, 30000)) + ", "
        + str(sesion_id) + ");\n"
      )
  f2.close()

def generarSensores():
  f2 = open("sensor.sql", "w")
  for i in range(30000): # Número de sensores
    sensor = Sensor()
    f2.write(
      "insert into user_cliente.sensor(sensor_id, num_serie, fecha_compra, marca, cliente_id)"
      + "values (user_cliente.seq_sensor.nextval, '" + sensor.num_serie + "', "
      + "'" + sensor.fecha_compra.strftime('%d/%m/%Y %H:%M:%S') + "', "
      + "'" + sensor.marca + "', "
      + str(sensor.cliente_id) + ");\n"
    )
    lista_sensores.append(sensor)
  f2.close()

def generarSesiones():
  global fecha_actual
  global lista_sesiones
  global count
  fecha_actual = datetime(2020, 1, 1, 8, 00, 00, 00000)
  f2 = open("sesion.sql", "w")
  for i in range(5): # Número de registros en la tabla sesión
    sesion = Sesion(fecha_actual)
    actualizarTiempoSesion()
    f2.write(
      "insert into user_cliente.sesion(sesion_id, num_sesion_cliente, fecha_inicio, fecha_fin"
      + ", tipo_sesion, cliente_id, empleado_id, sala_id, sensor_id) values("
      + "user_cliente.seq_sesion.nextval, "
      + "" + str(lista_clientes[sesion.cliente_id].num_sesion) + ", "
      + "'" + sesion.fecha_inicio.strftime('%d/%m/%Y %H:%M:%S') + "', "
      + "'" + sesion.fecha_fin.strftime('%d/%m/%Y %H:%M:%S') + "', "
      + "'" + str(sesion.tipo_sesion) + "', "
      + str(sesion.cliente_id) + ", "
      + str(sesion.empleado_id) + ", "
      + str(sesion.sala_id) + ", "
      + str(sesion.sensor_id) + ");\n"
    )
    lista_sesiones.append(Bitacora(count, sesion.fecha_inicio, sesion.fecha_fin, sesion.sensor_id))
    count += 1
  f2.close()


generarSensores()
generarSesiones()
generarSesionesDispositivo()
for sesion in lista_sesiones:
  fecha_actual = sesion.fecha_inicio
  if sesion.sensor_id != "null":
    for i in range(120):
      temp = "user_cliente.seq_bitacora.nextval, " + str(random.randint(1,10)) + " ,"
      temp += "'" + fecha_actual.strftime('%d/%m/%Y %H:%M:%S') + "' ,"
      temp += str(sesion.sesion_id)
      f1.write(sql_ini + temp + sql_fin)
      fecha_actual += timedelta(minutes=1)
f1.close()