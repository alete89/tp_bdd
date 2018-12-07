from PyQt5 import QtWidgets
from PyQt5 import QtCore


def cargarTabla(tabla : QtWidgets.QTableWidget, values, columnNames):
    tabla.clear()
    tabla.setRowCount(0)
    tabla.setColumnCount(len(columnNames))
    tabla.setHorizontalHeaderLabels(columnNames)
    tabla.verticalHeader().hide()
    for rowNumber, rowData in enumerate(values):
        tabla.insertRow(rowNumber)
        for columnNumber, columnName in enumerate(columnNames):
            valor = rowData[columnName]
            value = f'{valor:0.2f}' if isinstance(valor, float) else f'{valor}'
            item = QtWidgets.QTableWidgetItem(value)
            item.setFlags(QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsEnabled)

            if isinstance(valor, float) or isinstance(valor, int):
                item.setTextAlignment(QtCore.Qt.AlignRight | QtCore.Qt.AlignVCenter)
            tabla.setItem(rowNumber, columnNumber, item)
    tabla.resizeColumnsToContents()

    currentWidth = 0
    for columnNumber, columnName in enumerate(columnNames):
        currentWidth += tabla.columnWidth(columnNumber)
    widthToAdd = (tabla.width() - 1 - currentWidth) / len(columnNames)
    for columnNumber, columnName in enumerate(columnNames):
        tabla.setColumnWidth(columnNumber, tabla.columnWidth(columnNumber) + widthToAdd)