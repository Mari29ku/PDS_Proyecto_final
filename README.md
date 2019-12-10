# PD Proyecto final

Este repositorio contiene los archivos e instrucciones para crear un pipline con la base de datos [The Museum of MOdern Art(MoMA)](https://github.com/MuseumofModernArt/collection). 

### MOMA

-- Aquí va la descripción de la base de datos --

En la carpeta `bin` se encuentra el archivo  `descarga_moma.sh` con este se realiza la descarga de los datos. Para poder correrlo es necesario seguir las siguientes instrucciones:

1. Asignar permisos al archivo
```
 chmod +x descarga_moma.sh
```

2. Ejecutar
```
./descarga_moma.sh
```

### Ambiente virtual

Para crear el ambiente virtual cambiate a la carpeta `MOMA` con 

```
cd MOMA
```

Ahora corre los siguientes comandos para crear el ambiente virtual.

```
pyenv virtualenv 3.7.3 MOMA 
echo MOMA>.python-version 
pip install poetry 
poetry install
```

### Referencias

1. La base de datos [MoMA](https://github.com/MuseumofModernArt/collection) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3558822.svg)](https://doi.org/10.5281/zenodo.3558822)
