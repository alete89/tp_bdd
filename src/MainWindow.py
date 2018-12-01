from PyQt5 import QtCore, QtGui, QtWidgets
import mysql.connector
from NuevaPolizaDialog import Ui_NuevaPolizaDialog


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(800, 600)
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
        self.horizontalLayout.addLayout(self.columnaDerecha)
        MainWindow.setCentralWidget(self.centralwidget)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
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
        self.startDbConnection()

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.labelTabla.setText(_translate(
            "MainWindow", "Pólizas de Auto Vigentes:"))
        self.nuevaButton.setText(_translate("MainWindow", "Nueva"))
        self.editarButton.setText(_translate("MainWindow", "Editar"))
        self.cambiarEstadoButton.setText(
            _translate("MainWindow", "Cambiar Estado"))
        self.menuArchivo.setTitle(_translate("MainWindow", "Archivo"))
        self.menuAyuda.setTitle(_translate("MainWindow", "Ayuda"))
        self.actionSalir.setText(_translate("MainWindow", "Salir"))
        self.actionSalir.setToolTip(_translate(
            "MainWindow", "Abandonar el programa"))
        self.actionSalir.setShortcut(_translate("MainWindow", "Ctrl+Q"))
        self.actionAcerca_de.setText(_translate("MainWindow", "Acerca de..."))
        self.actionAcerca_de.setToolTip(
            _translate("MainWindow", "Acerca de este TP"))

        # conexión
        self.nuevaButton.clicked.connect(self.openNuevaPolizaDialog)

        self.startDbConnection()
        self.loadAutoresIntoTable()

    def openNuevaPolizaDialog(self):
        dialog = QtWidgets.QDialog()
        ui = Ui_NuevaPolizaDialog()
        ui.setupUi(dialog)
        dialog.exec_()

    def startDbConnection(self):
        self.db = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="password",
            database="parcial"
        )

    def getAutores(self):
        mycursor = self.db.cursor()
        mycursor.execute("SELECT * FROM parcial.Editoriales;")
        return mycursor.fetchall()

    def loadAutoresIntoTable(self):
        self.tablaPolizas.setRowCount(0)
        for rowNumber, rowData in enumerate(self.getAutores()):
            self.tablaPolizas.insertRow(rowNumber)
            for columnNumber, data in enumerate(rowData):
                if (rowNumber == 0):
                    self.tablaPolizas.insertColumn(columnNumber)
                self.tablaPolizas.setItem(
                    rowNumber, columnNumber, QtWidgets.QTableWidgetItem(str(data)))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    mw = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(mw)
    mw.show()
    sys.exit(app.exec_())
