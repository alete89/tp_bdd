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
        return mycursor

    def getProductoresList(self):
        mycursor = self.db.cursor()
        mycursor.execute(
            "SELECT apellido, nombre FROM Productor;")
        return mycursor

    def getPersonasList(self):
        mycursor = self.db.cursor()
        mycursor.execute(
            "SELECT apellido, nombre FROM Persona;")
        return mycursor

    def getAutosList(self):
        mycursor = self.db.cursor()
        mycursor.execute(
            "select aut.id, model.nombre from tpSeguros.Auto as aut inner join tpSeguros.Modelo as model on aut.id = model.id ;")
        print(mycursor.statement)
        return mycursor

    def getGruposRiesgoList(self):
        mycursor = self.db.cursor()
        mycursor.execute(
            "SELECT descripcion FROM Grupo_Riesgo;")
        return mycursor

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
        return mycursor

    def insercionPolizaAuto(self, poliza: PolizaAuto):
        mycursor = self.db.cursor()

        mycursor.execute(f"""
            INSERT INTO `Poliza` VALUES (NULL, '1', '{poliza.productorLegajo}', '{poliza.clienteDni}', '{poliza.prima}',
                '{poliza.fechaInicio}', '{poliza.fechaFin}', '{poliza.porcentajeProductor}');
            INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '{poliza.autoId}', '{poliza.grupoRiesgoId}',
                '{poliza.franquicia}');
        """)
        print(mycursor.statement)

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
