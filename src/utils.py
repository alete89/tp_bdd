from PyQt5 import QtWidgets


def cargarTabla(tabla, resultado):
    tabla.clear()
    tabla.setColumnCount(len(resultado.column_names))
    tabla.setHorizontalHeaderLabels(resultado.column_names)
    tabla.verticalHeader().hide()
    for rowNumber, rowData in enumerate(resultado.fetchall()):
        tabla.insertRow(rowNumber)
        for columnNumber, data in enumerate(rowData):
            tabla.setItem(
                rowNumber, columnNumber, QtWidgets.QTableWidgetItem(str(data)))
