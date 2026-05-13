# -*- coding: utf-8 -*-
#!/usr/bin/env python


import matplotlib #Se agregan para que python en PW no se queje

import matplotlib.pyplot as plt
from matplotlib import rc
import matplotlib.gridspec as gridspec
from scipy import stats
import numpy as np
import math as math
from io import StringIO 
#from StringIO import StringIO
from glob import glob


#File name
spectrum = 'fitting_data_full2.dat'

#Redshift
z=0.012

#ASCII spectra file
f=open('%s' %spectrum,'r')
d=f.read()
f.close()  
spec = np.genfromtxt(StringIO(d)) #Defino arreglo


xi_lim=min(spec[:,0])
xf_lim=max(spec[:,0])
l_ref=1854.7159


#Defino la longitud de onda de las lineas de emision
em_lines = np.array([2326.44, 2423.83, 2471.03, 2669.95, 2672.04, 2796.35, 2803.53, 3133.70, 3188.67, 3346.82, 3426.84, 3587.34, 3588.30, 3728.48, 3759.99, 3869.85, 3889.74, 3890.15, 3968.58 ,3971.20 ,4072.39, 4073.63,4862.68, 4960.3, 5008.24, 5100,5160.33, 5177.48, 4687.02,  4102.89, 4341.68, 5877.29, 6302.05, 6365.54, 6549.85, 6564.61, 6585.28, 6718.29, 6732.67, 7067.20])

abs_lines = np.array([3934.77, 3969.588, 4305.61, 5176.7, 5895.6]) #8500.36, 8544.44, 8664.52

#Abro archivo de sdss, van den berk
f2 = open('sdss_spec.txt','r')
d2 = f2.read()
f2.close()
spec2 = np.genfromtxt(StringIO(d2))
wave_sdss = spec2[:,0]
flux_sdss = spec2[:,1]


#######   FUNCIONES   ####################

#Funcion que lee archivo
def openfile(filen):
 f=open('%s' %filen,'r')
 d=f.read()
 f.close()
 dt=np.genfromtxt(StringIO(d)) #Defino arreglo
 tam = np.size(dt[:,1])
 return(dt)




############################## Comienza grafica
gs = gridspec.GridSpec(2, 1, height_ratios=[3, 1], left=0.06, right=0.98, top=0.96, bottom=0.06, hspace=0.0) #Define los espacios a considerar en los margenes y entre los diversos panels

plt.rcParams.update({'font.size': 13}) #cambia el tamaño de la letra de todo el archivo.

rc('text', usetex=False)
rc('font', family='serif') #Formato de la letra a usar
rc('figure', figsize=(15,10)) #tamaño de la grafica
rc('axes',linewidth=1.4) #Ancho de las lineas de los margenes
fig = plt.figure()

lineas = len(spec[:,0])
cols = len(spec[0,:])
print('cols:%s' %cols)



####### PANEL SUPERIOR
ax = fig.add_subplot(gs[0])


#scaled_flux = spec[:, 1] / np.max(spec[:, 1])*8 #anajis

#Grafico lineas en emision
for k in np.arange(len(em_lines)):
 plt.axvline(x=em_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='0.5')

for k in np.arange(len(abs_lines)):
 plt.axvline(x=abs_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='r')


plt.plot(spec[:,0], spec[:,1], color='0.5') #anajis: lo cambie por el escalado
for k in np.arange(cols):
 if k==3:
  plt.plot(spec[:,0], spec[:,k], lw=0.8, color='b', linestyle='--') #Modelo
 if k==4:
  plt.plot(spec[:,0], spec[:,k], lw=0.8, color='c', linestyle='-') #broken powerlaw
 if k==5:
  plt.plot(spec[:,0], spec[:,k], lw=0.8, color='c', linestyle='-') #simple powerlaw
 if k>=7:
  plt.plot(spec[:,0], spec[:,k]+spec[:,4], lw=1)
 if k==69:
  plt.plot(spec[:,0], spec[:,k], lw=1.2, color='m', linestyle='-') #stellar template

plt.legend()

plt.tick_params(which='major', direction='in', length=13, width=1.0, bottom='True',top='True')
plt.tick_params(which='minor', direction='in', length=7, width=0.8, bottom='True',top='True')


plt.text(0.85, 0.85, r'${\bf z=%s}$' %z, transform=ax.transAxes, fontsize=14)

plt.xlim(min(spec[:,0])-200, max(spec[:,0])+200)
plt.ylabel(r'$F_{\lambda}$')



###### PANEL INFERIOR RESIDUALS
ax5 = fig.add_subplot(gs[1]) #Hb residuals

residual = spec[:,1]-spec[:,3]
std_residual = np.std(residual) 

plt.plot(spec[:,0], residual, color='0.4', linewidth=1.5)
#Grafico lineas en emision
for k in np.arange(len(em_lines)):
 plt.axvline(x=em_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='0.5')

plt.axhline(y=std_residual, linestyle='--',linewidth=0.8, color='r')
plt.axhline(y=-std_residual, linestyle='--',linewidth=0.8, color='r')
plt.axhline(y=0, linestyle=':',linewidth=0.8, color='k')

plt.xlim(min(spec[:,0])-200, max(spec[:,0])+200)
plt.ylim(-3*std_residual, 3*std_residual)

plt.xlabel(r'$\lambda_{\rm rest-frame} \, {\rm (\AA)} $ ')
plt.ylabel(r'$\Delta F _{\lambda}$')

plt.tick_params(which='major', direction='in', length=13, width=1.0, bottom='True',top='True')
plt.tick_params(which='minor', direction='in', length=7, width=0.8, bottom='True',top='True')

plt.savefig('plot_fit_full.png')



########################################################

####### *** ESPECTRO SIN CONTINUO OPTICO *** #################


gs = gridspec.GridSpec(2, 1, height_ratios=[3, 1], left=0.06, right=0.98, top=0.96, bottom=0.06, hspace=0.0) #Define los espacios a considerar en los margenes y entre los diversos panels

plt.rcParams.update({'font.size': 13}) #cambia el tamaño de la letra de todo el archivo.

rc('text', usetex=False)
rc('font', family='serif') #Formato de la letra a usar
rc('figure', figsize=(16,8)) #tamaño de la grafica
rc('axes',linewidth=1.4) #Ancho de las lineas de los margenes
fig = plt.figure()

lineas = len(spec[:,0])
cols = len(spec[0,:])



####### PANEL SUPERIOR
ax = fig.add_subplot(gs[0])

#Grafico lineas en emision
for k in np.arange(len(em_lines)):
 plt.axvline(x=em_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='0.5')
for k in np.arange(len(abs_lines)):
 plt.axvline(x=abs_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='r')


plt.plot(spec[:,0], spec[:,1]-spec[:,4]-spec[:,5], color='0.5')
for k in np.arange(cols):
 if k==3:
  plt.plot(spec[:,0], spec[:,k]-spec[:,4]-spec[:,5], lw=1, color='m', alpha=0.8, linestyle='--') #Modelo
 if k>=6  and k!=69:
  plt.plot(spec[:,0], spec[:,k], lw=1, alpha=0.8)


plt.legend()

plt.tick_params(which='major', direction='in', length=13, width=1.0, bottom='True',top='True')
plt.tick_params(which='minor', direction='in', length=7, width=0.8, bottom='True',top='True')

#plt.text(0.85, 0.85, r'%s' %name, transform=ax.transAxes, fontsize=14)

plt.xlim(min(spec[:,0])-200, max(spec[:,0])+200)
#plt.ylim(-1, max(spec[:,1]-spec[:,4])+2)
plt.ylabel(r'$F_{\lambda}$')

#plt.axhline(y=0, xmin=0, xmax=1, linestyle='-',linewidth=2.5, color='k')


###### PANEL INFERIOR RESIDUALS
ax5 = fig.add_subplot(gs[1]) #Hb residuals

residual = spec[:,1]-spec[:,3]
std_residual = np.std(residual) 

plt.plot(spec[:,0], residual, color='0.4', linewidth=1.5)
#Grafico lineas en emision
for k in np.arange(len(em_lines)):
 plt.axvline(x=em_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='0.5')
for k in np.arange(len(abs_lines)):
 plt.axvline(x=abs_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='r')


plt.axhline(y=std_residual, linestyle='--',linewidth=0.8, color='r')
plt.axhline(y=-std_residual, linestyle='--',linewidth=0.8, color='r')
plt.axhline(y=0, linestyle=':',linewidth=0.8, color='k')

plt.xlim(min(spec[:,0])-200, max(spec[:,0])+200)
plt.ylim(-3*std_residual, 3*std_residual)

plt.xlabel(r'$\lambda_{\rm rest-frame} \, {\rm (\AA)} $ ')
plt.ylabel(r'$\Delta F _{\lambda}$')

plt.tick_params(which='major', direction='in', length=13, width=1.0, bottom='True',top='True')
plt.tick_params(which='minor', direction='in', length=7, width=0.8, bottom='True',top='True')

plt.savefig('plot_fit_full5_nocont.png')
plt.cla()


#####################

## HB



gs = gridspec.GridSpec(2, 1, height_ratios=[3, 1], left=0.06, right=0.98, top=0.96, bottom=0.06, hspace=0.0) #Define los espacios a considerar en los margenes y entre los diversos panels

plt.rcParams.update({'font.size': 13}) #cambia el tamaño de la letra de todo el archivo.

rc('text', usetex=False)
rc('font', family='serif') #Formato de la letra a usar
rc('figure', figsize=(16,8)) #tamaño de la grafica
rc('axes',linewidth=1.4) #Ancho de las lineas de los margenes
fig = plt.figure()

lineas = len(spec[:,0])
cols = len(spec[0,:])



####### PANEL SUPERIOR
ax = fig.add_subplot(gs[0])


#Grafico lineas en emision
for k in np.arange(len(em_lines)):
 plt.axvline(x=em_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='0.5')
for k in np.arange(len(abs_lines)):
 plt.axvline(x=abs_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='r')


plt.plot(spec[:,0], spec[:,1]-spec[:,4]-spec[:,5], color='0.5')
for k in np.arange(cols):
 if k==3:
  plt.plot(spec[:,0], spec[:,k]-spec[:,4]-spec[:,5], lw=1, color='m', alpha=0.8, linestyle='-')
 if k>=6  and k!=69:
  plt.plot(spec[:,0], spec[:,k], lw=1, alpha=0.8)


plt.legend()

plt.tick_params(which='major', direction='in', length=13, width=1.0, bottom='True',top='True')
plt.tick_params(which='minor', direction='in', length=7, width=0.8, bottom='True',top='True')

#plt.text(0.85, 0.85, r'%s' %name, transform=ax.transAxes, fontsize=14)

plt.xlim(3850,5200)
#plt.ylim(-1, max(spec[:,1]-spec[:,4])+2)
plt.ylabel(r'$F_{\lambda}$')

#plt.axhline(y=0, xmin=0, xmax=1, linestyle='-',linewidth=2.5, color='k')


###### PANEL INFERIOR RESIDUALS
ax5 = fig.add_subplot(gs[1]) #Hb residuals

residual = spec[:,1]-spec[:,3]
std_residual = np.std(residual) 

plt.plot(spec[:,0], residual, color='0.4', linewidth=1.5)
#Grafico lineas en emision
for k in np.arange(len(em_lines)):
 plt.axvline(x=em_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='0.5')
for k in np.arange(len(abs_lines)):
 plt.axvline(x=abs_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='r')


plt.axhline(y=std_residual, linestyle='--',linewidth=0.8, color='r')
plt.axhline(y=-std_residual, linestyle='--',linewidth=0.8, color='r')
plt.axhline(y=0, linestyle=':',linewidth=0.8, color='k')

plt.xlim(3850,5200)
plt.ylim(-3*std_residual, 3*std_residual)

plt.xlabel(r'$\lambda_{\rm rest-frame} \, {\rm (\AA)} $ ')
plt.ylabel(r'$\Delta F _{\lambda}$')

plt.tick_params(which='major', direction='in', length=13, width=1.0, bottom='True',top='True')
plt.tick_params(which='minor', direction='in', length=7, width=0.8, bottom='True',top='True')

plt.savefig('plot_fit_full_hb.png')





########################################################

## Halpha



#gs = gridspec.GridSpec(2, 1, height_ratios=[3, 1], left=0.06, right=0.98, top=0.96, bottom=0.06, hspace=0.0) #Define los espacios a considerar en los margenes y entre los diversos panels
#
#plt.rcParams.update({'font.size': 13}) #cambia el tamaño de la letra de todo el archivo.
#
#rc('text', usetex=False)
#rc('font', family='serif') #Formato de la letra a usar
#rc('figure', figsize=(16,8)) #tamaño de la grafica
#rc('axes',linewidth=1.4) #Ancho de las lineas de los margenes
#fig = plt.figure()
#
#lineas = len(spec[:,0])
#cols = len(spec[0,:])
#
#
#
# PANEL SUPERIOR
#ax = fig.add_subplot(gs[0])
#
#
#Grafico lineas en emision
#for k in np.arange(len(em_lines)):
# plt.axvline(x=em_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='0.5')
#for k in np.arange(len(abs_lines)):
# plt.axvline(x=abs_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='r')
#
#
#plt.plot(spec[:,0], spec[:,1]-spec[:,4]-spec[:,5], color='0.5')
#for k in np.arange(cols):
# if k==3:
#  plt.plot(spec[:,0], spec[:,k]-spec[:,4]-spec[:,5], lw=1, color='m', alpha=0.8, linestyle='-')
# if k>7 and k!=69:
#  plt.plot(spec[:,0], spec[:,k], lw=1, alpha=0.8)
#
#plt.legend()
#
#plt.tick_params(which='major', direction='in', length=13, width=1.0, bottom='True',top='True')
#plt.tick_params(which='minor', direction='in', length=7, width=0.8, bottom='True',top='True')
#
#plt.text(0.85, 0.85, r'%s' %name, transform=ax.transAxes, fontsize=14)
#
#plt.xlim(5800, max(spec[:,0]))
#plt.ylim(-1, max(spec[:,1]-spec[:,4])+2)
#plt.ylabel(r'$F_{\lambda}$')
#
#plt.axhline(y=0, xmin=0, xmax=1, linestyle='-',linewidth=2.5, color='k')
#
#
# PANEL INFERIOR RESIDUALS
#ax5 = fig.add_subplot(gs[1]) #Hb residuals
#
#residual = spec[:,1]-spec[:,3]
#std_residual = np.std(residual) 
#
#plt.plot(spec[:,0], residual, color='0.4', linewidth=1.5)
#Grafico lineas en emision
#for k in np.arange(len(em_lines)):
# plt.axvline(x=em_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='0.5')
#for k in np.arange(len(abs_lines)):
# plt.axvline(x=abs_lines[k], ymin=0, ymax=1, linestyle=':',linewidth=0.9, color='r')
#
#plt.axhline(y=std_residual, linestyle='--',linewidth=0.8, color='r')
#plt.axhline(y=-std_residual, linestyle='--',linewidth=0.8, color='r')
#plt.axhline(y=0, linestyle=':',linewidth=0.8, color='k')
#
#plt.xlim(5800, max(spec[:,0]))
#plt.ylim(-3*std_residual, 3*std_residual)
#
#plt.xlabel(r'$\lambda_{\rm rest-frame} \, {\rm (\AA)} $ ')
#plt.ylabel(r'$\Delta F _{\lambda}$')
#
#plt.tick_params(which='major', direction='in', length=13, width=1.0, bottom='True',top='True')
#plt.tick_params(which='minor', direction='in', length=7, width=0.8, bottom='True',top='True')
#
#plt.savefig('plot_fit_full_ha.png')
#plt.show()
