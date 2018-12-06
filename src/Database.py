import mysql.connector
import PolizaAuto


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
            self.startDbConnection()

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

    def getPolizasAutoList(self, pagina=1, limite=15):
        mycursor = self.db.cursor()
        mycursor.execute(
            f"SELECT * FROM Poliza_Auto INNER JOIN Poliza ON poliza_id = Poliza.id ORDER BY poliza_id DESC LIMIT {(pagina-1)*limite},{limite};")
        return mycursor.fetchall(), mycursor.column_names, 

    def getProductoresList(self):
        mycursor = self.db.cursor()
        mycursor.execute(
            "SELECT apellido, nombre, legajo FROM Productor;")
        return mycursor.fetchall()

    def getPersonasList(self):
        mycursor = self.db.cursor()
        mycursor.execute(
            "SELECT apellido, nombre, dni FROM Persona;")
        return mycursor.fetchall()

    def getAutosList(self):
        mycursor = self.db.cursor()
        mycursor.execute(
            """
                SELECT Auto.id, Modelo.nombre, Marca.nombre FROM Auto 
                INNER JOIN Modelo 
                ON Auto.Anio_Modelo_Modelo_id = Modelo.id
                INNER JOIN Marca
                ON Modelo.Marca_id = Marca.id;
            """)
        print(mycursor.statement)
        return mycursor.fetchall()

    def getGruposRiesgoList(self):
        mycursor = self.db.cursor()
        mycursor.execute(
            "SELECT id, descripcion FROM Grupo_Riesgo;")
        return mycursor.fetchall()

    def getEstadisticasComision(self, desde='2018-11-01', hasta='2018-12-01', tipoPoliza='todas'):
        mycursor = self.db.cursor()

        # auto hogar vida
        condicionTipo = ""
        if (tipoPoliza != 'todas'):
            condicionTipo = f"""
                AND EXISTS (
                    SELECT null FROM Poliza_{tipoPoliza}
                    WHERE Poliza_{tipoPoliza}.Poliza_id = Poliza.id
                )
            """

        mycursor.execute(f"""
            SELECT
                legajo, apellido, nombre,
                COALESCE(activos, 0) activas,
                COALESCE(comisionActivo, 0) activas_comision,
                COALESCE(iniciados, 0) iniciadas,
                COALESCE(comisionInicio, 0) iniciadas_comision,
                COALESCE(vencen, 0) vencen,
                COALESCE(comisionVence, 0) vencen_comision,
                (COALESCE(comisionInicio, 0) - COALESCE(comisionVence, 0)) balance
            FROM Productor
            LEFT JOIN
                (SELECT Productor_legajo, COUNT(*) activos, SUM(prima) comisionActivo
                FROM Poliza
                WHERE estado_id = 1 AND inicio < '{desde}' AND fin >= '{desde}' {condicionTipo}
                GROUP BY Productor_legajo) PolizaActiva
                ON legajo = PolizaActiva.Productor_legajo
            LEFT JOIN
                (SELECT Productor_legajo, COUNT(*) iniciados, SUM(prima) comisionInicio
                FROM Poliza
                WHERE estado_id = 1 AND inicio >= '{desde}' AND inicio <= '{hasta}' {condicionTipo}
                GROUP BY Productor_legajo) PolizaInicia ON legajo = PolizaInicia.Productor_legajo
            LEFT JOIN
                (SELECT Productor_legajo, COUNT(*) vencen, SUM(prima) comisionVence
                FROM Poliza
                WHERE estado_id = 1 AND fin >= '{desde}' AND fin <= '{hasta}' {condicionTipo}
                GROUP BY Productor_legajo) PolizaVence ON legajo = PolizaVence.Productor_legajo
            ORDER BY balance ASC;
        """)
        print(mycursor.statement)
        return mycursor.fetchall(), mycursor.column_names

    def insercionPolizaAuto(self, poliza: PolizaAuto):
        mycursor = self.db.cursor()

        mycursor.execute(f"""
            INSERT INTO `Poliza` VALUES (NULL, '1', '{poliza.productorLegajo}', '{poliza.clienteDni}', '{poliza.prima}',
                '{poliza.fechaInicio}', '{poliza.fechaFin}', '{poliza.porcentajeProductor}');
            INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '{poliza.autoId}', '{poliza.grupoRiesgoId}',
                '{poliza.franquicia}');
        """)
        print(mycursor.statement)
        
        self.startDbConnection()

    def actualizacionPolizaAuto(self, poliza: PolizaAuto):
        mycursor = self.db.cursor()

        mycursor.execute(f"""
            UPDATE `Poliza` SET Estado_id = '{poliza.estado}', Productor_legajo = '{poliza.productorLegajo}',
                Persona_dni = '{poliza.clienteDni}', prima = '{poliza.prima}', inicio = '{poliza.fechaInicio}',
                fin = '{poliza.fechaFin}', porcentaje_productor = '{poliza.porcentajeProductor}'
            WHERE id = {poliza.id};
            UPDATE `Poliza_Auto` SET Auto_id = '{poliza.autoId}', Grupo_Riesgo_id = '{poliza.grupoRiesgoId}',
                franquicia = '{poliza.franquicia}'
            WHERE Poliza_id = {poliza.id};
        """)
        print(mycursor.statement)
