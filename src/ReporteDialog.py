from PyQt5 import QtCore, QtGui, QtWidgets
from Database import Database
from utils import cargarTabla


class ReporteDialog(QtWidgets.QDialog):
    def __init__(self):
        super(QtWidgets.QDialog, self).__init__()
        self.db = Database.getInstance()
        self.resize(800, 600)
        self.verticalLayout = QtWidgets.QVBoxLayout(self)
        self.contenedorSuperior = QtWidgets.QHBoxLayout(self)

        self.labelDesde = QtWidgets.QLabel(self)
        self.labelDesde.setText("Desde:")

        self.datePickerDesde = QtWidgets.QDateEdit(self)
        self.datePickerDesde.setDate(QtCore.QDate.currentDate())
        self.datePickerDesde.setCalendarPopup(True)
        self.datePickerDesde.setDisplayFormat("dd-MM-yyyy")

        self.labelHasta = QtWidgets.QLabel(self)
        self.labelHasta.setText("Hasta:")

        self.datePickerHasta = QtWidgets.QDateEdit(self)
        self.datePickerHasta.setDate(QtCore.QDate.currentDate())
        self.datePickerHasta.setCalendarPopup(True)
        self.datePickerHasta.setDisplayFormat("dd-MM-yyyy")

        self.tablaReporte = QtWidgets.QTableWidget(self)

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
        self.verticalLayout.addWidget(self.tablaReporte)
        self.verticalLayout.addWidget(self.buttonBox)

        cargarTabla(self.tablaReporte, self.db.getEstadisticasComision())


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    dialog = ReporteDialog()
    dialog.show()
    sys.exit(app.exec_())
