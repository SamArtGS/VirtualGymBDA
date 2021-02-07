import random

f = open("../ScriptsBDA/s-09-carga-inicial-sala_disciplinas.sql", "w")
for i in range(1, 4001): # Núm de Salas
  for j in range(random.randint(1, 10)):
    f.write(
      "insert into user_infraestructura.sala_disciplina(sala_disciplina, sala_id, disciplina_id) values("
      + "user_infraestructura.seq_sala_disciplina.nextval, "
      + str(i) +", "
      + str(random.randint(1,50)) + ");\n" # Núm de disciplinas
    )
f.close()