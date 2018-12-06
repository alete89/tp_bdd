from PyQt5 import QtWidgets
from PyQt5 import QtCore


def cargarTabla(tabla, values, columnNames):
    tabla.clear()
    tabla.setRowCount(0)
    tabla.setColumnCount(len(columnNames))
    tabla.setHorizontalHeaderLabels(columnNames)
    tabla.verticalHeader().hide()
    for rowNumber, rowData in enumerate(values):
        tabla.insertRow(rowNumber)
        for columnNumber, data in enumerate(rowData):
            value = f'{data:0.2f}' if isinstance(data, float) else f'{data}'
            item = QtWidgets.QTableWidgetItem(value)
            item.setFlags(QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsEnabled)

            if isinstance(data, float) or isinstance(data, int):
                item.setTextAlignment(QtCore.Qt.AlignRight | QtCore.Qt.AlignVCenter)
            tabla.setItem(rowNumber, columnNumber, item)
