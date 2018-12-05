
import random
import datetime
from datetime import timedelta 

dnis = ['30123321', '11111111', '22222222', '33333333']
tipos = ['auto', 'vida', 'hogar']
aniomodelo = [0,2010,2011,2013,2012,2011,2018,2017,2015,2016]
def generarPolizas():
    for num in range(1, 200):
        fechaIniciod = datetime.date.today() + timedelta(days=random.randint(-395,40))
        fechaFind = fechaIniciod + timedelta(days=365)
        fechaInicio = fechaIniciod.strftime("%Y-%m-%d")
        fechaFin = fechaFind.strftime("%Y-%m-%d")
        print(f"INSERT INTO `Poliza` VALUES ('{num}', '1', '{random.randint(1,10)}', '{random.choice(dnis)}', '{random.randint(100,10000)}', '{fechaInicio}', '{fechaFin}', '{random.randint(10,70)}');")

def generarTiposPolizas():
    ultimoAutoId = 6
    ultimoContinenteId = 0
    for num in range(1, 300):
        fechaIniciod = datetime.date.today() + timedelta(days=random.randint(-395,40))
        fechaFind = fechaIniciod + timedelta(days=365)
        fechaInicio = fechaIniciod.strftime("%Y-%m-%d")
        fechaFin = fechaFind.strftime("%Y-%m-%d")
        tipo = random.choice(tipos)
        if tipo == 'auto':
            ciudad = random.randint(1,5)
            modelo = random.randint(1,9)
            ultimoAutoId += 1
            print(f"INSERT INTO `Auto` VALUES ('{ultimoAutoId}', '{ciudad}', '{modelo}', '{aniomodelo[modelo]}');")
            grupo = random.randint(1,3)
            franquicia = random.randint(0,50000)

            print(f"INSERT INTO `Poliza` VALUES (NULL, '1', '{random.randint(1,10)}', '{random.choice(dnis)}', '{random.randint(100,10000)}', '{fechaInicio}', '{fechaFin}', '{random.randint(10,70)}');")
            print(f"INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '{ultimoAutoId}', '{grupo}', '{franquicia}');")
        elif tipo == 'vida':
            profesion = random.randint(1,7)
            monto = random.randint(10000,100000)
            print(f"INSERT INTO `Poliza` VALUES (NULL, '1', '{random.randint(1,10)}', '{random.choice(dnis)}', '{random.randint(100,10000)}', '{fechaInicio}', '{fechaFin}', '{random.randint(10,70)}');")
            print(f"INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '{profesion}', '{random.choice(dnis)}', '{monto}');")
        elif tipo == 'hogar':
            tipocontinente = random.randint(1,5)
            ultimoContinenteId += 1
            print(f"INSERT INTO `Continente` VALUES ('{ultimoContinenteId}', '{tipocontinente}', 'dir {ultimoContinenteId}', 'desc {ultimoContinenteId}');")
            monto = random.randint(10000,100000)
            print(f"INSERT INTO `Poliza` VALUES (NULL, '1', '{random.randint(1,10)}', '{random.choice(dnis)}', '{random.randint(100,10000)}', '{fechaInicio}', '{fechaFin}', '{random.randint(10,70)}');")
            print(f"INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '{ultimoContinenteId}', '{monto}');")

generarTiposPolizas()