#!/usr/bin/env python
# coding: utf-8

# In[1]:


import os
import sys
import json
import subprocess
import csv
from PyQt5 import QtWidgets, QtGui, QtCore
from PyQt5.QtCore import QSettings, Qt, QThread, pyqtSignal
from PyQt5.QtGui import QIcon, QWindow, QPixmap
from PyQt5.QtWidgets import QGraphicsView, QGraphicsScene

class ScriptRunner(QThread):
    finished = pyqtSignal(bool, str)

    def __init__(self, script_name, args=None):
        super().__init__()
        self.script_name = script_name
        self.args = args or []

    def run(self):
        try:
            # Ejecutar el script de Python
            subprocess.run([sys.executable, self.script_name] + self.args, check=True)
            self.finished.emit(True, "The process was sucessfully done.")
        except subprocess.CalledProcessError as e:
            self.finished.emit(False, "There was an error with the process.\nError: {}".format(e))

class PrettyWidget(QtWidgets.QWidget):

    def __init__(self):
        super(PrettyWidget, self).__init__()
        self.initUI()

    def initUI(self):
        self.setGeometry(1200, 600, 1200, 500)
        self.setWindowTitle('PyForAGNfit-full')

        # Ruta del archivo de datos
        self.data_file = 'data.json'
        self.data_file_csv = 'datacsv.json'

        # Cargar datos
        self.data = load_data(self.data_file)
        #if self.data == None:
        #    self.data = self.default_data()
        # Cargar datos
        #self.data1 = load_data(self.data_file_csv)
        #if self.data1 == None:
        #    self.data1 = self.default_data()  
         
         # Ensure 'table6' is initialized
        #if "table6" not in self.data:
        #    self.data["table6"] = self.default_data()["table6"]

        # Crear el widget de pestañas
        self.tab_widget = QtWidgets.QTabWidget()
        main_layout = QtWidgets.QVBoxLayout()
        main_layout.addWidget(self.tab_widget)
        self.setLayout(main_layout)

        # Crear las pestañas
        self.create_tabs()

        self.showMaximized()

    def default_data(self):
        return {
            "table1": {
                'Flux': ['']*61, 
                'Coef Flux': ['']*61, 
                'Width': ['']*61,
                'Coef Width': ['']*61,
                'Shift': ['']*61,
                'Coef Shift': ['']*61,
                'On/Off': ['0']*61,
                'Maximum': ['']*61,
                'Profile Model': ['']*61
            },
            "table2": {
                'Norm Template': ['']*2,
                'Coef Norm Template': ['']*2,
                'Width': ['']*2,
                'Coef Width': ['']*2,
                'Shift': ['']*2,
                'Coef Shift': ['']*2,
                'On/Off' : ['']*2
            },
            "table3": {
                'Norm': [''],
                'Coef Norm': [''],
                'Slope 1': [''],
                'Step Slope 1': [''],
                'Slope 2': [''],
                'Step Slope 2': [''],
                'Wave Break': [''],
                'Step Wave Break': [''],
                'On/Off' : ['']
            },
            "table4": {
                'Input Files': ['']*10
            },
            "table5": {
                'Input': ['']*16
            },
            "table6": {  
                'Flux' : ['']*2,
                'Coef Flux' : ['']*2,
                'FWHM HOBL' : ['']*2,
                'On/Off' : ['']*2
            },
            "table7": {
                'Flux' : [''],
                'Coef Flux' : [''],
                'Width' : [''],
                'Coef Width' : [''],
                'Reference Absorption Line' : [''],
                'On/Off' : ['']
            }
        }

    def create_tabs(self):
        # Crear las pestañas
        self.create_main_tab()
        self.create_tab1("Console")
        self.create_tab2("Plot")

    def create_main_tab(self):
        main_tab = QtWidgets.QWidget()
        grid = QtWidgets.QGridLayout()
        main_tab.setLayout(grid)

        # Crear tablas
        self.create_tables(grid)

        # Botón para guardar datos
        save_button = QtWidgets.QPushButton('Save Data')
        save_button.clicked.connect(self.save_data)
        grid.addWidget(save_button, 0, 2, 1, 1)  # Posición del botón en la cuadrícula

        # Botón para ejecutar archivo .py
        run_script_button = QtWidgets.QPushButton('Create')
        run_script_button.clicked.connect(self.run_script_individual)
        grid.addWidget(run_script_button, 0, 2 ,2 , 1)  # Posición del botón en la cuadrícula

        # Botón para cargar archivo CSV
        load_csv_button = QtWidgets.QPushButton('Load CSV')
        load_csv_button.clicked.connect(self.load_csv)
        grid.addWidget(load_csv_button, 1,2, 1, 1)  # Posición del botón en la cuadrícula

        self.tab_widget.addTab(main_tab, "Spectroscopic Fit Parameters")
        
        # Estado para indicar si se ha cargado un CSV
        self.csv_loaded = False
        self.csv_file_path = None  # Añadido para almacenar la ruta del archivo CSV
        
        # Botón para ejecutar lista csv
        ex_csv_button = QtWidgets.QPushButton('Create CSV')
        ex_csv_button.clicked.connect(self.save_data_csv)
        grid.addWidget(ex_csv_button,2,2,1,1)

    def create_tab1(self, tab_name):
        tab1 = QtWidgets.QWidget()
        layout1 = QtWidgets.QVBoxLayout()
        tab1.setLayout(layout1)

        # Crear un contenedor para la ventana del terminal
        self.term_container = QtWidgets.QWidget()
        layout1.addWidget(self.term_container)

        # Ejecutar xfce4-terminal en segundo plano, ubicado en la carpeta Results
        self.process = subprocess.Popen(['xfce4-terminal', '--working-directory=Tesis', '--disable-server', '--hide-menubar'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        # Obtener el ID de la ventana del terminal usando xdotool
        proc = subprocess.Popen(['xdotool', 'search', '--sync', '--onlyvisible', '--pid', str(self.process.pid)], stdout=subprocess.PIPE)
        term_id = int(proc.stdout.readline())

        # Incrustar la ventana del terminal en el contenedor
        window = QWindow.fromWinId(term_id)
        self.container = self.createWindowContainer(window, self.term_container)
        
        layout1.addWidget(self.container)
        
    
        self.tab_widget.addTab(tab1, tab_name)

    def create_tab2(self, tab_name):
        tab2 = QtWidgets.QWidget()
        layout2 = QtWidgets.QVBoxLayout()
        tab2.setLayout(layout2)

        # Crear un QLabel para mostrar el nombre del archivo
        self.image_label = QtWidgets.QLabel()
        layout2.addWidget(self.image_label)

        # Crear la vista de gráficos para mostrar la imagen
        self.graphics_view = QGraphicsView()
        self.graphics_view.setRenderHint(QtGui.QPainter.Antialiasing)
        self.graphics_view.setDragMode(QGraphicsView.ScrollHandDrag)  # Permitir desplazamiento de la imagen
        layout2.addWidget(self.graphics_view)

        # Crear la escena donde se añadirá la imagen
        self.graphics_scene = QGraphicsScene(self)
        self.graphics_view.setScene(self.graphics_scene)

        # Botones de navegación
        nav_layout = QtWidgets.QHBoxLayout()
        self.prev_button = QtWidgets.QPushButton('←')
        self.next_button = QtWidgets.QPushButton('→')
        self.prev_button.clicked.connect(self.show_prev_image)
        self.next_button.clicked.connect(self.show_next_image)
        nav_layout.addWidget(self.prev_button)
        nav_layout.addWidget(self.next_button)
        layout2.addLayout(nav_layout)

        # Botón para recargar las imágenes
        self.reload_button = QtWidgets.QPushButton('Reload')
        self.reload_button.clicked.connect(self.reload_images)
        layout2.addWidget(self.reload_button)

        # Botones de zoom
        zoom_layout = QtWidgets.QHBoxLayout()
        self.zoom_in_button = QtWidgets.QPushButton('Zoom In')
        self.zoom_out_button = QtWidgets.QPushButton('Zoom Out')
        self.zoom_in_button.clicked.connect(self.zoom_in)
        self.zoom_out_button.clicked.connect(self.zoom_out)
        zoom_layout.addWidget(self.zoom_in_button)
        zoom_layout.addWidget(self.zoom_out_button)
        layout2.addLayout(zoom_layout)

        self.tab_widget.addTab(tab2, tab_name)

        self.current_image_index = -1
        self.image_files = []
        self.load_images()


    def show_image(self):
        if 0 <= self.current_image_index < len(self.image_files):
            image_path = self.image_files[self.current_image_index]
            pixmap = QPixmap(image_path)
            self.graphics_scene.clear()  # Limpiar la escena antes de cargar la nueva imagen
            self.graphics_scene.addPixmap(pixmap)
            self.graphics_view.fitInView(self.graphics_scene.itemsBoundingRect(), Qt.KeepAspectRatio)  # Ajustar la imagen a la vista

            # Actualizar el QLabel con la ruta completa del archivo (carpeta/nombre de archivo)
            self.image_label.setText(f"Mostrando imagen: {image_path}")
        else:
            self.graphics_scene.clear()
            self.image_label.setText("No hay imagen para mostrar")



    def zoom_in(self):
        self.graphics_view.scale(1.2, 1.2)  # Aumenta la escala en 20%

    def zoom_out(self):
        self.graphics_view.scale(0.8, 0.8)  # Disminuye la escala en 20%

    def show_prev_image(self):
        if self.current_image_index > 0:
            self.current_image_index -= 1
            self.show_image()

    def show_next_image(self):
        if self.current_image_index < len(self.image_files) - 1:
            self.current_image_index += 1
            self.show_image()

    def reload_images(self):
        self.load_images()
        if self.image_files:
            self.current_image_index = 0
            self.show_image()
        else:
            self.graphics_scene.clear()

    def load_images(self):
        results_folder = 'Results'
        self.image_files.clear()  # Limpiar la lista de imágenes antes de recargar
        for root, dirs, files in os.walk(results_folder):
            for file in files:
                if file.endswith('.png'):
                    self.image_files.append(os.path.join(root, file))
        if self.image_files:
            self.current_image_index = 0
            self.show_image()

    def create_tables(self, grid):
        # Primera tabla
        data1 = self.data["table1"]
        column_order1 = ['Flux', 'Coef Flux', 'Width', 'Coef Width', 'Shift', 'Coef Shift','On/Off']
        table1 = QtWidgets.QTableWidget(self)
        table1.setRowCount(61)
        table1.setColumnCount(7)
        horHeaders1 = []
        for n, key in enumerate(column_order1):
            horHeaders1.append(key)
            for m, item in enumerate(data1[key]):
                newitem = QtWidgets.QTableWidgetItem(item)
                table1.setItem(m, n, newitem)
                
        for row in range(len(data1['Flux'])):
            for col, key in enumerate(column_order1):
                if key == 'On/Off':  # Columna de casillas de verificación
                    checkbox = QtWidgets.QCheckBox()
                    checkbox.setChecked(data1[key][row] == '1')  # Configurar el estado de la casilla
                    table1.setCellWidget(row, col, checkbox)
                else:  # Otras columnas
                    item = QtWidgets.QTableWidgetItem(data1[key][row])
                    table1.setItem(row, col, item)
   
        table1.setHorizontalHeaderLabels(horHeaders1)
        vertHeaders1 = ['CII 2326.44', 'NIV 2423.83', 'OII 2471.03','AlII 2669.04', 'OIII 2672.04', 'Mg II A','Mg II B *','OIII 3133.70','HeI 3188.67','NV 3346.82','NV 3426.84','FeII 3587.34','HeI 3588.30','OII 3728.48','FeVII 3759.99','NeIII 3869.85','HeI 3889.74','H8','NeIII 3968.58','H epsilon','FeV 4072.39','SiII 4073.63','H delta','H delta NC','H gamma','H gamma NC','OIII NC 4363','HeI 4472','HeII 4685','HeII 4685 NC','H beta BC','H beta NC','OIII 4959 NC *','OIII 4959 SB *','OIII 5007','OIII 5007 SB *','FeVII 5160','FeVI 5177','NI 5200 NC','HeII 5875','HeII 5875 NC *','FeVII 6086 NC','OI 6300 NC','OI 6365 NC','NII 6548 NC *','NII 6583 NC *','H alpha BC','H alpha NC','SII 6717 NC','SII 6717 SB','SII 6731 NC','SII 6732 SB','MgII A extra','MgII B extra','H alpha extra','H beta extra', 'HeI 7067.20','ArIII 7138','OII 7321', 'NiIII 7892','FeXI 7894']
        table1.setVerticalHeaderLabels(vertHeaders1)
        table1.resizeColumnsToContents()
        table1.resizeRowsToContents()
        grid.addWidget(table1, 0, 0)
        self.table1 = table1

        # Subgrid vertical para tabla 2 y tabla 3
        subgrid_vertical_2_3 = QtWidgets.QVBoxLayout()

        # Segunda tabla
        data2 = self.data["table2"]
        column_order2 = ['Norm Template', 'Coef Norm Template','Width','Coef Width','Shift','Coef Shift','On/Off']
        table2 = QtWidgets.QTableWidget(self)
        table2.setRowCount(2)
        table2.setColumnCount(7)
        horHeaders2 = []
        for n, key in enumerate(column_order2):
            horHeaders2.append(key)
            for m, item in enumerate(data2[key]):
                newitem = QtWidgets.QTableWidgetItem(item)
                table2.setItem(m, n, newitem)
        for row in range(len(data2['Norm Template'])):
            for col, key in enumerate(column_order2):
                if key == 'On/Off':  # Columna de casillas de verificación
                    checkbox = QtWidgets.QCheckBox()
                    checkbox.setChecked(data2[key][row] == '1')  # Configurar el estado de la casilla
                    
                    table2.setCellWidget(row, col, checkbox)
                else:  # Otras columnas
                    item = QtWidgets.QTableWidgetItem(data2[key][row])
                    table2.setItem(row, col, item)        
        table2.setHorizontalHeaderLabels(horHeaders2)
        vertHeaders2 = ['FeII', 'FeII opt']
        table2.setVerticalHeaderLabels(vertHeaders2)
        table2.resizeColumnsToContents()
        table2.resizeRowsToContents()
        subgrid_vertical_2_3.addWidget(table2)
        self.table2 = table2

        # Espacio de separación
        subgrid_vertical_2_3.addSpacing(20)

        # Tercera tabla
        data3 = self.data["table3"]
        column_order3 = ['Norm', 'Coef Norm', 'Slope 1', 'Step Slope 1', 'Slope 2', 'Step Slope 2', 'Wave Break', 'Step Wave Break','On/Off','On/Off BPL','Reference Wave PW']
        table3 = QtWidgets.QTableWidget(self)
        table3.setRowCount(1)
        table3.setColumnCount(11)
        horHeaders3 = []
        for n, key in enumerate(column_order3):
            horHeaders3.append(key)
            for m, item in enumerate(data3[key]):
                newitem = QtWidgets.QTableWidgetItem(item)
                table3.setItem(m, n, newitem)
        for row in range(len(data3['Norm'])):
            for col, key in enumerate(column_order3):
                if key == 'On/Off':  # Columna de casillas de verificación
                    checkbox = QtWidgets.QCheckBox()
                    checkbox.setChecked(data3[key][row] == '1')  # Configurar el estado de la casilla
                    
                    table3.setCellWidget(row, col, checkbox)
                elif key == 'On/Off BPL': 
                    checkbox = QtWidgets.QCheckBox()
                    checkbox.setChecked(data3[key][row] == '1')
                    table3.setCellWidget(row, col, checkbox)
                else:  # Otras columnas
                    item = QtWidgets.QTableWidgetItem(data3[key][row])
                    table3.setItem(row, col, item)        
        table3.setHorizontalHeaderLabels(horHeaders3)
        vertHeaders3 = ['Powerlaw']
        table3.setVerticalHeaderLabels(vertHeaders3)
        table3.resizeColumnsToContents()
        table3.resizeRowsToContents()
        subgrid_vertical_2_3.addWidget(table3)
        self.table3 = table3

        # Agregar subgrid vertical de tablas 2 y 3 al grid principal
        grid.addLayout(subgrid_vertical_2_3, 1, 0)
        
        # Sexta tabla
        
        # Tercera tabla
        data6 = self.data["table6"]
        column_order6 = ['Flux','Coef Flux','FWHM HOBL','On/Off']
        table6 = QtWidgets.QTableWidget(self)
        table6.setRowCount(2)
        table6.setColumnCount(4)
        horHeaders6 = []
        for n, key in enumerate(column_order6):
            horHeaders6.append(key)
            for m, item in enumerate(data6[key]):
                newitem = QtWidgets.QTableWidgetItem(item)
                table6.setItem(m, n, newitem)
        for row in range(len(data6['Flux'])):
            for col, key in enumerate(column_order6):
                if key == 'On/Off':  # Columna de casillas de verificación
                    checkbox = QtWidgets.QCheckBox()
                    checkbox.setChecked(data6[key][row] == '1')  # Configurar el estado de la casilla
                    
                    table6.setCellWidget(row, col, checkbox)
                else:  # Otras columnas
                    item = QtWidgets.QTableWidgetItem(data6[key][row])
                    table6.setItem(row, col, item)                
        table6.setHorizontalHeaderLabels(horHeaders6)
        vertHeaders6 = ['Balmer Continuum','High-O Balmer Lines']
        table6.setVerticalHeaderLabels(vertHeaders6)
        table6.resizeColumnsToContents()
        table6.resizeRowsToContents()
        subgrid_vertical_2_3.addWidget(table6)
        self.table6 = table6
        
        #Tabla 7 stellar continuum
        
        data7 = self.data["table7"]
        column_order7 = ['Flux','Coef Flux','Width','Coef Width','Reference Absorption Line','On/Off']
        table7 = QtWidgets.QTableWidget(self)
        table7.setRowCount(1)
        table7.setColumnCount(6)
        horHeaders7 = []
        for n, key in enumerate(column_order7):
            horHeaders7.append(key)
            for m, item in enumerate(data7[key]):
                newitem = QtWidgets.QTableWidgetItem(item)
                table7.setItem(m, n, newitem)
        for row in range(len(data7['Flux'])):
            for col, key in enumerate(column_order7):
                if key == 'On/Off':  # Columna de casillas de verificación
                    checkbox = QtWidgets.QCheckBox()
                    checkbox.setChecked(data7[key][row] == '1')  # Configurar el estado de la casilla
                    
                    table7.setCellWidget(row, col, checkbox)
                else:  # Otras columnas
                    item = QtWidgets.QTableWidgetItem(data7[key][row])
                    table7.setItem(row, col, item)                
        table7.setHorizontalHeaderLabels(horHeaders7)
        vertHeaders7 = ['Stellar Continuum']
        table7.setVerticalHeaderLabels(vertHeaders7)
        table7.resizeColumnsToContents()
        table7.resizeRowsToContents()
        subgrid_vertical_2_3.addWidget(table7)
        self.table7 = table7

        # Cuarta tabla
        data4 = self.data["table4"]
        column_order4 = ['Input Files']
        table4 = QtWidgets.QTableWidget(self)
        table4.setRowCount(20)
        table4.setColumnCount(1)
        horHeaders4 = []
        for n, key in enumerate(column_order4):
            horHeaders4.append(key)
            for m, item in enumerate(data4[key]):
                if m in (7,14):  # Filas con el botón de examinar
                    container = QtWidgets.QWidget()
                    hbox = QtWidgets.QHBoxLayout(container)
                    line_edit = QtWidgets.QLineEdit(item)
                    line_edit.setReadOnly(True)
                    button = QtWidgets.QPushButton()
                    magnifying_glass_icon = QIcon.fromTheme("search")
                    button.setIcon(magnifying_glass_icon)  # Establecer el icono de la lupa
                    button.setIconSize(QtCore.QSize(12, 12))  # Ajustar el tamaño del icono
                    button.clicked.connect(lambda _, le=line_edit, row=m: self.select_file(le, row))
                    hbox.addWidget(line_edit)
                    hbox.addWidget(button)
                    tick_label = QtWidgets.QLabel()  # Etiqueta para el tick
                    hbox.addWidget(tick_label)
                    table4.setCellWidget(m, n, container)
                    if m == 0:
                        self.object_file_tick_label = tick_label  # Guardar la referencia de la etiqueta
                        self.object_file_line_edit = line_edit  # Guardar la referencia
                        self.object_file_tick_label = tick_label  # Guardar la referencia de la etiqueta
                        self.object_file_line_edit = line_edit  # Guardar la referencia
                else:
                    newitem = QtWidgets.QTableWidgetItem(item)
                    table4.setItem(m, n, newitem)
        table4.setHorizontalHeaderLabels(horHeaders4)
        vertHeaders4 = ['Object','Redshift','FluxNorm Factor', 'FeII temp file', 'Size FeII temp','FeII opt file ','FeII opt Size', 'Spectrum file', 'Spectrum size', 'Balmer Cont File','Size BCF','High-O BLF','Size HOBLF','Stellar Cont Name','Stellar Cont File','Size Stellar Cont File','Output file', 'Output all', 'Error Output file','Output CSV ']
        table4.setVerticalHeaderLabels(vertHeaders4)
        table4.resizeColumnsToContents()
        table4.resizeRowsToContents()
        # Subgrid vertical para tabla 4 y tabla 5
        self.table4 = table4

        # Quinta tabla
        data5 = self.data["table5"]
        column_order5 = ['Input']
        table5 = QtWidgets.QTableWidget(self)
        table5.setRowCount(4)
        table5.setColumnCount(1)
        horHeaders5 = []
        for n, key in enumerate(column_order5):
            horHeaders5.append(key)
            for m, item in enumerate(data5[key]):
                newitem = QtWidgets.QTableWidgetItem(item)
                table5.setItem(m, n, newitem)
        table5.setHorizontalHeaderLabels(horHeaders5)
        vertHeaders5 = ['Iteration Max MCMC', 'Ile Accuracy Loop','i1', 'Profile Model']
        table5.setVerticalHeaderLabels(vertHeaders5)
        table5.resizeColumnsToContents()
        table5.resizeRowsToContents()
        self.table5 = table5

        grid.setColumnStretch(0, 1)
        grid.setColumnStretch(1, 1)
        grid.setRowStretch(0, 1)
        grid.setRowStretch(1, 1)
        # Subgrid vertical para tabla 4 y tabla 5
        subgrid_vertical = QtWidgets.QGridLayout()
    
        # Agregar tabla 4 a la izquierda
        subgrid_vertical.addWidget(self.table4, 0, 0)

        # Agregar tabla 5 a la derecha
        subgrid_vertical.addWidget(self.table5, 0, 1)

        # Agregar subgrid vertical al grid principal
        grid.addLayout(subgrid_vertical, 0, 1)
        # Cola para mostrar archivos CSV
        self.csv_viewer = QtWidgets.QTableWidget()
        self.csv_viewer.setRowCount(0)
        self.csv_viewer.setColumnCount(0)
        grid.addWidget(self.csv_viewer, 1, 1)
        
    def select_file(self, line_edit, row):
        options = QtWidgets.QFileDialog.Options()
        file_name, _ = QtWidgets.QFileDialog.getOpenFileName(self, "Seleccionar archivo", "", "Text Files (*.txt);; Dat Files (*.dat)", options=options)
        if file_name.endswith(('.txt', '.dat')):
            file_name_only = file_name.split('/')[-1]  
            shortened_file_name = (file_name_only[:5] + '...') if len(file_name_only) > 5 else file_name_only
            line_edit.setText(shortened_file_name)
            if row == 7:
                with open(file_name, 'r') as file:
                    num_lines = sum(1 for _ in file)
                
                num_lines=num_lines-1
                
               # Actualizar la fila 7 con el número de líneas
                self.table4.item(8, 0).setText(str(num_lines))
                self.table4.item(0, 0).setText(str(file_name_only))
                
            if row == 14:   
                with open(file_name, 'r') as file:
                    num_lines_stellar=sum(1 for _ in file)
                    
                num_lines_stellar=num_lines_stellar
                self.table4.item(15,0).setText(str(num_lines_stellar))
                self.table4.item(13, 0).setText(str(file_name_only))
            tick_label = self.table4.cellWidget(row, 0).layout().itemAt(2).widget()  # Etiqueta de la celda correspondiente
            tick_label.setText('✓')  # Mostrar tick
            tick_label.setStyleSheet('color: green')
        else:
            QtWidgets.QMessageBox.warning(self, "Error", "Solo se permiten archivos .txt o .dat")

    def load_csv(self):
        options = QtWidgets.QFileDialog.Options()
        file_name, _ = QtWidgets.QFileDialog.getOpenFileName(self, "Seleccionar archivo CSV", "", "CSV Files (*.csv)", options=options)
        if file_name:
            with open(file_name, 'r') as file:
                reader = csv.reader(file)
                headers = next(reader)
                
                if 'Spectrum Size' not in headers:
                    headers.append('Spectrum Size')
                    add_spectrum_size= True
                else:
                    add_spectrum_size= False
                    
                rows=[]
                for row_data in reader:
                    
                    object_file_name=row_data[0]
                    #print(row_data[0])
                    object_file_path = os.path.join('Objects File', object_file_name)
                    spectrum_size = 'N/A'
                    
                    if os.path.exists(object_file_path):
                        with open(object_file_path, 'r') as obj_file:
                            spectrum_size=sum(1 for _ in obj_file)
                    
                    if add_spectrum_size:
                        row_data.append(str(spectrum_size))
                    else:
                        row_data[headers.index('Spectrum Size')]=str(spectrum_size)
                    rows.append(row_data)
                    
                self.csv_viewer.setColumnCount(len(headers))
                self.csv_viewer.setHorizontalHeaderLabels(headers)
                self.csv_viewer.setRowCount(0)
                
                for row_data in rows:
                    row = self.csv_viewer.rowCount()
                    self.csv_viewer.insertRow(row)
                    for column, data in enumerate(row_data):
                        self.csv_viewer.setItem(row, column, QtWidgets.QTableWidgetItem(data))

            self.csv_loaded = True  
            self.csv_file_path = file_name  
            
            with open(file_name ,'w', newline='') as file:
                writer= csv.writer(file)
                writer.writerow(headers)
                writer.writerows(rows)
            QtWidgets.QMessageBox.warning(self,"Guardar CSV", f"El archivo {file_name} ha sido actualizado con la columna 'Spectrum Size'.")    
        else:
            QtWidgets.QMessageBox.warning(self, "Error", "No se seleccionó ningún archivo")

    def save_data(self):
        data = {
            "table1": self.get_table_data(self.table1),
            "table2": self.get_table_data(self.table2),
            "table3": self.get_table_data(self.table3),
            "table4": self.get_table_data(self.table4, is_table4=True),
            "table5": self.get_table_data(self.table5),
            "table6": self.get_table_data(self.table6),
            "table7": self.get_table_data(self.table7)
        }
         
        for row in range(len(data["table1"]['On/Off'])):
            checkbox = self.table1.cellWidget(row, 6)
            if checkbox:  
                data["table1"]['On/Off'][row] = '1' if checkbox.isChecked() else '0'
        for row in range(len(data["table2"]['On/Off'])):
            checkbox = self.table2.cellWidget(row, 6)
            if checkbox:  
                data["table2"]['On/Off'][row] = '1' if checkbox.isChecked() else '0'        
        for row in range(len(data["table3"]['On/Off'])):
            checkbox = self.table3.cellWidget(row, 8)
            if checkbox:  
                data["table3"]['On/Off'][row] = '1' if checkbox.isChecked() else '0' 
        for row in range(len(data["table3"]['On/Off BPL'])):
            checkbox = self.table3.cellWidget(row, 9)
            if checkbox:  
                data["table3"]['On/Off BPL'][row] = '1' if checkbox.isChecked() else '0'         
        for row in range(len(data["table6"]['On/Off'])):
            checkbox = self.table6.cellWidget(row, 3)
            if checkbox:  
                data["table6"]['On/Off'][row] = '1' if checkbox.isChecked() else '0'  
        for row in range(len(data["table7"]['On/Off'])):
            checkbox = self.table7.cellWidget(row, 5)
            if checkbox:  
                data["table7"]['On/Off'][row] = '1' if checkbox.isChecked() else '0'        
        save_data_to_file(self.data_file, data)
        #object_file_name = self.table4.cellWidget(0, 0).layout().itemAt(0).widget().text()
        #if object_file_name:
            #object_file_name = object_file_name.rsplit('.', 1)[0]
            #save_file_path = object_file_name + '.json'
            #save_file_path = os.path.join('Objects Data', object_file_name + '.json')
        #else:
            #save_file_path = self.data_file
            
        #os.makedirs('Objects Data', exist_ok=True) 
        #save_data(save_file_path, data)
        QtWidgets.QMessageBox.information(self, "Guardar datos", f"Datos guardados exitosamente en {self.data_file}.")
        
    def save_data_csv(self):
        if not self.csv_loaded:
            QtWidgets.QMessageBox.warning(self, "Error", "Primero debe cargar un archivo CSV antes de ejecutar esta función.")
            return

        data = {
            "table1": self.get_table_data(self.table1),
            "table2": self.get_table_data(self.table2),
            "table3": self.get_table_data(self.table3),
            "table4": self.get_table_data(self.table4, is_table4=True),
            "table5": self.get_table_data(self.table5),
            "table6": self.get_table_data(self.table6),
            "table7": self.get_table_data(self.table7)
        }
        save_data_to_file(self.data_file_csv, data)
        
        try:
            subprocess.run([sys.executable, 'convertion.py', self.csv_file_path], check=True)
        except subprocess.CalledProcessError as e:
            QtWidgets.QMessageBox.critical(self, "Error de ejecución", f"El script no se pudo ejecutar.\nError: {e}")

    
    def get_table_data(self, table, is_table4=False):
        data = {}
        for column in range(table.columnCount()):
            key = table.horizontalHeaderItem(column).text()
            data[key] = []
            for row in range(table.rowCount()):
                if is_table4 and row in (7,14):  # Filas con el botón de examinar
                    item = table.cellWidget(row, column).layout().itemAt(0).widget()
                    if item is not None:
                        data[key].append(item.text())
                    else:
                        data[key].append('')
                else:
                    item = table.item(row, column)
                    if item is not None:
                        data[key].append(item.text())
                    else:
                        data[key].append('')
        return data
    def show_wait_dialog(self):
        self.wait_dialog = QtWidgets.QDialog(self)
        self.wait_dialog.setWindowTitle("Process Running")
        self.wait_dialog.setModal(True)
        self.wait_dialog.setLayout(QtWidgets.QVBoxLayout())
        self.wait_dialog.layout().addWidget(QtWidgets.QLabel("Please, wait..."))
        self.wait_dialog.setFixedSize(300, 100)
        self.wait_dialog.show()

    def close_wait_dialog(self):
        if self.wait_dialog:
            self.wait_dialog.close()

    def run_script(self):
        self.show_wait_dialog()
        self.script_runner = ScriptRunner('convertionindv.py')
        self.script_runner.finished.connect(self.on_script_finished)
        self.script_runner.start()

    def run_script_individual(self):
        self.show_wait_dialog()
        self.script_runner = ScriptRunner('convbigindividual.py')
        self.script_runner.finished.connect(self.on_script_finished)
        self.script_runner.start()

    def on_script_finished(self, success, message):
        self.close_wait_dialog()
        if success:
            QtWidgets.QMessageBox.information(self, "Sucessfull execution", message)
        else:
            QtWidgets.QMessageBox.critical(self, "There was an error executing the procees, please check the print", message)
          
        
def load_data(file_path):
    try:
        with open(file_path, 'r') as file:
            return json.load(file)
    except (FileNotFoundError, json.JSONDecodeError):
        return None

def save_data_to_file(file_path, data):
    with open(file_path, 'w') as file:
        json.dump(data, file, indent=4)

def set_permissions_recursive(folder):
    for root, dirs, files in os.walk(folder):
        for d in dirs:
            os.chmod(os.path.join(root, d), 0o755)
        for f in files:
            os.chmod(os.path.join(root, f), 0o755)

def main():
    app = QtWidgets.QApplication(sys.argv)
    w = PrettyWidget()
    w.show()
    sys.exit(app.exec())

if __name__ == '__main__':
    main()


# In[ ]:




