from PyQt5 import QtCore, QtGui, QtWidgets
from Database import Database
from PolizaAuto import PolizaAuto


class PolizaDialog(QtWidgets.QDialog):
    esNueva = False
    def __init__(self, esNueva=True, rowData=None):
        super(QtWidgets.QDialog, self).__init__()
        self.esNueva = esNueva

        self.db = Database.getInstance()
        self.resize(400, 367)
        self.verticalLayout = QtWidgets.QVBoxLayout(self)
        self.formLayout = QtWidgets.QFormLayout()
        self.productorLabel = QtWidgets.QLabel(self)
        self.productorLabel.setText("Productor")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.productorLabel)
        self.productorComboBox = QtWidgets.QComboBox(self)
        for productor in self.db.getProductoresList():
            self.productorComboBox.addItem(
                str(productor[1] + " " + productor[0]), userData=productor[2])
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.FieldRole, self.productorComboBox)
        self.conductorLabel = QtWidgets.QLabel(self)
        self.conductorLabel.setText("Conductor")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.LabelRole, self.conductorLabel)
        self.conductorComboBox = QtWidgets.QComboBox(self)
        for persona in self.db.getPersonasList():
            self.conductorComboBox.addItem(str(persona[1] + " " + persona[0]), userData=persona[2])
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.FieldRole, self.conductorComboBox)
        self.autoLabel = QtWidgets.QLabel(self)
        self.autoLabel.setText("Auto")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.LabelRole, self.autoLabel)
        self.autoComboBox = QtWidgets.QComboBox(self)
        for auto in self.db.getAutosList():
            self.autoComboBox.addItem(
                "id/patente: " + str(auto[0]) + " - Modelo: " + auto[1], userData=auto[0])
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.FieldRole, self.autoComboBox)
        self.addAuto = QtWidgets.QPushButton()
        self.addAuto.setText("Agregar Auto")
        self.formLayout.setWidget(3, 1, self.addAuto)
        self.grupoDeRiesgoLabel = QtWidgets.QLabel(self)
        self.grupoDeRiesgoLabel.setText("Grupo de Riesgo")
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.LabelRole, self.grupoDeRiesgoLabel)
        self.GrupoDeRiesgoCombo = QtWidgets.QComboBox(self)
        for grupoRiesgo in self.db.getGruposRiesgoList():
            self.GrupoDeRiesgoCombo.addItem(str(grupoRiesgo[1]), userData=grupoRiesgo[0])
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.FieldRole, self.GrupoDeRiesgoCombo)
        self.franquiciaLabel = QtWidgets.QLabel(self)
        self.franquiciaLabel.setText("Franquicia")
        self.formLayout.setWidget(5, QtWidgets.QFormLayout.LabelRole, self.franquiciaLabel)
        self.franquiciaLineEdit = QtWidgets.QLineEdit(self)
        self.formLayout.setWidget(5, QtWidgets.QFormLayout.FieldRole, self.franquiciaLineEdit)
        self.validoDesdeLabel = QtWidgets.QLabel(self)
        self.validoDesdeLabel.setText("Válido desde")
        self.formLayout.setWidget(6, QtWidgets.QFormLayout.LabelRole, self.validoDesdeLabel)
        self.validoDesdeDateEdit = QtWidgets.QDateEdit(self)
        self.validoDesdeDateEdit.setDate(QtCore.QDate.currentDate())
        self.validoDesdeDateEdit.setCalendarPopup(True)
        self.validoDesdeDateEdit.setDisplayFormat("dd-MM-yyyy")
        self.formLayout.setWidget(6, QtWidgets.QFormLayout.FieldRole, self.validoDesdeDateEdit)
        self.verticalLayout.addLayout(self.formLayout)
        self.buttonBox = QtWidgets.QDialogButtonBox(self)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(
            QtWidgets.QDialogButtonBox.Cancel | QtWidgets.QDialogButtonBox.Ok)
        self.verticalLayout.addWidget(self.buttonBox)

        self.buttonBox.accepted.connect(self.handleOK)
        self.buttonBox.rejected.connect(self.reject)
        QtCore.QMetaObject.connectSlotsByName(self)

        if (esNueva):
            self.dialogNuevaPoliza()
        else:
            if not rowData:
                self.reject()
            else:
                self.dialogEditarPoliza(rowData)

    def dialogNuevaPoliza(self):
        self.productorComboBox.setCurrentIndex(-1)
        self.autoComboBox.setCurrentIndex(-1)
        self.GrupoDeRiesgoCombo.setCurrentIndex(-1)
        self.conductorComboBox.setCurrentIndex(-1)

    def dialogEditarPoliza(self, rowData):
        productorIndex = self.productorComboBox.findData(rowData[6].text())
        self.productorComboBox.setCurrentIndex(productorIndex)
        personaIndex = self.conductorComboBox.findData(rowData[7].text())
        self.conductorComboBox.setCurrentIndex(personaIndex)
        autoIndex = self.autoComboBox.findData(rowData[1].text())
        self.autoComboBox.setCurrentIndex(autoIndex)
        grupoRiesgoIndex = self.GrupoDeRiesgoCombo.findData(rowData[2].text())
        self.GrupoDeRiesgoCombo.setCurrentIndex(grupoRiesgoIndex)
        self.franquiciaLineEdit.setText(rowData[3].text())
        fechaPoliza = QtCore.QDate.fromString(rowData[9].text(), "yyyy-MM-dd")
        self.validoDesdeDateEdit.setDate(fechaPoliza)

    def handleOK(self):
        poliza = PolizaAuto()
        # reemplazar por constructor
        poliza.estado = 1
        poliza.productorLegajo = self.productorComboBox.currentData()
        poliza.clienteDni = self.conductorComboBox.currentData()
        poliza.franquicia = float(self.franquiciaLineEdit.text())
        poliza.autoId = self.autoComboBox.currentData()
        poliza.grupoRiesgoId = self.GrupoDeRiesgoCombo.currentData()
        poliza.fechaInicio = self.validoDesdeDateEdit.date().toString("yyyy-MM-dd")
        poliza.porcentajeProductor = 10
        poliza.calcularPrima()
        poliza.calcularFechaFin()

        # reemplazar por constructor
        if (self.esNueva):
            print(poliza)
            self.db.insercionPolizaAuto(poliza)

        self.accept()


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    dialog = PolizaDialog()
    dialog.show()
    sys.exit(app.exec_())
