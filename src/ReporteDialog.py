from PyQt5 import QtCore, QtGui, QtWidgets
from Database import Database
from utils import cargarTabla


class ReporteDialog(QtWidgets.QDialog):
    def __init__(self):
        super(QtWidgets.QDialog, self).__init__()
        self.db = Database.getInstance()
        self.resize(1350, 650)
        self.verticalLayout = QtWidgets.QVBoxLayout(self)
        self.contenedorSuperior = QtWidgets.QHBoxLayout(self)

        self.labelDesde = QtWidgets.QLabel(self)
        self.labelDesde.setText("Desde:")

        self.datePickerDesde = QtWidgets.QDateEdit(self)
        self.datePickerDesde.setDate(QtCore.QDate.currentDate().addDays(-30))
        self.datePickerDesde.setCalendarPopup(True)
        self.datePickerDesde.setDisplayFormat("dd-MM-yyyy")

        self.labelHasta = QtWidgets.QLabel(self)
        self.labelHasta.setText("Hasta:")

        self.datePickerHasta = QtWidgets.QDateEdit(self)
        self.datePickerHasta.setDate(QtCore.QDate.currentDate())
        self.datePickerHasta.setCalendarPopup(True)
        self.datePickerHasta.setDisplayFormat("dd-MM-yyyy")

        self.labelTipoSeguro = QtWidgets.QLabel(self)
        self.labelTipoSeguro.setText("Tipo de Póliza:")

        self.comboFiltroTipoSeguro = QtWidgets.QComboBox(self)
        self.comboFiltroTipoSeguro.addItems(["todas", "Auto", "Hogar", "Vida"])

        self.tablaReporte = QtWidgets.QTableWidget(self)
        self.tablaReporte.setSelectionBehavior(QtWidgets.QTableView.SelectRows)

        self.buttonBox = QtWidgets.QDialogButtonBox(self)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(
            QtWidgets.QDialogButtonBox.Cancel | QtWidgets.QDialogButtonBox.Ok)
        self.buttonBox.accepted.connect(self.accept)
        self.buttonBox.rejected.connect(self.reject)

        # layout final
        self.verticalLayout.addLayout(self.contenedorSuperior)
        self.contenedorSuperior.addWidget(self.labelDesde)
        self.contenedorSuperior.addWidget(self.datePickerDesde)
        self.contenedorSuperior.addWidget(self.labelHasta)
        self.contenedorSuperior.addWidget(self.datePickerHasta)
        self.contenedorSuperior.addWidget(self.labelTipoSeguro)
        self.contenedorSuperior.addWidget(self.comboFiltroTipoSeguro)
        self.verticalLayout.addWidget(self.tablaReporte)
        self.verticalLayout.addWidget(self.buttonBox)

        self.actualizarBusqueda()

        # signals
        self.datePickerDesde.dateChanged.connect(self.actualizarBusqueda)
        self.datePickerHasta.dateChanged.connect(self.actualizarBusqueda)
        self.comboFiltroTipoSeguro.currentIndexChanged.connect(self.actualizarBusqueda)

    # slots
    def actualizarBusqueda(self):
        desde = self.datePickerDesde.date().toString("yyyy-MM-dd")
        hasta = self.datePickerHasta.date().toString("yyyy-MM-dd")
        tipo = self.comboFiltroTipoSeguro.currentText()
        cargarTabla(self.tablaReporte, *self.db.getEstadisticasComision(
            desde=desde, hasta=hasta, tipoPoliza=tipo))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    dialog = ReporteDialog()
    dialog.show()
    dialog.actualizarBusqueda()
    sys.exit(app.exec_())
