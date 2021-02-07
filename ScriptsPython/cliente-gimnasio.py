import random

f = open("../ScriptsBDA/s-09-carga-inicial-clientes-gimnasio.sql", "w")
for i in range(1, 100001): # Núm de Clientes
  rand = random.randint(1, 4)
  if rand > 1:
    f.write(
      "insert into user_infraestructura.clientes_gimnasio(cliente_gimnasio_id, gimnasio_id, cliente_id) values("
      + "user_infraestructura.seq_clientes_gimnasio.nextval, "
      + str(random.randint(1,1000)) +", "
      + str(i) + ");\n" # Núm de gimnasios
    )
  else:
    for j in range(random.randint(1, 4)):
      f.write(
      "insert into user_infraestructura.clientes_gimnasio(cliente_gimnasio_id, gimnasio_id, cliente_id) values("
      + "user_infraestructura.seq_clientes_gimnasio.nextval, "
      + str(random.randint(1,1000)) +", "
      + str(i) + ");\n" # Núm de gimnasios
      )
f.close()