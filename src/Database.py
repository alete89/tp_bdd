import mysql.connector


class Database:
    __instance = None

    @staticmethod
    def getInstance():
        if Database.__instance == None:
            Database()
        return Database.__instance

    def __init__(self):
        if Database.__instance != None:
            raise Exception("Mal uso del Singleton")
        else:
            Database.__instance = self

    def startDbConnection(self):
        # Abre conexión con la base de datos
        self.db = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="password",
            database="tpseguros"
        )

    def closeDbConnection(self):
        # Cierra conexión con la base de datos
        self.db.close()

    def getAutores(self):
        mycursor = self.db.cursor()
        mycursor.execute("SELECT * FROM poliza_auto INNER JOIN poliza ON id_poliza = poliza.id;")
        return mycursor.fetchall()

    def getEstadisticasComision(self, desde = '2018-11-01', hasta = '2018-12-01'):
        mycursor = self.db.cursor()
        mycursor.execute("""
            SELECT
                legajo, apellido, nombre,
                COALESCE(activos, 0) activos,
                COALESCE(comisionActivo, 0) activos_comision,
                COALESCE(iniciados, 0) iniciados,
                COALESCE(comisionInicio, 0) iniciados_comision,
                COALESCE(vencen, 0) vencen,
                COALESCE(comisionVence, 0) vencen_comision
            FROM productor
            LEFT JOIN
                (SELECT Productor_legajo, COUNT(*) activos, SUM(prima) comisionActivo
                FROM poliza
                WHERE inicio < '{desde}' AND fin >= '{desde}'
                GROUP BY Productor_legajo) PolizaActiva
                ON legajo = PolizaActiva.Productor_legajo
            LEFT JOIN
                (SELECT Productor_legajo, COUNT(*) iniciados, SUM(prima) comisionInicio
                FROM poliza
                WHERE inicio >= '{desde}' AND inicio <= '{hasta}'
                GROUP BY Productor_legajo) PolizaInicia ON legajo = PolizaInicia.Productor_legajo
            LEFT JOIN
                (SELECT Productor_legajo, COUNT(*) vencen, SUM(prima) comisionVence
                FROM poliza
                WHERE fin >= '{desde}' AND fin <= '{hasta}'
                GROUP BY Productor_legajo) PolizaVence ON legajo = PolizaVence.Productor_legajo
            ORDER BY vencen_comision DESC;
        """)
        return mycursor
