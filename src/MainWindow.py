from PyQt5 import QtCore, QtGui, QtWidgets
from Database import Database as db
from PolizaDialog import PolizaDialog
from ReporteDialog import ReporteDialog
from utils import cargarTabla


class Ui_MainWindow(object):
    pagina = 1
    polizas = []
    columnas = ['id', 'Auto_id', 'Grupo_Riesgo', 'franquicia',
                'Estado', 'Productor', 'Persona', 'prima', 'inicio', 'fin']

    def setupUi(self, MainWindow):
        self.db = db.getInstance()
        self.db.startDbConnection()

        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(1350, 650)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.centralwidget)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.columnaIzquierda = QtWidgets.QVBoxLayout()
        self.columnaIzquierda.setObjectName("columnaIzquierda")
        self.labelTabla = QtWidgets.QLabel(self.centralwidget)
        self.labelTabla.setObjectName("labelTabla")
        self.columnaIzquierda.addWidget(self.labelTabla)
        self.tablaPolizas = QtWidgets.QTableWidget(self.centralwidget)
        self.tablaPolizas.setSelectionBehavior(QtWidgets.QTableView.SelectRows)
        self.tablaPolizas.setObjectName("tablaPolizas")
        self.columnaIzquierda.addWidget(self.tablaPolizas)
        self.horizontalLayout.addLayout(self.columnaIzquierda)
        self.columnaDerecha = QtWidgets.QVBoxLayout()
        self.columnaDerecha.setObjectName("columnaDerecha")
        self.nuevaButton = QtWidgets.QPushButton(self.centralwidget)
        self.nuevaButton.setObjectName("nuevaButton")
        self.columnaDerecha.addWidget(self.nuevaButton)
        self.editarButton = QtWidgets.QPushButton(self.centralwidget)
        self.editarButton.setObjectName("editarButton")
        self.columnaDerecha.addWidget(self.editarButton)
        self.cambiarEstadoButton = QtWidgets.QPushButton(self.centralwidget)
        self.cambiarEstadoButton.setObjectName("cambiarEstadoButton")
        self.columnaDerecha.addWidget(self.cambiarEstadoButton)
        self.actualizarEstadoButton = QtWidgets.QPushButton(self.centralwidget)
        self.actualizarEstadoButton.setObjectName("actualizarEstadoButton")
        self.columnaDerecha.addWidget(self.actualizarEstadoButton)
        self.reporteButton = QtWidgets.QPushButton(self.centralwidget)
        self.reporteButton.setObjectName("reporteButton")
        self.columnaDerecha.addWidget(self.reporteButton)

        self.horizontalLayout.addLayout(self.columnaDerecha)
        MainWindow.setCentralWidget(self.centralwidget)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")

        self.anteriorButton = QtWidgets.QPushButton(self.centralwidget)
        self.anteriorButton.setObjectName("anteriorButton")
        self.statusbar.addWidget(self.anteriorButton)
        self.paginaLabel = QtWidgets.QLabel(self.centralwidget)
        self.paginaLabel.setObjectName("paginaLabel")
        self.statusbar.addWidget(self.paginaLabel)
        self.siguienteButton = QtWidgets.QPushButton(self.centralwidget)
        self.siguienteButton.setObjectName("siguienteButton")
        self.statusbar.addWidget(self.siguienteButton)

        MainWindow.setStatusBar(self.statusbar)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 25))
        self.menubar.setObjectName("menubar")
        self.menuArchivo = QtWidgets.QMenu(self.menubar)
        self.menuArchivo.setObjectName("menuArchivo")
        self.menuAyuda = QtWidgets.QMenu(self.menubar)
        self.menuAyuda.setObjectName("menuAyuda")
        MainWindow.setMenuBar(self.menubar)
        self.actionSalir = QtWidgets.QAction(MainWindow)
        self.actionSalir.setObjectName("actionSalir")
        self.actionAcerca_de = QtWidgets.QAction(MainWindow)
        self.actionAcerca_de.setObjectName("actionAcerca_de")
        self.menuArchivo.addAction(self.actionSalir)
        self.menuAyuda.addAction(self.actionAcerca_de)
        self.menubar.addAction(self.menuArchivo.menuAction())
        self.menubar.addAction(self.menuAyuda.menuAction())

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.labelTabla.setText(_translate(
            "MainWindow", "Pólizas de Auto Vigentes:"))
        self.nuevaButton.setText(_translate("MainWindow", "Nueva"))
        self.editarButton.setText(_translate("MainWindow", "Editar"))
        self.cambiarEstadoButton.setText(
            _translate("MainWindow", "Cancelar / Reactivar"))
        self.actualizarEstadoButton.setText(
            _translate("MainWindow", "Actualizar Estado Vencido"))
        self.menuArchivo.setTitle(_translate("MainWindow", "Archivo"))
        self.menuAyuda.setTitle(_translate("MainWindow", "Ayuda"))
        self.actionSalir.setText(_translate("MainWindow", "Salir"))
        self.actionSalir.setToolTip(_translate(
            "MainWindow", "Abandonar el programa"))
        self.actionSalir.setShortcut(_translate("MainWindow", "Ctrl+Q"))
        self.actionAcerca_de.setText(_translate("MainWindow", "Acerca de..."))
        self.actionAcerca_de.setToolTip(
            _translate("MainWindow", "Acerca de este TP"))

        self.anteriorButton.setText(_translate("MainWindow", "Anterior"))
        self.siguienteButton.setText(_translate("MainWindow", "Siguiente"))
        self.reporteButton.setText(_translate("MainWindow", "Mostrar Reporte"))

        # conexión
        self.nuevaButton.clicked.connect(self.openNuevaPolizaDialog)
        self.editarButton.clicked.connect(self.openEditarPolizaDialog)
        self.anteriorButton.clicked.connect(self.anteriorPagina)
        self.siguienteButton.clicked.connect(self.siguientePagina)
        self.cambiarEstadoButton.clicked.connect(self.cambiarEstado)
        self.actualizarEstadoButton.clicked.connect(self.actualizarEstado)
        self.reporteButton.clicked.connect(self.abrirReporte)

    def abrirReporte(self):
        dialog = ReporteDialog()
        dialog.exec_()

    def openNuevaPolizaDialog(self):
        dialog = PolizaDialog()
        result = dialog.exec_()
        if (result):
            self.actualizarPagina()

    def openEditarPolizaDialog(self):
        if (self.tablaPolizas.selectedItems()):
            dialog = PolizaDialog(False, self.obtenerPolizaSeleccionada())
            result = dialog.exec_()
            if (result):
                self.actualizarPagina()

        else:
            print("no se seleccionó ninguna fila para editar")

    def cambiarEstado(self):
        if (self.tablaPolizas.selectedItems()):
            poliza = self.obtenerPolizaSeleccionada()
            if poliza['Estado_id'] != 2:
                nuevoEstado = 3 if poliza['Estado_id'] == 1 else 1
                self.db.actualizacionPolizaAutoEstado(poliza['id'], nuevoEstado)
                self.actualizarPagina()
        else:
            print("no se seleccionó ninguna fila para cambiar el estado")

    def actualizarEstado(self):
        self.db.actualizacionPolizasEstadoVencido()
        self.actualizarPagina()

    def obtenerPolizaSeleccionada(self):
        for poliza in self.polizas:
            if str(poliza['id']) == self.tablaPolizas.selectedItems()[0].text():
                return poliza

    def anteriorPagina(self):
        if self.pagina > 1:
            self.pagina -= 1
            self.actualizarPagina()

    def siguientePagina(self):
        self.pagina += 1
        self.actualizarPagina()

    def actualizarPagina(self):
        _translate = QtCore.QCoreApplication.translate
        self.paginaLabel.setText(_translate("MainWindow", f"Pagina: {self.pagina}"))
        self.polizas, columnNames = self.db.getPolizasAutoList(self.pagina)
        cargarTabla(self.tablaPolizas, self.polizas, self.columnas)


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    mw = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(mw)
    mw.show()
    ui.actualizarPagina()
    sys.exit(app.exec_())
