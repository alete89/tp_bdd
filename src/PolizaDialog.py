from PyQt5 import QtCore, QtGui, QtWidgets
from Database import Database


class PolizaDialog(QtWidgets.QDialog):
    def __init__(self):
        super(QtWidgets.QDialog, self).__init__()
        self.db = Database.getInstance()
        self.resize(400, 367)
        self.verticalLayout = QtWidgets.QVBoxLayout(self)
        self.formLayout = QtWidgets.QFormLayout()
        self.productorLabel = QtWidgets.QLabel(self)
        self.productorLabel.setText("Productor")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.productorLabel)
        self.productorComboBox = QtWidgets.QComboBox(self)
        for productor in self.db.getProductoresList().fetchall():
            self.productorComboBox.addItem(str(productor[1] + " " + productor[0]))
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.FieldRole, self.productorComboBox)
        self.conductorLabel = QtWidgets.QLabel(self)
        self.conductorLabel.setText("Conductor")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.LabelRole, self.conductorLabel)
        self.conductorComboBox = QtWidgets.QComboBox(self)
        for persona in self.db.getPersonasList().fetchall():
            self.conductorComboBox.addItem(str(persona[1] + " " + persona[0]))
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.FieldRole, self.conductorComboBox)
        self.autoLabel = QtWidgets.QLabel(self)
        self.autoLabel.setText("Auto")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.LabelRole, self.autoLabel)
        self.autoComboBox = QtWidgets.QComboBox(self)
        for auto in self.db.getAutosList().fetchall():
            self.autoComboBox.addItem("id/patente: " + str(auto[0]) + " - Modelo: " + auto[1])
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.FieldRole, self.autoComboBox)
        self.addAuto = QtWidgets.QPushButton()
        self.addAuto.setText("Agregar Auto")
        self.formLayout.setWidget(3, 1, self.addAuto)
        self.grupoDeRiesgoLabel = QtWidgets.QLabel(self)
        self.grupoDeRiesgoLabel.setText("Grupo de Riesgo")
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.LabelRole, self.grupoDeRiesgoLabel)
        self.GrupoDeRiesgoCombo = QtWidgets.QComboBox(self)
        for grupoRiesgo in self.db.getGruposRiesgoList().fetchall():
            self.GrupoDeRiesgoCombo.addItem(str(grupoRiesgo[0]))
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

        self.buttonBox.accepted.connect(self.accept)
        self.buttonBox.rejected.connect(self.reject)
        QtCore.QMetaObject.connectSlotsByName(self)


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    dialog = PolizaDialog()
    dialog.show()
    sys.exit(app.exec_())
