#!/usr/bin/env python
# coding: utf-8

# In[ ]:

#Este codigo solo modifica cada vez que se corre la semilla del archivo de fortran
from matplotlib import rc
import matplotlib.gridspec as gridspec
from scipy import stats
import numpy as np
import math as math
try:
    import StringIO
except ImportError:
    from io import StringIO
import os, sys, stat
from glob import glob
import matplotlib.pyplot as plt
import csv
import shutil
import subprocess
import random

# Busco los archivos Fortran
files = glob('mg2+hb2.f')

# Ordeno por nombre
files = np.sort(files)

# Palabras a buscar
buscar_idum = 'idum ='

# Reemplazo palabra
for k in np.arange(np.size(files)):
    # Genero nuevas semillas aleatorias
    idum_value = random.randint(-2000, -1)

    # Palabras a reemplazar
    reemplazar_idum = 'idum = %s' % idum_value

    # Leo el contenido del archivo
    with open(files[k]) as f:
        newtext = f.read()

    # Reemplazo las líneas correspondientes
    newtext = newtext.replace(buscar_idum + ' -10', reemplazar_idum)

    # Escribo el archivo de nuevo
    with open(files[k], 'w') as f:
        f.write(newtext)

