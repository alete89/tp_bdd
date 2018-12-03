from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_NuevaPolizaDialog(object):
    def setupUi(self, nuevaPolizaDialog):
        nuevaPolizaDialog.setObjectName("nuevaPolizaDialog")
        nuevaPolizaDialog.resize(400, 367)
        self.verticalLayout = QtWidgets.QVBoxLayout(nuevaPolizaDialog)
        self.verticalLayout.setObjectName("verticalLayout")
        self.formLayout = QtWidgets.QFormLayout()
        self.formLayout.setObjectName("formLayout")
        self.productorLabel = QtWidgets.QLabel(nuevaPolizaDialog)
        self.productorLabel.setObjectName("productorLabel")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.productorLabel)
        self.productorComboBox = QtWidgets.QComboBox(nuevaPolizaDialog)
        self.productorComboBox.setObjectName("productorComboBox")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.FieldRole, self.productorComboBox)
        self.conductorLabel = QtWidgets.QLabel(nuevaPolizaDialog)
        self.conductorLabel.setObjectName("conductorLabel")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.LabelRole, self.conductorLabel)
        self.conductorComboBox = QtWidgets.QComboBox(nuevaPolizaDialog)
        self.conductorComboBox.setObjectName("conductorComboBox")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.FieldRole, self.conductorComboBox)
        self.autoLabel = QtWidgets.QLabel(nuevaPolizaDialog)
        self.autoLabel.setObjectName("autoLabel")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.LabelRole, self.autoLabel)
        self.autoComboBox = QtWidgets.QComboBox(nuevaPolizaDialog)
        self.autoComboBox.setObjectName("autoComboBox")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.FieldRole, self.autoComboBox)
        self.grupoDeRiesgoLabel = QtWidgets.QLabel(nuevaPolizaDialog)
        self.grupoDeRiesgoLabel.setObjectName("grupoDeRiesgoLabel")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.LabelRole, self.grupoDeRiesgoLabel)
        self.tercerosRadioButton = QtWidgets.QRadioButton(nuevaPolizaDialog)
        self.tercerosRadioButton.setObjectName("tercerosRadioButton")
        self.radioButtonGroup = QtWidgets.QButtonGroup(nuevaPolizaDialog)
        self.radioButtonGroup.setObjectName("radioButtonGroup")
        self.radioButtonGroup.addButton(self.tercerosRadioButton)
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.FieldRole, self.tercerosRadioButton)
        self.tercerosPlusRadioButton = QtWidgets.QRadioButton(nuevaPolizaDialog)
        self.tercerosPlusRadioButton.setObjectName("tercerosPlusRadioButton")
        self.radioButtonGroup.addButton(self.tercerosPlusRadioButton)
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.FieldRole, self.tercerosPlusRadioButton)
        self.todoRiesgoRadioButton = QtWidgets.QRadioButton(nuevaPolizaDialog)
        self.todoRiesgoRadioButton.setObjectName("todoRiesgoRadioButton")
        self.radioButtonGroup.addButton(self.todoRiesgoRadioButton)
        self.formLayout.setWidget(5, QtWidgets.QFormLayout.FieldRole, self.todoRiesgoRadioButton)
        self.franquiciaLabel = QtWidgets.QLabel(nuevaPolizaDialog)
        self.franquiciaLabel.setObjectName("franquiciaLabel")
        self.formLayout.setWidget(6, QtWidgets.QFormLayout.LabelRole, self.franquiciaLabel)
        self.franquiciaLineEdit = QtWidgets.QLineEdit(nuevaPolizaDialog)
        self.franquiciaLineEdit.setObjectName("franquiciaLineEdit")
        self.formLayout.setWidget(6, QtWidgets.QFormLayout.FieldRole, self.franquiciaLineEdit)
        self.validoDesdeLabel = QtWidgets.QLabel(nuevaPolizaDialog)
        self.validoDesdeLabel.setObjectName("validoDesdeLabel")
        self.formLayout.setWidget(7, QtWidgets.QFormLayout.LabelRole, self.validoDesdeLabel)
        self.validoDesdeDateEdit = QtWidgets.QDateEdit(nuevaPolizaDialog)
        self.validoDesdeDateEdit.setObjectName("validoDesdeDateEdit")
        self.validoDesdeDateEdit.setCalendarPopup(True)
        self.formLayout.setWidget(7, QtWidgets.QFormLayout.FieldRole, self.validoDesdeDateEdit)
        self.verticalLayout.addLayout(self.formLayout)
        self.buttonBox = QtWidgets.QDialogButtonBox(nuevaPolizaDialog)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtWidgets.QDialogButtonBox.Cancel | QtWidgets.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName("buttonBox")
        self.verticalLayout.addWidget(self.buttonBox)

        self.retranslateUi(nuevaPolizaDialog)
        self.buttonBox.accepted.connect(nuevaPolizaDialog.accept)
        self.buttonBox.rejected.connect(nuevaPolizaDialog.reject)
        QtCore.QMetaObject.connectSlotsByName(nuevaPolizaDialog)

    def retranslateUi(self, nuevaPolizaDialog):
        _translate = QtCore.QCoreApplication.translate
        nuevaPolizaDialog.setWindowTitle(_translate("nuevaPolizaDialog", "Dialog"))
        self.productorLabel.setText(_translate("nuevaPolizaDialog", "Productor"))
        self.conductorLabel.setText(_translate("nuevaPolizaDialog", "Conductor"))
        self.autoLabel.setText(_translate("nuevaPolizaDialog", "Auto"))
        self.grupoDeRiesgoLabel.setText(_translate("nuevaPolizaDialog", "Grupo de Riesgo"))
        self.tercerosRadioButton.setText(_translate("nuevaPolizaDialog", "terceros"))
        self.tercerosPlusRadioButton.setText(_translate("nuevaPolizaDialog", "terceros plus"))
        self.todoRiesgoRadioButton.setText(_translate("nuevaPolizaDialog", "todo riesgo"))
        self.franquiciaLabel.setText(_translate("nuevaPolizaDialog", "Franquicia"))
        self.validoDesdeLabel.setText(_translate("nuevaPolizaDialog", "Valido Desde"))
