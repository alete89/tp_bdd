from PyQt5.QtCore import QDate


class PolizaAuto:

    def __str__(self):
        return str(self.__dict__)

    id: int
    estado: int
    productorLegajo: int
    clienteDni: int
    prima: float
    fechaInicio: str
    fechaFin: str
    porcentajeProductor: float

    autoId: int
    grupoRiesgoId: int
    franquicia: float

    def calcularPrima(self):
        self.prima = self.franquicia / 12

    def calcularFechaFin(self):
        fechaFin = QDate.fromString(self.fechaInicio, "yyyy-MM-dd")
        fechaFin = fechaFin.addYears(1)
        self.fechaFin = fechaFin.toString("yyyy-MM-dd")
