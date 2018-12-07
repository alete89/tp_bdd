from PyQt5 import QtCore, QtGui, QtWidgets
from Database import Database
from PolizaAuto import PolizaAuto
import traceback


class PolizaDialog(QtWidgets.QDialog):
    esNueva = False

    def __init__(self, esNueva=True, rowData=None):
        super(QtWidgets.QDialog, self).__init__()
        self.esNueva = esNueva
        self.rowData = rowData

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
                f"{productor['apellido']} {productor['nombre']}", userData=productor['legajo'])
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.FieldRole, self.productorComboBox)
        self.conductorLabel = QtWidgets.QLabel(self)
        self.conductorLabel.setText("Conductor")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.LabelRole, self.conductorLabel)
        self.conductorComboBox = QtWidgets.QComboBox(self)
        for persona in self.db.getPersonasList():
            self.conductorComboBox.addItem(
                f"{persona['apellido']} {persona['nombre']}", userData=persona['dni'])
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.FieldRole, self.conductorComboBox)
        self.autoLabel = QtWidgets.QLabel(self)
        self.autoLabel.setText("Auto")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.LabelRole, self.autoLabel)
        self.autoComboBox = QtWidgets.QComboBox(self)
        for auto in self.db.getAutosList(None if esNueva else rowData['Auto_id']):
            self.autoComboBox.addItem(
                f"id/patente: {auto['id']} - Modelo: {auto['marca']} {auto['nombre']}", userData=auto['id'])
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.FieldRole, self.autoComboBox)
        self.addAuto = QtWidgets.QPushButton()
        self.addAuto.setText("Agregar Auto")
        self.formLayout.setWidget(3, 1, self.addAuto)
        self.grupoDeRiesgoLabel = QtWidgets.QLabel(self)
        self.grupoDeRiesgoLabel.setText("Grupo de Riesgo")
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.LabelRole, self.grupoDeRiesgoLabel)
        self.GrupoDeRiesgoCombo = QtWidgets.QComboBox(self)
        for grupoRiesgo in self.db.getGruposRiesgoList():
            self.GrupoDeRiesgoCombo.addItem(
                f"{grupoRiesgo['descripcion']}", userData=grupoRiesgo['id'])
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

        self.error = QtWidgets.QLabel(self)
        self.verticalLayout.addWidget(self.error)

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

    def dialogEditarPoliza(self, poliza):
        productorIndex = self.productorComboBox.findData(poliza['Productor_legajo'])
        self.productorComboBox.setCurrentIndex(productorIndex)
        personaIndex = self.conductorComboBox.findData(poliza['Persona_dni'])
        self.conductorComboBox.setCurrentIndex(personaIndex)
        autoIndex = self.autoComboBox.findData(poliza['Auto_id'])
        self.autoComboBox.setCurrentIndex(autoIndex)
        grupoRiesgoIndex = self.GrupoDeRiesgoCombo.findData(poliza['Grupo_Riesgo_id'])
        self.GrupoDeRiesgoCombo.setCurrentIndex(grupoRiesgoIndex)
        self.franquiciaLineEdit.setText(str(poliza['franquicia']))
        fechaPoliza = poliza['inicio']
        self.validoDesdeDateEdit.setDate(fechaPoliza)

    def handleOK(self):
        poliza = PolizaAuto()
        # reemplazar por constructor
        try:
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
                poliza.estado = 1
                self.db.insercionPolizaAuto(poliza)
            else:
                poliza.id = self.rowData['id']
                poliza.estado = self.rowData['Estado_id']
                self.db.actualizacionPolizaAuto(poliza)
            self.accept()
        except Exception as e:
            print(e)
            self.error.setText(e.__str__())


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    dialog = PolizaDialog()
    dialog.show()
    sys.exit(app.exec_())
