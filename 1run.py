#!/usr/bin/env python
# coding: utf-8

# In[ ]:


#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import os
import subprocess

# Definir el directorio base
base_dir = 'Results'

# Listar todas las carpetas dentro del directorio base
folders = [f for f in os.listdir(base_dir) if os.path.isdir(os.path.join(base_dir, f))]

# Comandos a ejecutar en cada carpeta
commands = [
    'chmod +x run',
    'python3 Interpolation.py',
    'python3 reemplazar.py',
    'gfortran mg2+hb2.f -o run',
    './run',
    'python3 plot.py'
]

# Iterar sobre cada carpeta y ejecutar los comandos
for folder in folders:
    folder_path = os.path.join(base_dir, folder)
    print(f'Working on the folder: {folder_path}')
    for command in commands:
        print(f'Executing command: {command}')
        try:
            result = subprocess.run(command, cwd=folder_path, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            print(result.stdout.decode())
        except subprocess.CalledProcessError as e:
            print(f'Error executing {command} on the folder {folder_path}')
            print(e.stderr.decode())

print('Run completed.')

