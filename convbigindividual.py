#!/usr/bin/env python
# coding: utf-8

# In[4]:



import json
import os
import shutil
# Definir una función para mostrar un mensaje
def mostrar_mensaje(titulo, mensaje):
    app = QtWidgets.QApplication(sys.argv)
    QtWidgets.QMessageBox.warning(None, titulo, mensaje)
    app.exec_()

# Ruta al archivo JSON
archivo_json = 'data.json'

# Abre el archivo y carga su contenido
with open(archivo_json, 'r', encoding='utf-8') as archivo:
    datos = json.load(archivo)

    # Crear directorio "Results" si no existe
if not os.path.exists("Results"):
    os.makedirs("Results")

    # Verificar si la carpeta "Objects File" existe
objects_data_folder = "Objects File"
if not os.path.exists(objects_data_folder):
    mostrar_mensaje("Error", f"No se encontró la carpeta '{objects_data_folder}'.")
    sys.exit() 
stellar_templates_folder = "Stellar Templates"
if not os.path.exists(stellar_templates_folder):
    mostrar_mensaje("Error", f"No se encontró la carpeta '{stellar_templates_folder}'.")
    sys.exit() 

#Code Part    
iterr=datos["table5"]["Input"][0] #1
ile=datos["table5"]["Input"][1]#2
specname=datos["table4"]["Input Files"][0]#3
specsize=datos["table4"]["Input Files"][8]#4
outfile=datos["table4"]["Input Files"][16]#5
outall=datos["table4"]["Input Files"][17]#6
errout=datos["table4"]["Input Files"][18]#7
redshift=datos["table4"]["Input Files"][1]#8
i1=datos["table5"]["Input"][2]#9
profile=datos["table5"]["Input"][3]#10

#PW table
pwnorm=datos["table3"]["Norm"][0] #11
pwcoefnorm=datos["table3"]["Coef Norm"][0] #12
pwslope1=datos["table3"]["Slope 1"][0]#13
pwstep1=datos["table3"]["Step Slope 1"][0]#14
pwslope2=datos["table3"]["Slope 2"][0]#15
pwstep2=datos["table3"]["Step Slope 2"][0]#16
wavebreak=datos["table3"]["Wave Break"][0] #17
stepwave=datos["table3"]["Step Wave Break"][0] #18

#Fe templates
Fe2file=datos["table4"]["Input Files"][3]#19
Fe2size=datos["table4"]["Input Files"][4]#20
Fe2norm=datos["table2"]["Norm Template"][0] #21
Fe2coefnorm=datos["table2"]["Coef Norm Template"][0] #22
Fe2width=datos["table2"]["Width"][0] #23
Fe2coefwidth=datos["table2"]["Coef Width"][0] #24
Fe2shift=datos["table2"]["Shift"][0] #25
Fe2coefshift=datos["table2"]["Coef Shift"][0] #26

#Element parameters pipipi

#CII 2326.44

FluxCII=datos["table1"]["Flux"][0] #27
CoefFluxCII=datos["table1"]["Coef Flux"][0] #28
WidthCII=datos["table1"]["Width"][0] #29
CoefWidthCII=datos["table1"]["Coef Width"][0] #30
ShiftCII=datos["table1"]["Shift"][0] #31
CoefShiftCII=datos["table1"]["Coef Shift"][0] #32

#NIV 2423.83

FluxNIV=datos["table1"]["Flux"][1] #33
CoefFluxNIV=datos["table1"]["Coef Flux"][1] #34
WidthNIV=datos["table1"]["Width"][1] #35
CoefWidthNIV=datos["table1"]["Coef Width"][1] #36
ShiftNIV=datos["table1"]["Shift"][1] #37
CoefShiftNIV=datos["table1"]["Coef Shift"][1] #38

#OII 2471.03

FluxOII=datos["table1"]["Flux"][2] #39
CoefFluxOII=datos["table1"]["Coef Flux"][2] #40
WidthOII=datos["table1"]["Width"][2] #41
CoefWidthOII=datos["table1"]["Coef Width"][2] #42
ShiftOII=datos["table1"]["Shift"][2] #43
CoefShiftOII=datos["table1"]["Coef Shift"][2] #44

# AlII 2669.04

FluxAlII=datos["table1"]["Flux"][3] #45
CoefFluxAlII=datos["table1"]["Coef Flux"][3] #46
WidthAlII=datos["table1"]["Width"][3] #47
CoefWidthAlII=datos["table1"]["Coef Width"][3] #48
ShiftAlII=datos["table1"]["Shift"][3] #49
CoefShiftAlII=datos["table1"]["Coef Shift"][3] #50

#OIII 2672.04

FluxOIII26=datos["table1"]["Flux"][4] #27
CoefFluxOIII26=datos["table1"]["Coef Flux"][4] #28
WidthOIII26=datos["table1"]["Width"][4] #29
CoefWidthOIII26=datos["table1"]["Coef Width"][4] #30
ShiftOIII26=datos["table1"]["Shift"][4] #31
CoefShiftOIII26=datos["table1"]["Coef Shift"][4] #32f

#Mg A

FluxMGA=datos["table1"]["Flux"][5] #27
CoefFluxMGA=datos["table1"]["Coef Flux"][5] #28
WidthMGA=datos["table1"]["Width"][5] #29
CoefWidthMGA=datos["table1"]["Coef Width"][5] #30
ShiftMGA=datos["table1"]["Shift"][5] #31
CoefShiftMGA=datos["table1"]["Coef Shift"][5] #32

#Mg B

FluxMGB=datos["table1"]["Flux"][6] #27
CoefFluxMGB=datos["table1"]["Coef Flux"][6] #28
WidthMGB=datos["table1"]["Width"][6] #29
CoefWidthMGB=datos["table1"]["Coef Width"][6] #30
ShiftMGB=datos["table1"]["Shift"][6] #31
CoefShiftMGB=datos["table1"]["Coef Shift"][6] #32

#OIII 3133.70

FluxOIII31=datos["table1"]["Flux"][7] #27
CoefFluxOIII31=datos["table1"]["Coef Flux"][7] #28
WidthOIII31=datos["table1"]["Width"][7] #29
CoefWidthOIII31=datos["table1"]["Coef Width"][7] #30
ShiftOIII31=datos["table1"]["Shift"][7] #31
CoefShiftOIII31=datos["table1"]["Coef Shift"][7] #32

#HeI 3188.67

FluxHeI31=datos["table1"]["Flux"][8] #27
CoefFluxHeI31=datos["table1"]["Coef Flux"][8] #28
WidthHeI31=datos["table1"]["Width"][8] #29
CoefWidthHeI31=datos["table1"]["Coef Width"][8] #30
ShiftHeI31=datos["table1"]["Shift"][8] #31
CoefShiftHeI31=datos["table1"]["Coef Shift"][8] #32

#NV 3346.82

FluxNV33=datos["table1"]["Flux"][9] #27
CoefFluxNV33=datos["table1"]["Coef Flux"][9] #28
WidthNV33=datos["table1"]["Width"][9] #29
CoefWidthNV33=datos["table1"]["Coef Width"][9] #30
ShiftNV33=datos["table1"]["Shift"][9] #31
CoefShiftNV33=datos["table1"]["Coef Shift"][9] #32

#NV 3426

FluxNV34=datos["table1"]["Flux"][10] #27
CoefFluxNV34=datos["table1"]["Coef Flux"][10] #28
WidthNV34=datos["table1"]["Width"][10] #29
CoefWidthNV34=datos["table1"]["Coef Width"][10] #30
ShiftNV34=datos["table1"]["Shift"][10] #31
CoefShiftNV34=datos["table1"]["Coef Shift"][10] #32

#FeII 3587.34

FluxFeII=datos["table1"]["Flux"][11] #27
CoefFluxFeII=datos["table1"]["Coef Flux"][11] #28
WidthFeII=datos["table1"]["Width"][11] #29
CoefWidthFeII=datos["table1"]["Coef Width"][11] #30
ShiftFeII=datos["table1"]["Shift"][11] #31
CoefShiftFeII=datos["table1"]["Coef Shift"][11] #32

#HeI 3588.30

FluxHeI35=datos["table1"]["Flux"][12] #27
CoefFluxHeI35=datos["table1"]["Coef Flux"][12] #28
WidthHeI35=datos["table1"]["Width"][12] #29
CoefWidthHeI35=datos["table1"]["Coef Width"][12] #30
ShiftHeI35=datos["table1"]["Shift"][12] #31
CoefShiftHeI35=datos["table1"]["Coef Shift"][12] #32

#OII 3728.48

FluxOII37=datos["table1"]["Flux"][13] #27
CoefFluxOII37=datos["table1"]["Coef Flux"][13] #28
WidthOII37=datos["table1"]["Width"][13] #29
CoefWidthOII37=datos["table1"]["Coef Width"][13] #30
ShiftOII37=datos["table1"]["Shift"][13] #31
CoefShiftOII37=datos["table1"]["Coef Shift"][13] #32

#FeVII 3759.99

FluxFeVII37=datos["table1"]["Flux"][14] #27
CoefFluxFeVII37=datos["table1"]["Coef Flux"][14] #28
WidthFeVII37=datos["table1"]["Width"][14] #29
CoefWidthFeVII37=datos["table1"]["Coef Width"][14] #30
ShiftFeVII37=datos["table1"]["Shift"][14] #31
CoefShiftFeVII37=datos["table1"]["Coef Shift"][14] #32

#NeIII 3869.85

FluxNeIII38=datos["table1"]["Flux"][15] #27
CoefFluxNeIII38=datos["table1"]["Coef Flux"][15] #28
WidthNeIII38=datos["table1"]["Width"][15] #29
CoefWidthNeIII38=datos["table1"]["Coef Width"][15] #30
ShiftNeIII38=datos["table1"]["Shift"][15] #31
CoefShiftNeIII38=datos["table1"]["Coef Shift"][15] #32

#HeI 3889.74

FluxHeI38=datos["table1"]["Flux"][16] #27
CoefFluxHeI38=datos["table1"]["Coef Flux"][16] #28
WidthHeI38=datos["table1"]["Width"][16] #29
CoefWidthHeI38=datos["table1"]["Coef Width"][16] #30
ShiftHeI38=datos["table1"]["Shift"][16] #31
CoefShiftHeI38=datos["table1"]["Coef Shift"][16] #32

#H8

FluxH8=datos["table1"]["Flux"][17] #27
CoefFluxH8=datos["table1"]["Coef Flux"][17] #28
WidthH8=datos["table1"]["Width"][17] #29
CoefWidthH8=datos["table1"]["Coef Width"][17] #30
ShiftH8=datos["table1"]["Shift"][17] #31
CoefShiftH8=datos["table1"]["Coef Shift"][17] #32

#NeIII 3968.58

FluxNeIII39=datos["table1"]["Flux"][18] #27
CoefFluxNeIII39=datos["table1"]["Coef Flux"][18] #28
WidthNeIII39=datos["table1"]["Width"][18] #29
CoefWidthNeIII39=datos["table1"]["Coef Width"][18] #30
ShiftNeIII39=datos["table1"]["Shift"][18] #31
CoefShiftNeIII39=datos["table1"]["Coef Shift"][18] #32


#H-epsilon

FluxHep=datos["table1"]["Flux"][19] #27
CoefFluxHep=datos["table1"]["Coef Flux"][19] #28
WidthHep=datos["table1"]["Width"][19] #29
CoefWidthHep=datos["table1"]["Coef Width"][19] #30
ShiftHep=datos["table1"]["Shift"][19] #31
CoefShiftHep=datos["table1"]["Coef Shift"][19] #32

#FeV

FluxFeV=datos["table1"]["Flux"][20] #27
CoefFluxFeV=datos["table1"]["Coef Flux"][20] #28
WidthFeV=datos["table1"]["Width"][20] #29
CoefWidthFeV=datos["table1"]["Coef Width"][20] #30
ShiftFeV=datos["table1"]["Shift"][20] #31
CoefShiftFeV=datos["table1"]["Coef Shift"][20] #32

#SiII

FluxSiII=datos["table1"]["Flux"][21] #27
CoefFluxSiII=datos["table1"]["Coef Flux"][21] #28
WidthSiII=datos["table1"]["Width"][21] #29
CoefWidthSiII=datos["table1"]["Coef Width"][21] #30
ShiftSiII=datos["table1"]["Shift"][21] #31
CoefShiftSiII=datos["table1"]["Coef Shift"][21] #32

#H-delta

FluxHdelta=datos["table1"]["Flux"][22] #27
CoefFluxHdelta=datos["table1"]["Coef Flux"][22] #28
WidthHdelta=datos["table1"]["Width"][22] #29
CoefWidthHdelta=datos["table1"]["Coef Width"][22] #30
ShiftHdelta=datos["table1"]["Shift"][22] #31
CoefShiftHdelta=datos["table1"]["Coef Shift"][22] #32

#H-delta NC

FluxHdeltaNC=datos["table1"]["Flux"][23] #27
CoefFluxHdeltaNC=datos["table1"]["Coef Flux"][23] #28
WidthHdeltaNC=datos["table1"]["Width"][23] #29
CoefWidthHdeltaNC=datos["table1"]["Coef Width"][23] #30
ShiftHdeltaNC=datos["table1"]["Shift"][23] #31
CoefShiftHdeltaNC=datos["table1"]["Coef Shift"][23] #32

#H-gamma

FluxHgamma=datos["table1"]["Flux"][24] #27
CoefFluxHgamma=datos["table1"]["Coef Flux"][24] #28
WidthHgamma=datos["table1"]["Width"][24] #29
CoefWidthHgamma=datos["table1"]["Coef Width"][24] #30
ShiftHgamma=datos["table1"]["Shift"][24] #31
CoefShiftHgamma=datos["table1"]["Coef Shift"][24] #32

#H-gamma NC

FluxHgammaNC=datos["table1"]["Flux"][25] #27
CoefFluxHgammaNC=datos["table1"]["Coef Flux"][25] #28
WidthHgammaNC=datos["table1"]["Width"][25] #29
CoefWidthHgammaNC=datos["table1"]["Coef Width"][25] #30
ShiftHgammaNC=datos["table1"]["Shift"][25] #31
CoefShiftHgammaNC=datos["table1"]["Coef Shift"][25] #32

#OIII NC 4363

FluxOIIINC43=datos["table1"]["Flux"][26] #27
CoefFluxOIIINC43=datos["table1"]["Coef Flux"][26] #28
WidthOIIINC43=datos["table1"]["Width"][26] #29
CoefWidthOIIINC43=datos["table1"]["Coef Width"][26] #30
ShiftOIIINC43=datos["table1"]["Shift"][26] #31
CoefShiftOIIINC43=datos["table1"]["Coef Shift"][26] #32

#HeI 4472

FluxHeI44=datos["table1"]["Flux"][27] #27
CoefFluxHeI44=datos["table1"]["Coef Flux"][27] #28
WidthHeI44=datos["table1"]["Width"][27] #29
CoefWidthHeI44=datos["table1"]["Coef Width"][27] #30
ShiftHeI44=datos["table1"]["Shift"][27] #31
CoefShiftHeI44=datos["table1"]["Coef Shift"][27] #32

#HeII 4685

FluxHeII46=datos["table1"]["Flux"][28] #27
CoefFluxHeII46=datos["table1"]["Coef Flux"][28] #28
WidthHeII46=datos["table1"]["Width"][28] #29
CoefWidthHeII46=datos["table1"]["Coef Width"][28] #30
ShiftHeII46=datos["table1"]["Shift"][28] #31
CoefShiftHeII46=datos["table1"]["Coef Shift"][28] #32

#HeII 4685 NC

FluxHeII46NC=datos["table1"]["Flux"][29] #27
CoefFluxHeII46NC=datos["table1"]["Coef Flux"][29] #28
WidthHeII46NC=datos["table1"]["Width"][29] #29
CoefWidthHeII46NC=datos["table1"]["Coef Width"][29] #30
ShiftHeII46NC=datos["table1"]["Shift"][29] #31
CoefShiftHeII46NC=datos["table1"]["Coef Shift"][29] #32

#H-Beta BC

FluxHbetaBC=datos["table1"]["Flux"][30] #27
CoefFluxHbetaBC=datos["table1"]["Coef Flux"][30] #28
WidthHbetaBC=datos["table1"]["Width"][30] #29
CoefWidthHbetaBC=datos["table1"]["Coef Width"][30] #30
ShiftHbetaBC=datos["table1"]["Shift"][30] #31
CoefShiftHbetaBC=datos["table1"]["Coef Shift"][30] #32

#H-Beta NC

FluxHbetaNC=datos["table1"]["Flux"][31] #27
CoefFluxHbetaNC=datos["table1"]["Coef Flux"][31] #28
WidthHbetaNC=datos["table1"]["Width"][31] #29
CoefWidthHbetaNC=datos["table1"]["Coef Width"][31] #30
ShiftHbetaNC=datos["table1"]["Shift"][31] #31
CoefShiftHbetaNC=datos["table1"]["Coef Shift"][31] #32

#OIII 4959 NC

FluxOIII49NC=datos["table1"]["Flux"][32] #27
CoefFluxOIII49NC=datos["table1"]["Coef Flux"][32] #28
WidthOIII49NC=datos["table1"]["Width"][32] #29
CoefWidthOIII49NC=datos["table1"]["Coef Width"][32] #30
ShiftOIII49NC=datos["table1"]["Shift"][32] #31
CoefShiftOIII49NC=datos["table1"]["Coef Shift"][32] #32

#OIII 4959 SB

FluxOIII49SB=datos["table1"]["Flux"][33] #27
CoefFluxOIII49SB=datos["table1"]["Coef Flux"][33] #28
WidthOIII49SB=datos["table1"]["Width"][33] #29
CoefWidthOIII49SB=datos["table1"]["Coef Width"][33] #30
ShiftOIII49SB=datos["table1"]["Shift"][33] #31
CoefShiftOIII49SB=datos["table1"]["Coef Shift"][33] #32

#OIII 5007 NC

FluxOIII50NC=datos["table1"]["Flux"][34] #27
CoefFluxOIII50NC=datos["table1"]["Coef Flux"][34] #28
WidthOIII50NC=datos["table1"]["Width"][34] #29
CoefWidthOIII50NC=datos["table1"]["Coef Width"][34] #30
ShiftOIII50NC=datos["table1"]["Shift"][34] #31
CoefShiftOIII50NC=datos["table1"]["Coef Shift"][34] #32


#OIII 5007 SB

FluxOIII50SB=datos["table1"]["Flux"][35] #27
CoefFluxOIII50SB=datos["table1"]["Coef Flux"][35] #28
WidthOIII50SB=datos["table1"]["Width"][35] #29
CoefWidthOIII50SB=datos["table1"]["Coef Width"][35] #30
ShiftOIII50SB=datos["table1"]["Shift"][35] #31
CoefShiftOIII50SB=datos["table1"]["Coef Shift"][35] #32

#FeVII 5160

FluxFeVII516=datos["table1"]["Flux"][36] #27
CoefFluxFeVII516=datos["table1"]["Coef Flux"][36] #28
WidthFeVII516=datos["table1"]["Width"][36] #29
CoefWidthFeVII516=datos["table1"]["Coef Width"][36] #30
ShiftFeVII516=datos["table1"]["Shift"][36] #31
CoefShiftFeVII516=datos["table1"]["Coef Shift"][36] #32

#FeVI 5177

FluxFeVI517=datos["table1"]["Flux"][37] #27
CoefFluxFeVI517=datos["table1"]["Coef Flux"][37] #28
WidthFeVI517=datos["table1"]["Width"][37] #29
CoefWidthFeVI517=datos["table1"]["Coef Width"][37] #30
ShiftFeVI517=datos["table1"]["Shift"][37] #31
CoefShiftFeVI517=datos["table1"]["Coef Shift"][37] #32

#NI 5200 NC

FluxNI=datos["table1"]["Flux"][38] #27
CoefFluxNI=datos["table1"]["Coef Flux"][38] #28
WidthNI=datos["table1"]["Width"][38] #29
CoefWidthNI=datos["table1"]["Coef Width"][38] #30
ShiftNI=datos["table1"]["Shift"][38] #31
CoefShiftNI=datos["table1"]["Coef Shift"][38] #32

#HeII 5875 

FluxHeII58=datos["table1"]["Flux"][39] #27
CoefFluxHeII58=datos["table1"]["Coef Flux"][39] #28
WidthHeII58=datos["table1"]["Width"][39] #29
CoefWidthHeII58=datos["table1"]["Coef Width"][39] #30
ShiftHeII58=datos["table1"]["Shift"][39] #31
CoefShiftHeII58=datos["table1"]["Coef Shift"][39] #32

#HeII 5875 NC

FluxHeII58NC=datos["table1"]["Flux"][40] #27
CoefFluxHeII58NC=datos["table1"]["Coef Flux"][40] #28
WidthHeII58NC=datos["table1"]["Width"][40] #29
CoefWidthHeII58NC=datos["table1"]["Coef Width"][40] #30
ShiftHeII58NC=datos["table1"]["Shift"][40] #31
CoefShiftHeII58NC=datos["table1"]["Coef Shift"][40] #32

#FeVII 6086 NC

FluxFeVII60NC=datos["table1"]["Flux"][41] #27
CoefFluxFeVII60NC=datos["table1"]["Coef Flux"][41] #28
WidthFeVII60NC=datos["table1"]["Width"][41] #29
CoefWidthFeVII60NC=datos["table1"]["Coef Width"][41] #30
ShiftFeVII60NC=datos["table1"]["Shift"][41] #31
CoefShiftFeVII60NC=datos["table1"]["Coef Shift"][41] #32

#OI 6300 NC

FluxOI630NC=datos["table1"]["Flux"][42] #27
CoefFluxOI630NC=datos["table1"]["Coef Flux"][42] #28
WidthOI630NC=datos["table1"]["Width"][42] #29
CoefWidthOI630NC=datos["table1"]["Coef Width"][42] #30
ShiftOI630NC=datos["table1"]["Shift"][42] #31
CoefShiftOI630NC=datos["table1"]["Coef Shift"][42] #32

#OI 6365 NC

FluxOI636NC=datos["table1"]["Flux"][43] #27
CoefFluxOI636NC=datos["table1"]["Coef Flux"][43] #28
WidthOI636NC=datos["table1"]["Width"][43] #29
CoefWidthOI636NC=datos["table1"]["Coef Width"][43] #30
ShiftOI636NC=datos["table1"]["Shift"][43] #31
CoefShiftOI636NC=datos["table1"]["Coef Shift"][43] #32

#NII 6548 NC

FluxNII654NC=datos["table1"]["Flux"][44] #27
CoefFluxNII654NC=datos["table1"]["Coef Flux"][44] #28
WidthNII654NC=datos["table1"]["Width"][44] #29
CoefWidthNII654NC=datos["table1"]["Coef Width"][44] #30
ShiftNII654NC=datos["table1"]["Shift"][44] #31
CoefShiftNII654NC=datos["table1"]["Coef Shift"][44] #32

#NII 6583 NC

FluxNII658NC=datos["table1"]["Flux"][45] #27
CoefFluxNII658NC=datos["table1"]["Coef Flux"][45] #28
WidthNII658NC=datos["table1"]["Width"][45] #29
CoefWidthNII658NC=datos["table1"]["Coef Width"][45] #30
ShiftNII658NC=datos["table1"]["Shift"][45] #31
CoefShiftNII658NC=datos["table1"]["Coef Shift"][45] #32

#H-alpha BC

FluxHalphaBC=datos["table1"]["Flux"][46] #27
CoefFluxHalphaBC=datos["table1"]["Coef Flux"][46] #28
WidthHalphaBC=datos["table1"]["Width"][46] #29
CoefWidthHalphaBC=datos["table1"]["Coef Width"][46] #30
ShiftHalphaBC=datos["table1"]["Shift"][46] #31
CoefShiftHalphaBC=datos["table1"]["Coef Shift"][46] #32

#H-alpha NC

FluxHalphaNC=datos["table1"]["Flux"][47] #27
CoefFluxHalphaNC=datos["table1"]["Coef Flux"][47] #28
WidthHalphaNC=datos["table1"]["Width"][47] #29
CoefWidthHalphaNC=datos["table1"]["Coef Width"][47] #30
ShiftHalphaNC=datos["table1"]["Shift"][47] #31
CoefShiftHalphaNC=datos["table1"]["Coef Shift"][47] #32

#SII 6717 NC

FluxSII671NC=datos["table1"]["Flux"][48] #27
CoefFluxSII671NC=datos["table1"]["Coef Flux"][48] #28
WidthSII671NC=datos["table1"]["Width"][48] #29
CoefWidthSII671NC=datos["table1"]["Coef Width"][48] #30
ShiftSII671NC=datos["table1"]["Shift"][48] #31
CoefShiftSII671NC=datos["table1"]["Coef Shift"][48] #32

#SII 6717 SB

FluxSII671SB=datos["table1"]["Flux"][49] #27
CoefFluxSII671SB=datos["table1"]["Coef Flux"][49] #28
WidthSII671SB=datos["table1"]["Width"][49] #29
CoefWidthSII671SB=datos["table1"]["Coef Width"][49] #30
ShiftSII671SB=datos["table1"]["Shift"][49] #31
CoefShiftSII671SB=datos["table1"]["Coef Shift"][49] #32

#SII 6731 NC

FluxSII673NC=datos["table1"]["Flux"][50] #27
CoefFluxSII673NC=datos["table1"]["Coef Flux"][50] #28
WidthSII673NC=datos["table1"]["Width"][50] #29
CoefWidthSII673NC=datos["table1"]["Coef Width"][50] #30
ShiftSII673NC=datos["table1"]["Shift"][50] #31
CoefShiftSII673NC=datos["table1"]["Coef Shift"][50] #32

#SII 6731 SB

FluxSII673SB=datos["table1"]["Flux"][51] #27
CoefFluxSII673SB=datos["table1"]["Coef Flux"][51] #28
WidthSII673SB=datos["table1"]["Width"][51] #29
CoefWidthSII673SB=datos["table1"]["Coef Width"][51] #30
ShiftSII673SB=datos["table1"]["Shift"][51] #31
CoefShiftSII673SB=datos["table1"]["Coef Shift"][51] #32

#MgII A extra

FluxMgIIA=datos["table1"]["Flux"][52] #27
CoefFluxMgIIA=datos["table1"]["Coef Flux"][52] #28
WidthMgIIA=datos["table1"]["Width"][52] #29
CoefWidthMgIIA=datos["table1"]["Coef Width"][52] #30
ShiftMgIIA=datos["table1"]["Shift"][52] #31
CoefShiftMgIIA=datos["table1"]["Coef Shift"][52] #32

#MgII B extra

FluxMgIIB=datos["table1"]["Flux"][53] #27
CoefFluxMgIIB=datos["table1"]["Coef Flux"][53] #28
WidthMgIIB=datos["table1"]["Width"][53] #29
CoefWidthMgIIB=datos["table1"]["Coef Width"][53] #30
ShiftMgIIB=datos["table1"]["Shift"][53] #31
CoefShiftMgIIB=datos["table1"]["Coef Shift"][53] #32

#Halpha extra

FluxHalphaextra=datos["table1"]["Flux"][54] #27
CoefFluxHalphaextra=datos["table1"]["Coef Flux"][54] #28
WidthHalphaextra=datos["table1"]["Width"][54] #29
CoefWidthHalphaextra=datos["table1"]["Coef Width"][54] #30
ShiftHalphaextra=datos["table1"]["Shift"][54] #31
CoefShiftHalphaextra=datos["table1"]["Coef Shift"][54] #32

#H-beta extra

FluxHbetaextra=datos["table1"]["Flux"][55] #27
CoefFluxHbetaextra=datos["table1"]["Coef Flux"][55] #28
WidthHbetaextra=datos["table1"]["Width"][55] #29
CoefWidthHbetaextra=datos["table1"]["Coef Width"][55] #30
ShiftHbetaextra=datos["table1"]["Shift"][55] #31
CoefShiftHbetaextra=datos["table1"]["Coef Shift"][55] #32


#more stuff of the code

OutfileCSV=datos["table4"]["Input Files"][19] #363
Balcontfile=datos["table4"]["Input Files"][9] #364
Balsize=datos["table4"]["Input Files"][10] #365
FluxBalCont= datos["table6"]["Flux"][0] #366
CoefFluxBalCont= datos["table6"]["Coef Flux"][0] #367

Highbalfile=datos["table4"]["Input Files"][11] #368
Highbalsize=datos["table4"]["Input Files"][12] #369
FluxHighBal=datos["table6"]["Flux"][1] #370
CoefFluxHighBal=datos["table6"]["Coef Flux"][1] #371
FWHMHighBal=datos["table6"]["FWHM HOBL"][1] #372

Fe2Fileopt=datos["table4"]["Input Files"][5] #373
Fe2Sizeopt=datos["table4"]["Input Files"][6] #374
Fe2normopt=datos["table2"]["Norm Template"][1] #375
Fe2coefnormopt=datos["table2"]["Coef Norm Template"][1] #376 

#Extension hasta 7800 
FluxHeI7067=datos["table1"]["Flux"][56] #378
CoefFluxHeI7067=datos["table1"]["Coef Flux"][56] 
WidthHeI7067=datos["table1"]["Width"][56] 
CoefWidthHeI7067=datos["table1"]["Coef Width"][56] 
ShiftHeI7067=datos["table1"]["Shift"][56] 
CoefShiftHeI7067=datos["table1"]["Coef Shift"][56] 

FluxArIII7138=datos["table1"]["Flux"][57] #383
CoefFluxArIII7138=datos["table1"]["Coef Flux"][57] 
WidthArIII7138=datos["table1"]["Width"][57] 
CoefWidthArIII7138=datos["table1"]["Coef Width"][57] 
ShiftArIII7138=datos["table1"]["Shift"][57] 
CoefShiftArIII7138=datos["table1"]["Coef Shift"][57] 

FluxOII7321=datos["table1"]["Flux"][58] #389
CoefFluxOII7321=datos["table1"]["Coef Flux"][58] 
WidthOII7321=datos["table1"]["Width"][58] 
CoefWidthOII7321=datos["table1"]["Coef Width"][58] 
ShiftOII7321=datos["table1"]["Shift"][58] 
CoefShiftOII7321=datos["table1"]["Coef Shift"][58] 

FluxNiIII7892=datos["table1"]["Flux"][59] #395
CoefFluxNiIII7892=datos["table1"]["Coef Flux"][59] 
WidthNiIII7892=datos["table1"]["Width"][59] 
CoefWidthNiIII7892=datos["table1"]["Coef Width"][59] 
ShiftNiIII7892=datos["table1"]["Shift"][59] 
CoefShiftNiIII7892=datos["table1"]["Coef Shift"][59] 

FluxFeXI7894=datos["table1"]["Flux"][60] #401
CoefFluxFeXI7894=datos["table1"]["Coef Flux"][60] 
WidthFeXI7894=datos["table1"]["Width"][60] 
CoefWidthFeXI7894=datos["table1"]["Coef Width"][60] 
ShiftFeXI7894=datos["table1"]["Shift"][60] 
CoefShiftFeXI7894=datos["table1"]["Coef Shift"][60] 

Onoffpw=datos["table3"]["On/Off"][0] #407
#new


Onoffhighbal=datos["table6"]["On/Off"][1] #408
Onoffbalcont=datos["table6"]["On/Off"][0]

Onofffe2opt=datos["table2"]["On/Off"][1]
Onofffe2uv=datos["table2"]["On/Off"][0]

OnoffhbetaBC=datos["table1"]["On/Off"][30]
OnoffhdeltaBC=datos["table1"]["On/Off"][22]
OnoffHgammaBC=datos["table1"]["On/Off"][24]
OnoffH8BC=datos["table1"]["On/Off"][17]
OnoffHepsilon=datos["table1"]["On/Off"][19] #416


OnoffAlIII26=datos["table1"]["On/Off"][3] #417
OnoffCII23=datos["table1"]["On/Off"][0]
OnoffMg2ABC=datos["table1"]["On/Off"][5]
OnoffOIII2672=datos["table1"]["On/Off"][4]
OnoffOIII31=datos["table1"]["On/Off"][7] #421
OnoffHeII468BC=datos["table1"]["On/Off"][28]
OnoffHeI318BC=datos["table1"]["On/Off"][8] 
OnoffHeI358BC=datos["table1"]["On/Off"][12]
OnoffHeI388BC=datos["table1"]["On/Off"][16]
OnoffHeI587BC=datos["table1"]["On/Off"][39]
OnoffHeI447BC=datos["table1"]["On/Off"][27]
OnoffHeI706BC=datos["table1"]["On/Off"][56] #428

OnoffOIII5007NC=datos["table1"]["On/Off"][34]
OnoffHBNC=datos["table1"]["On/Off"][31]
OnoffHeII468NC=datos["table1"]["On/Off"][29]
OnoffOIII463=datos["table1"]["On/Off"][26]
OnoffNI5200NC=datos["table1"]["On/Off"][38]
OnoffNeIV2423NC=datos["table1"]["On/Off"][1]
OnoffOII2471NC=datos["table1"]["On/Off"][2]
OnoffNeV3346NC=datos["table1"]["On/Off"][9]
OnoffOII3728NC=datos["table1"]["On/Off"][13]
OnoffNeIII3968NC=datos["table1"]["On/Off"][18]
OnoffNeIII3869NC=datos["table1"]["On/Off"][15] #439
OnoffFeV4072NC=datos["table1"]["On/Off"][20]
OnoffSiII4073NC=datos["table1"]["On/Off"][21]
OnoffHgammaNC=datos["table1"]["On/Off"][25]
OnoffHdeltaNC=datos["table1"]["On/Off"][23]
OnoffNeV3426NC=datos["table1"]["On/Off"][10]
OnoffFeVII3587NC=datos["table1"]["On/Off"][11]
OnoffFeVII3759NC=datos["table1"]["On/Off"][14]
OnoffFeVII5160NC=datos["table1"]["On/Off"][36]
OnoffFeVI5177NC=datos["table1"]["On/Off"][37]
OnoffFeXI7894NC=datos["table1"]["On/Off"][60]
OnoffFeVII6086NC=datos["table1"]["On/Off"][41]

OnoffHaBC=datos["table1"]["On/Off"][47] #451 
OnoffHaNC=datos["table1"]["On/Off"][48]
OnoffSII6718=datos["table1"]["On/Off"][49]
OnoffSII6732=datos["table1"]["On/Off"][51]
OnoffOI6302=datos["table1"]["On/Off"][42]
OnoffOI6365=datos["table1"]["On/Off"][43] #456 
OnoffNiIII7892=datos["table1"]["On/Off"][60]
OnoffArIII7138=datos["table1"]["On/Off"][58]
OnoffOIII7321=datos["table1"]["On/Off"][59]
OnoffHbextra=datos["table1"]["On/Off"][56]
OnoffMgextra=datos["table1"]["On/Off"][53]
OnoffOIIIextraSB=datos["table1"]["On/Off"][35]
OnoffHaextra=datos["table1"]["On/Off"][55]
OnoffSII6718extra=datos["table1"]["On/Off"][50]
OnoffSII3732extra=datos["table1"]["On/Off"][52] #465

Fe2widthOpt=datos["table2"]["Width"][1] #466
Fe2coefwidthOpt=datos["table2"]["Coef Width"][1] #467

StellContFile=datos["table4"]["Input Files"][13] #468
StellSize=datos["table4"]["Input Files"][15]
StellarFlux=datos["table7"]["Flux"][0]
StellarCoefFlux=datos["table7"]["Coef Flux"][0]
StellarWidth=datos["table7"]["Width"][0]
StellarCoefWidth=datos["table7"]["Coef Width"][0] #473
StellarRefAbsLine=datos["table7"]["Reference Absorption Line"][0]

OnoffStellar=datos["table7"]["On/Off"][0] #475
OnoffBPL=datos["table3"]["On/Off BPL"][0] #476
RefWavePW=datos["table3"]["Reference Wave PW"][0]
Fluxnormfactor=datos["table4"]["Input Files"][2] #478

file_name_with_ext = datos["table4"]["Input Files"][0]
Stell_filename = datos["table4"]["Input Files"][13]# Nombre del archivo con la extensión de la sexta columna
file_name, file_ext = os.path.splitext(file_name_with_ext)

# Verificar si el archivo existe en "Objects File"
source_file_path = os.path.join(objects_data_folder, file_name_with_ext)
source_file_path_stellar_template = os.path.join(stellar_templates_folder, Stell_filename)
if not os.path.exists(source_file_path):
    mostrar_mensaje("Error", f"No se encontró el archivo '{file_name_with_ext}' en la carpeta Objects File.")
    sys.exit()  
if not os.path.exists(source_file_path_stellar_template):
    mostrar_mensaje("Error", f"No se encontró el archivo '{Stell_filename}' en la carpeta Stellar Templates.")
    sys.exit()      

folder_path = os.path.join("Results", file_name)

# Crear la carpeta si no existe
if not os.path.exists(folder_path):
    os.makedirs(folder_path)

# Transformar el archivo .dat a .txt y moverlo
target_txt_path = os.path.join(folder_path, 'spectrum_000000000.txt')
shutil.copy2(source_file_path, folder_path)

shutil.copy2(source_file_path_stellar_template, folder_path)

# Copiar y renombrar Stell_filename como 'stellartemp.txt'
stellartemp_path = os.path.join(folder_path, 'stellartemp.txt')
shutil.copy2(source_file_path_stellar_template, stellartemp_path)
with open(source_file_path, 'r', encoding='utf-8') as source_file:
    with open(target_txt_path, 'w', encoding='utf-8') as target_file:
        for line in source_file:
            target_file.write(line)

# Copiar contenido de la carpeta "Run" a la nueva carpeta
run_folder = "Run"
for item in os.listdir(run_folder):
    s = os.path.join(run_folder, item)
    d = os.path.join(folder_path, item)
    if os.path.isdir(s):
        if os.path.exists(d):
            shutil.rmtree(d)  # Eliminar el directorio de destino si ya existe
        shutil.copytree(s, d)
    else:
        shutil.copy2(s, d)

# Ruta al archivo .dat
archivo_dat1 = 'input2.dat'

# Leer el archivo y almacenar su contenido en una lista de listas
with open(archivo_dat1, 'r', encoding='utf-8') as archivo1:
    lineas = archivo1.readlines()

# Convertir las líneas en una lista de listas de elementos
datos1 = [linea.strip().split() for linea in lineas if linea.strip()]

#Code Part
datos1[1][0] = iterr #1
datos1[2][0] = ile #2
datos1[3][0] = 'spectrum_000000000.txt' #3
datos1[4][0] = specsize #4
datos1[5][0] = outfile #5
datos1[6][0] = outall #6
datos1[7][0] = errout #7
datos1[8][0] = redshift #8
datos1[9][0] = i1 #9
datos1[10][0] = profile #10 

#Powerlaw
datos1[11][0] = pwnorm #11
datos1[12][0] = pwcoefnorm #12
datos1[13][0] = pwslope1 #13
datos1[14][0] = pwstep1 #14
datos1[15][0] = pwslope2 #15
datos1[16][0] = pwstep2 #16
datos1[17][0] = wavebreak #17
datos1[18][0] = stepwave #18

#Fe2
datos1[19][0] = 'feiiuvtp.dat' #19
datos1[20][0] = Fe2size #20
datos1[21][0] = Fe2norm #21
datos1[22][0] = Fe2coefnorm #22
datos1[23][0] = Fe2width #23
datos1[24][0] = Fe2coefwidth #24
datos1[25][0] = Fe2shift #25
datos1[26][0] = Fe2coefshift #26

#Elements parameters

#CII 2326.44

datos1[27][0] = FluxCII #27
datos1[28][0] = CoefFluxCII #28
datos1[29][0] = WidthCII #29
datos1[30][0] = CoefWidthCII #30
datos1[31][0] = ShiftCII #31
datos1[32][0] = CoefShiftCII #32

#NIV 2423.83

datos1[33][0] = FluxNIV #33
datos1[34][0] = CoefFluxNIV #34
datos1[35][0] = WidthNIV #35
datos1[36][0] = CoefWidthNIV #36
datos1[37][0] = ShiftNIV #37
datos1[38][0] = CoefShiftNIV #38

#OII 2471.03

datos1[39][0] = FluxOII #39
datos1[40][0] = CoefFluxOII #40
datos1[41][0] = WidthOII #41
datos1[42][0] = CoefWidthOII #42
datos1[43][0] = ShiftOII #43
datos1[44][0] = CoefShiftOII #44

#AlII 2669.04

datos1[45][0] = FluxAlII #45
datos1[46][0] = CoefFluxAlII #46
datos1[47][0] = WidthAlII #47
datos1[48][0] = CoefWidthAlII #48
datos1[49][0] = ShiftAlII #49
datos1[50][0] = CoefShiftAlII #50

#OIII 2672.04 

datos1[51][0] = FluxOIII26 #51
datos1[52][0] = CoefFluxOIII26 #52
datos1[53][0] = WidthOIII26 #53
datos1[54][0] = CoefWidthOIII26 #54
datos1[55][0] = ShiftOIII26 #55
datos1[56][0] = CoefShiftOIII26 #56

#MgA

datos1[57][0] = FluxMGA #57
datos1[58][0] = CoefFluxMGA #58
datos1[59][0] = WidthMGA #59
datos1[60][0] = CoefWidthMGA #60
datos1[61][0] = ShiftMGA #61
datos1[62][0] = CoefShiftMGA #62

#MgB

datos1[63][0] = FluxMGB #63
datos1[64][0] = CoefFluxMGB #64
datos1[65][0] = WidthMGB #65
datos1[66][0] = CoefWidthMGB #66
datos1[67][0] = ShiftMGB #67
datos1[68][0] = CoefShiftMGB #68

#OIII 3133.70

datos1[69][0] = FluxOIII31 #69
datos1[70][0] = CoefFluxOIII31 #70
datos1[71][0] = WidthOIII31 #71
datos1[72][0] = CoefWidthOIII31 #72
datos1[73][0] = ShiftOIII31 #73
datos1[74][0] = CoefShiftOIII31 #74

#HeI 3188.67

datos1[75][0] = FluxHeI31 #75
datos1[76][0] = CoefFluxHeI31 #76
datos1[77][0] = WidthHeI31 #77
datos1[78][0] = CoefWidthHeI31 #78
datos1[79][0] = ShiftHeI31 #79
datos1[80][0] = CoefShiftHeI31 #80

#NV 3346.82

datos1[81][0] = FluxNV33 #81
datos1[82][0] = CoefFluxNV33 #82
datos1[83][0] = WidthNV33 #83
datos1[84][0] = CoefWidthNV33 #84
datos1[85][0] = ShiftNV33 #85
datos1[86][0] = CoefShiftNV33 #86

#NV 3426.84

datos1[87][0] = FluxNV34 #87
datos1[88][0] = CoefFluxNV34 #88
datos1[89][0] = WidthNV34 #89
datos1[90][0] = CoefWidthNV34 #90
datos1[91][0] = ShiftNV34 #91
datos1[92][0] = CoefShiftNV34 #92

#FeII 3587.34

datos1[93][0] = FluxFeII #93
datos1[94][0] = CoefFluxFeII #94
datos1[95][0] = WidthFeII #95
datos1[96][0] = CoefWidthFeII #96
datos1[97][0] = ShiftFeII #97
datos1[98][0] = CoefShiftFeII #98

#HeI 3588.30

datos1[99][0] = FluxHeI35 #99
datos1[100][0] = CoefFluxHeI35 #100
datos1[101][0] = WidthHeI35 #101
datos1[102][0] = CoefWidthHeI35 #102
datos1[103][0] = ShiftHeI35 #103
datos1[104][0] = CoefShiftHeI35 #104

#OII 3728.48

datos1[105][0] = FluxOII37 #105
datos1[106][0] = CoefFluxOII37 #106
datos1[107][0] = WidthOII37 #107
datos1[108][0] = CoefWidthOII37 #108
datos1[109][0] = ShiftOII37 #109
datos1[110][0] = CoefShiftOII37 #110

#FeVII 3759.99

datos1[111][0] = FluxFeVII37 #111
datos1[112][0] = CoefFluxFeVII37 #112
datos1[113][0] = WidthFeVII37 #113
datos1[114][0] = CoefWidthFeVII37 #114
datos1[115][0] = ShiftFeVII37 #115
datos1[116][0] = CoefShiftFeVII37 #116

#NeIII 3869.85

datos1[117][0] = FluxNeIII38 #117
datos1[118][0] = CoefFluxNeIII38 #118
datos1[119][0] = WidthNeIII38 #119
datos1[120][0] = CoefWidthNeIII38 #120
datos1[121][0] = ShiftNeIII38 #121
datos1[122][0] = CoefShiftNeIII38 #122

#HeI 3889.74

datos1[123][0] = FluxHeI38 #123
datos1[124][0] = CoefFluxHeI38 #124
datos1[125][0] = WidthHeI38 #125
datos1[126][0] = CoefWidthHeI38 #126
datos1[127][0] = ShiftHeI38 #127
datos1[128][0] = CoefShiftHeI38 #128

#H8

datos1[129][0] = FluxH8 #129
datos1[130][0] = CoefFluxH8 #130
datos1[131][0] = WidthH8 #131
datos1[132][0] = CoefWidthH8 #132
datos1[133][0] = ShiftH8 #133
datos1[134][0] = CoefShiftH8 #134

#NeIII 3968.58

datos1[135][0] = FluxNeIII39 #135
datos1[136][0] = CoefFluxNeIII39 #136
datos1[137][0] = WidthNeIII39 #137
datos1[138][0] = CoefWidthNeIII39 #138
datos1[139][0] = ShiftNeIII39 #139
datos1[140][0] = CoefShiftNeIII39 #140

#H-epsilon

datos1[141][0] = FluxHep #141
datos1[142][0] = CoefFluxHep #142
datos1[143][0] = WidthHep #143
datos1[144][0] = CoefWidthHep #144
datos1[145][0] = ShiftHep #145
datos1[146][0] = CoefShiftHep #146

#FeV 4072.39

datos1[147][0] = FluxFeV #147
datos1[148][0] = CoefFluxFeV #148
datos1[149][0] = WidthFeV #149
datos1[150][0] = CoefWidthFeV #150
datos1[151][0] = ShiftFeV #151
datos1[152][0] = CoefShiftFeV #152

#SII 4073.63

datos1[153][0] = FluxSiII #153
datos1[154][0] = CoefFluxSiII #154
datos1[155][0] = WidthSiII #155
datos1[156][0] = CoefWidthSiII #156
datos1[157][0] = ShiftSiII #157
datos1[158][0] = CoefShiftSiII #158

#H-delta

datos1[159][0] = FluxHdelta #159
datos1[160][0] = CoefFluxHdelta #160
datos1[161][0] = WidthHdelta #161
datos1[162][0] = CoefWidthHdelta #162
datos1[163][0] = ShiftHdelta #163
datos1[164][0] = CoefShiftHdelta #164

#H-delta NC

datos1[165][0] = FluxHdeltaNC #165
datos1[166][0] = CoefFluxHdeltaNC #166
datos1[167][0] = WidthHdeltaNC #167
datos1[168][0] = CoefWidthHdeltaNC #168
datos1[169][0] = ShiftHdeltaNC #169
datos1[170][0] = CoefShiftHdeltaNC #170

#H-gamma

datos1[171][0] = FluxHgamma #171
datos1[172][0] = CoefFluxHgamma #172
datos1[173][0] = WidthHgamma #173
datos1[174][0] = CoefWidthHgamma #174
datos1[175][0] = ShiftHgamma #175
datos1[176][0] = CoefShiftHgamma #176

#H-gamma NC

datos1[177][0] = FluxHgammaNC #177
datos1[178][0] = CoefFluxHgammaNC #178
datos1[179][0] = WidthHgammaNC #179
datos1[180][0] = CoefWidthHgammaNC #180
datos1[181][0] = ShiftHgammaNC #181
datos1[182][0] = CoefShiftHgammaNC #182

#OIII NC 4363 

datos1[183][0] = FluxOIIINC43 #183
datos1[184][0] = CoefFluxOIIINC43 #184
datos1[185][0] = WidthOIIINC43 #185
datos1[186][0] = CoefWidthOIIINC43 #186
datos1[187][0] = ShiftOIIINC43 #187
datos1[188][0] = CoefShiftOIIINC43 #188

#HeI 4472

