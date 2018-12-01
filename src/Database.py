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
            database="parcial"
        )

    def closeDbConnection(self):
        # Cierra conexión con la base de datos
        self.db.close()

    def getAutores(self):
        mycursor = self.db.cursor()
        mycursor.execute("SELECT * FROM parcial.Editoriales;")
        return mycursor.fetchall()
