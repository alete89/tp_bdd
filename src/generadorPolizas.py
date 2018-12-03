
import random
import datetime
from datetime import timedelta 

dnis = ['30123321', '11111111', '22222222', '33333333']
for num in range(1, 200):
    fechaIniciod = datetime.date.today() + timedelta(days=random.randint(-395,40))
    fechaFind = fechaIniciod + timedelta(days=365)
    fechaInicio = fechaIniciod.strftime("%Y-%m-%d")
    fechaFin = fechaFind.strftime("%Y-%m-%d")
    print(f"INSERT INTO `poliza` VALUES ('{num}', '1', '{random.randint(1,10)}', '{random.choice(dnis)}', '{random.randint(100,10000)}', '{fechaInicio}', '{fechaFin}', '{random.randint(10,70)}');")