datos1[189][0] = FluxHeI44 #189
datos1[190][0] = CoefFluxHeI44 #190
datos1[191][0] = WidthHeI44 #191
datos1[192][0] = CoefWidthHeI44 #192
datos1[193][0] = ShiftHeI44 #193
datos1[194][0] = CoefShiftHeI44 #194

#HeII 4685

datos1[195][0] = FluxHeII46 #195
datos1[196][0] = CoefFluxHeII46 #196
datos1[197][0] = WidthHeII46 #197
datos1[198][0] = CoefWidthHeII46 #198
datos1[199][0] = ShiftHeII46 #199
datos1[200][0] = CoefShiftHeII46 #200

#HeII 4685 NC 

datos1[201][0] = FluxHeII46NC #201
datos1[202][0] = CoefFluxHeII46NC #202
datos1[203][0] = WidthHeII46NC #203
datos1[204][0] = CoefWidthHeII46NC #204
datos1[205][0] = ShiftHeII46NC #205
datos1[206][0] = CoefShiftHeII46NC #206

#Hbeta BC 

datos1[207][0] = FluxHbetaBC #207
datos1[208][0] = CoefFluxHbetaBC #208
datos1[209][0] = WidthHbetaBC #209
datos1[210][0] = CoefWidthHbetaBC #210
datos1[211][0] = ShiftHbetaBC #211
datos1[212][0] = CoefShiftHbetaBC #212

#Hbeta NC

datos1[213][0] = FluxHbetaNC #213
datos1[214][0] = CoefFluxHbetaNC #214
datos1[215][0] = WidthHbetaNC #215
datos1[216][0] = CoefWidthHbetaNC #216
datos1[217][0] = ShiftHbetaNC #217
datos1[218][0] = CoefShiftHbetaNC #218

#OIII 5007 NC

datos1[219][0] = FluxOIII50NC #219
datos1[220][0] = CoefFluxOIII50NC #220
datos1[221][0] = WidthOIII50NC #221
datos1[222][0] = CoefWidthOIII50NC #222
datos1[223][0] = ShiftOIII50NC #223
datos1[224][0] = CoefShiftOIII50NC #224

#OIII 4959 NC

datos1[225][0] = FluxOIII49NC #225
datos1[226][0] = CoefFluxOIII49NC #226
datos1[227][0] = WidthOIII49NC #227
datos1[228][0] = CoefWidthOIII49NC #228
datos1[229][0] = ShiftOIII49NC #229
datos1[230][0] = CoefShiftOIII49NC #230

#FeVII 5160

datos1[231][0] = FluxFeVII516 #231
datos1[232][0] = CoefFluxFeVII516 #232
datos1[233][0] = WidthFeVII516 #233
datos1[234][0] = CoefWidthFeVII516 #234
datos1[235][0] = ShiftFeVII516 #235
datos1[236][0] = CoefShiftFeVII516 #236

#FeVI 5177

datos1[237][0] = FluxFeVI517 #237
datos1[238][0] = CoefFluxFeVI517 #238
datos1[239][0] = WidthFeVI517 #239
datos1[240][0] = CoefWidthFeVI517 #240
datos1[241][0] = ShiftFeVI517 #241
datos1[242][0] = CoefShiftFeVI517 #242

#NI 5200 NC

datos1[243][0] = FluxNI #243
datos1[244][0] = CoefFluxNI #244
datos1[245][0] = WidthNI #245
datos1[246][0] = CoefWidthNI #246
datos1[247][0] = ShiftNI #247
datos1[248][0] = CoefShiftNI #248

#HeII 5875

datos1[249][0] = FluxHeII58 #249
datos1[250][0] = CoefFluxHeII58 #250
datos1[251][0] = WidthHeII58 #251
datos1[252][0] = CoefWidthHeII58 #252
datos1[253][0] = ShiftHeII58 #253
datos1[254][0] = CoefShiftHeII58 #254

#HeII 5875 NC

datos1[255][0] = FluxHeII58NC #255
datos1[256][0] = CoefFluxHeII58NC #256
datos1[257][0] = WidthHeII58NC #257
datos1[258][0] = CoefWidthHeII58NC #258
datos1[259][0] = ShiftHeII58NC #259
datos1[260][0] = CoefShiftHeII58NC #260

#FeVII 6086 NC

datos1[261][0] = FluxFeVII60NC #261
datos1[262][0] = CoefFluxFeVII60NC #262
datos1[263][0] = WidthFeVII60NC #263
datos1[264][0] = CoefWidthFeVII60NC #264
datos1[265][0] = ShiftFeVII60NC #265
datos1[266][0] = CoefShiftFeVII60NC #266

#OI 6300 NC

datos1[267][0] = FluxOI630NC #267
datos1[268][0] = CoefFluxOI630NC #268
datos1[269][0] = WidthOI630NC #269
datos1[270][0] = CoefWidthOI630NC #270
datos1[271][0] = ShiftOI630NC #271
datos1[272][0] = CoefShiftOI630NC #272

#OI 6365 NC

datos1[273][0] = FluxOI636NC #273
datos1[274][0] = CoefFluxOI636NC #274
datos1[275][0] = WidthOI636NC #275
datos1[276][0] = CoefWidthOI636NC #276
datos1[277][0] = ShiftOI636NC #277
datos1[278][0] = CoefShiftOI636NC #278

#NII 6548 NC

datos1[279][0] = FluxNII654NC #279
datos1[280][0] = CoefFluxNII654NC #280
datos1[281][0] = WidthNII654NC #281
datos1[282][0] = CoefWidthNII654NC #282
datos1[283][0] = ShiftNII654NC #283
datos1[284][0] = CoefShiftNII654NC #284

#NII 6583 NC

datos1[285][0] = FluxNII658NC #285
datos1[286][0] = CoefFluxNII658NC #286
datos1[287][0] = WidthNII658NC #287
datos1[288][0] = CoefWidthNII658NC #286
datos1[289][0] = ShiftNII658NC #289
datos1[290][0] = CoefShiftNII658NC #290

#H- alpha BC

datos1[291][0] = FluxHalphaBC #291
datos1[292][0] = CoefFluxHalphaBC #292
datos1[293][0] = WidthHalphaBC #293
datos1[294][0] = CoefWidthHalphaBC #294
datos1[295][0] = ShiftHalphaBC #295
datos1[296][0] = CoefShiftHalphaBC #296

#H-alpha NC

datos1[297][0] = FluxHalphaNC #297
datos1[298][0] = CoefFluxHalphaNC #298
datos1[299][0] = WidthHalphaNC #299
datos1[300][0] = CoefWidthHalphaNC #300
datos1[301][0] = ShiftHalphaNC #301
datos1[302][0] = CoefShiftHalphaNC #302

#SII 6717 NC

datos1[303][0] = FluxSII671NC #303
datos1[304][0] = CoefFluxSII671NC #304
datos1[305][0] = WidthSII671NC #305
datos1[306][0] = CoefWidthSII671NC #306
datos1[307][0] = ShiftSII671NC #307
datos1[308][0] = CoefShiftSII671NC #308

#SII 6731 NC

datos1[309][0] = FluxSII673NC #309
datos1[310][0] = CoefFluxSII673NC #310
datos1[311][0] = WidthSII673NC #311
datos1[312][0] = CoefWidthSII673NC #312
datos1[313][0] = ShiftSII673NC #313
datos1[314][0] = CoefShiftSII673NC #314

#MgII A extra

datos1[315][0] = FluxMgIIA #315
datos1[316][0] = CoefFluxMgIIA #316
datos1[317][0] = WidthMgIIA #317
datos1[318][0] = CoefWidthMgIIA #318
datos1[319][0] = ShiftMgIIA #319
datos1[320][0] = CoefShiftMgIIA #320

#MgII B extra

datos1[321][0] = FluxMgIIB #321
datos1[322][0] = CoefFluxMgIIB #322
datos1[323][0] = WidthMgIIB #323
datos1[324][0] = CoefWidthMgIIB #324
datos1[325][0] = ShiftMgIIB #325
datos1[326][0] = CoefShiftMgIIB #326

#H-beta extra

datos1[327][0] = FluxHbetaextra #327
datos1[328][0] = CoefFluxHbetaextra #328
datos1[329][0] = WidthHbetaextra #329
datos1[330][0] = CoefWidthHbetaextra #330
datos1[331][0] = ShiftHbetaextra #331
datos1[332][0] = CoefShiftHbetaextra #332

#H-alpha extra 

datos1[333][0] = FluxHalphaextra #333
datos1[334][0] = CoefFluxHalphaextra #334
datos1[335][0] = WidthHalphaextra #335
datos1[336][0] = CoefWidthHalphaextra #336
datos1[337][0] = ShiftHalphaextra #337
datos1[338][0] = CoefShiftHalphaextra #338

#OIII 5007 SB 

datos1[339][0] = FluxOIII50SB #339
datos1[340][0] = CoefFluxOIII50SB #340
datos1[341][0] = WidthOIII50SB #341
datos1[342][0] = CoefWidthOIII50SB #342
datos1[343][0] = ShiftOIII50SB #343
datos1[344][0] = CoefShiftOIII50SB #344

#OIII 4959 SB 

datos1[345][0] = FluxOIII49SB #345
datos1[346][0] = CoefFluxOIII49SB #346
datos1[347][0] = WidthOIII49SB #347
datos1[348][0] = CoefWidthOIII49SB #348
datos1[349][0] = ShiftOIII49SB #349
datos1[350][0] = CoefShiftOIII49SB #350

#SII 6717 SB

datos1[351][0] = FluxSII671SB #351
datos1[352][0] = CoefFluxSII671SB #352
datos1[353][0] = WidthSII671SB #353
datos1[354][0] = CoefWidthSII671SB #354
datos1[355][0] = ShiftSII671SB #355
datos1[356][0] = CoefShiftSII671SB #356

#SII 6732 SB 

datos1[357][0] = FluxSII673SB #357
datos1[358][0] = CoefFluxSII673SB #358
datos1[359][0] = WidthSII673SB #359
datos1[360][0] = CoefWidthSII673SB #360
datos1[361][0] = ShiftSII673SB #361
datos1[362][0] = CoefShiftSII673SB #362

#Balmer Continuum

datos1[363][0] = OutfileCSV #363
datos1[364][0] = Balcontfile #364
datos1[365][0] = Balsize #365
datos1[366][0] = FluxBalCont #366
datos1[367][0] = CoefFluxBalCont #367

#High Order Balmer Lines

datos1[368][0] = Highbalfile #368
datos1[369][0] = Highbalsize #369
datos1[370][0] = FluxHighBal #370
datos1[371][0] = CoefFluxHighBal #371
datos1[372][0] = FWHMHighBal #372

datos1[373][0] = 'feiiuvopttmp.dat' #373
datos1[374][0] = Fe2Sizeopt #374
datos1[375][0] = Fe2normopt #375
datos1[376][0] = Fe2coefnormopt #376

datos1[377][0] = FluxHeI7067 #377
datos1[378][0] = CoefFluxHeI7067 #378
datos1[379][0] = WidthHeI7067 #379
datos1[380][0] = CoefWidthHeI7067 #380
datos1[381][0] = ShiftHeI7067 #381
datos1[382][0] = CoefShiftHeI7067 #382

datos1[383][0] = FluxArIII7138 #383
datos1[384][0] = CoefFluxArIII7138 #384
datos1[385][0] = WidthArIII7138 #385
datos1[386][0] = CoefWidthArIII7138 #386
datos1[387][0] = ShiftArIII7138
datos1[388][0] = CoefShiftArIII7138 #388

datos1[389][0] = FluxOII7321 #389
datos1[390][0] = CoefFluxOII7321 #390
datos1[391][0] = WidthOII7321 #391
datos1[392][0] = CoefWidthOII7321 #392
datos1[393][0] = ShiftOII7321 #393
datos1[394][0] = CoefShiftOII7321 #394

datos1[395][0] = FluxNiIII7892 #395
datos1[396][0] = CoefFluxNiIII7892 #396
datos1[397][0] = WidthNiIII7892 #397
datos1[398][0] = CoefWidthNiIII7892 #398
datos1[399][0] = ShiftNiIII7892 #399
datos1[400][0] = CoefShiftNiIII7892 #400

datos1[401][0] = FluxFeXI7894 #401
datos1[402][0] = CoefFluxFeXI7894 #402
datos1[403][0] = WidthFeXI7894 #403
datos1[404][0] = CoefWidthFeXI7894 #404
datos1[405][0] = ShiftFeXI7894 #405
datos1[406][0] = CoefShiftFeXI7894 #406

datos1[407][0] = Onoffpw

datos1[408][0] = Onoffhighbal
datos1[409][0] = Onoffbalcont

datos1[410][0] = Onofffe2opt
datos1[411][0] = Onofffe2uv

datos1[412][0] = OnoffhbetaBC 
datos1[413][0] = OnoffhdeltaBC
datos1[414][0] = OnoffHgammaBC
datos1[415][0] = OnoffH8BC
datos1[416][0] = OnoffHepsilon

datos1[417][0] = OnoffAlIII26
datos1[418][0] = OnoffCII23
datos1[419][0] = OnoffMg2ABC
datos1[420][0] = OnoffOIII2672
datos1[421][0] = OnoffOIII31
datos1[422][0] = OnoffHeII468BC
datos1[423][0] = OnoffHeI318BC
datos1[424][0] = OnoffHeI358BC
datos1[425][0] = OnoffHeI388BC
datos1[426][0] = OnoffHeI587BC
datos1[427][0] = OnoffHeI447BC
datos1[428][0] = OnoffHeI706BC

datos1[429][0] = OnoffOIII5007NC
datos1[430][0] = OnoffHBNC
datos1[431][0] = OnoffHeII468NC
datos1[432][0] = OnoffOIII463
datos1[433][0] = OnoffNI5200NC
datos1[434][0] = OnoffNeIV2423NC
datos1[435][0] = OnoffOII2471NC
datos1[436][0] = OnoffNeV3346NC
datos1[437][0] = OnoffOII3728NC
datos1[438][0] = OnoffNeIII3968NC
datos1[439][0] = OnoffNeIII3869NC
datos1[440][0] = OnoffFeV4072NC
datos1[441][0] = OnoffSiII4073NC
datos1[442][0] = OnoffHgammaNC
datos1[443][0] = OnoffHdeltaNC
datos1[444][0] = OnoffNeV3426NC
datos1[445][0] = OnoffFeVII3587NC
datos1[446][0] = OnoffFeVII3759NC
datos1[447][0] = OnoffFeVII5160NC
datos1[448][0] = OnoffFeVI5177NC
datos1[449][0] = OnoffFeXI7894NC
datos1[450][0] = OnoffFeVII6086NC
datos1[451][0] = OnoffHaBC
datos1[452][0] = OnoffHaNC
datos1[453][0] = OnoffSII6718
datos1[454][0] = OnoffSII6732
datos1[455][0] = OnoffOI6302
datos1[456][0] = OnoffOI6365
datos1[457][0] = OnoffNiIII7892
datos1[458][0] = OnoffArIII7138
datos1[459][0] = OnoffOIII7321
datos1[460][0] = OnoffHbextra
datos1[461][0] = OnoffMgextra
datos1[462][0] = OnoffOIIIextraSB
datos1[463][0] = OnoffHaextra
datos1[464][0] = OnoffSII6718extra
datos1[465][0] = OnoffSII3732extra

datos1[466][0] = Fe2widthOpt
datos1[467][0] = Fe2coefwidthOpt

datos1[468][0] = 'stellartemp_interpolated.dat'
datos1[469][0] = StellSize
datos1[470][0] = StellarFlux
datos1[471][0] = StellarCoefFlux
datos1[472][0] = StellarWidth
datos1[473][0] = StellarCoefWidth
datos1[474][0] = StellarRefAbsLine

datos1[475][0] = OnoffStellar
datos1[476][0] = OnoffBPL
datos1[477][0] = RefWavePW
datos1[478][0] = Fluxnormfactor


#Relleno primera fila
datos
# Función para escribir los datos de vuelta en el archivo
modified_dat_path = os.path.join("Results", file_name, 'input2.dat')
with open(modified_dat_path, 'w', encoding='utf-8') as archivo_modificado:
    for fila in datos1:
        archivo_modificado.write(' '.join(fila) + '\n')


# In[ ]:




