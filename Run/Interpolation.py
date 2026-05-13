#!/usr/bin/env python
# coding: utf-8

# In[4]:
#Este codigo basicamente interpola todos los archivos entre espectros y templates. Curiosamente sucede que el balmer continuo se extiende hasta el extremo del archivo a pesar de tener el mismo tamaño y paso que el espectro, y si uno quita eso, se pone un poco mas normal pero tampoco es perfecto, se ve shifted respecto a donde deberia terminar lo que generar error donde choca con la template de FeIII. Ademas estuvimos probando distintas templates de balmer continuo pero todas dan raro, recomiendo ajustar esto, debe estar pasando algo en el fortran pero no pille que pasa.


import os
import pandas as pd
import numpy as np
import os.path
import matplotlib.pyplot as plt
import seaborn as sns
from astropy.time import Time
from astropy.io import fits
from datetime import date, datetime, timedelta
import shutil
from glob import glob
from io import StringIO 
import os, sys, stat
from glob import glob
from matplotlib import rc
import matplotlib as matp


#################################
#Funcion que lee archivo
def openfile(filen):
    f=open('%s' %filen,'r')
    d=f.read()
    f.close()
    dt=np.genfromtxt(StringIO(d)) #Defino arreglo
    tam = np.size(dt[:,1])
    return(dt)
#################################
#Datos del espectro

b = openfile('spectrum_000000000.txt')
w_spec = b[:,0]
f_spec = b[:,1]
#f_err_spec = b[:,2]

#################################

#Datos de la template estelar
st = openfile('stellartemp.txt')
w_st =st[:,0]
f_st =st[:,1]

#datos template FeII UV

uv_temp = openfile('mdqsofit.dat')
uv_temp_w = uv_temp[:,0]
uv_temp_f = uv_temp[:,1]

#datos template FeII UV-OPTICO

opt_temp = openfile('dqsofit_optm.dat')
opt_temp_w = opt_temp[:,0]
opt_temp_f = opt_temp[:,1]
 
x_min = int(min(w_spec))
x_max = int(max(w_spec))
x_len = len(w_spec)

#Defino los parametros para la interpolación con un paso constante
step = 1.0 #Paso para el nuevo arreglo
len_x_new = int(((x_max-x_min)/step)+1) #Longitud del nuevo arreglo
x_new = np.linspace(x_min, x_max, len_x_new)


#Abro ciclo para crear el valor de y interpolado
inter_f_st = np.interp(x_new, w_st, f_st)


#Mando los resultados a un archivo
A = open('stellartemp_interpolated.dat', 'w')
for k1 in np.arange(len(x_new)):
    A.write('%.2f %.8f\n' %(x_new[k1], 1e5*inter_f_st[k1]))
A.close()

# Función para recortar los datos de las plantillas según el rango del espectro
def recortar_template(template_w, template_f, spec_min, spec_max):
    mask = (template_w >= spec_min) & (template_w <= spec_max)
    return template_w[mask], template_f[mask]

# Rango del espectro
spec_min = min(w_spec)
spec_max = max(w_spec)

# Recortar las plantillas de FeII UV
uv_temp_w_recortado, uv_temp_f_recortado = recortar_template(uv_temp_w, uv_temp_f, spec_min, spec_max)

# Guardar la plantilla FeII UV recortada en un archivo .dat
with open('feiiuvtp.dat', 'w') as file:
    for w, f in zip(uv_temp_w_recortado, uv_temp_f_recortado):
        file.write(f'{w:.2f} {f:.8f}\n')

# Recortar las plantillas de FeII UV-Óptico
opt_temp_w_recortado, opt_temp_f_recortado = recortar_template(opt_temp_w, opt_temp_f, spec_min, spec_max)

# Guardar la plantilla FeII UV-Óptico recortada en un archivo .dat
with open('feiiuvopttmp.dat', 'w') as file:
    for w, f in zip(opt_temp_w_recortado, opt_temp_f_recortado):
        file.write(f'{w:.2f} {f:.8f}\n')

# Contar líneas en los archivos recortados
num_lineas_feii_uv = len(uv_temp_w_recortado)
num_lineas_feii_opt = len(opt_temp_w_recortado)

# Contar líneas en el archivo de la plantilla estelar interpolada
num_lineas_stellartemp = len(x_new)

# Ruta al archivo input2.dat
archivo_dat1 = 'input2.dat'

# Leer el archivo y almacenar su contenido en una lista de listas
with open(archivo_dat1, 'r', encoding='utf-8') as archivo1:
    lineas = archivo1.readlines()

# Convertir las líneas en una lista de listas de elementos
datos1 = [linea.strip().split() for linea in lineas if linea.strip()]

# Reemplazar los valores en las posiciones específicas
datos1[20][0] = str(num_lineas_feii_uv-1)   # Tamaño de la plantilla recortada de FeII UV
datos1[374][0] = str(num_lineas_feii_opt-1) # Tamaño de la plantilla recortada de FeII UV-Óptico
datos1[469][0] = str(num_lineas_stellartemp-1) # Tamaño de la plantilla estelar interpolada

# Escribir los cambios en el archivo input2.dat
with open(archivo_dat1, 'w', encoding='utf-8') as archivo1:
    for linea in datos1:
        archivo1.write(' '.join(linea) + '\n')


# In[ ]:




