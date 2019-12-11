# PD Proyecto final

Este repositorio contiene los archivos e instrucciones para crear un pipline con la base de datos [The Museum of MOdern Art(MoMA)](https://github.com/MuseumofModernArt/collection). 

### MOMA

-- Aquí va la descripción de la base de datos --


Es necesario tomar en cuenta los siguientes puntos, para poder correr el proyecto:
	
* Para asegurarnos del correcto funcionamiento de los comandos, es necesario contar con la maquina virtual [Vagrant](https://github.com/ITAM-DS/programming-for-data-science-2019). En el link puedes encontrar más información.
* Tener este repositorio clonado de forma local en tu computadora.
* Seguir las instrucciones para crear el ambiente virtual y ocupar los archivos de python.


Una vez conectado a tu maquina virtual debes clonar este repositorio, para ello debes utilizar el siguiente comando

```
git clone https://github.com/Mari29ku/PDS_Proyecto_final
```

Posicionarte en la carpeta donde se encuentra el repositorio y cambiarte a la carpeta `bin`. 

```
cd bin
```

En la carpeta `bin` se encuentra el archivo  `descarga_moma.sh` con este, se realiza la descarga de los datos. Para poder correrlo es necesario seguir las siguientes instrucciones:

1. Asignar permisos al archivo
```
 chmod +x descarga_moma.sh
```

2. Ejecutar
```
./descarga_moma.sh
```

Los datos descargados se encuentrar en la carpeta `data`. Ahora, procederemos con la creación del ambiente virtual. Cambiate a la carpeta `MOMA` con 

```
cd ../MOMA
```

Los siguientes comandos crean el ambiente virtual, se lo asignan a la carpeta `MOMA` e instala las dependencias necesarias. Corre estos comandos para obtener lo antes descrito.

```
pyenv virtualenv 3.7.3 MOMA 
echo MOMA>.python-version 
pip install poetry 
poetry install
```

Ahora que tenemos todas las cofiguraciones necesarias y los datos, procedemos con la creación de la base de datos, para ello, usaremos PostgreSQL. Ejecuta los siguientes comandos. 


1. Conectar a postgres
```
sudo su postgres
```
2. Ejecutar
```
psql
```
3. Finalmente corremos las siguientes lineas para crear la base de datos, el rol y asignar los permisos necesarios.
```
CREATE DATABASE moma WITH ENCODING='UTF8' LC_CTYPE='en_US.UTF-8' LC_COLLATE='en_US.UTF-8' OWNER=postgres TEMPLATE=template0 CONNECTION LIMIT=-1;
create role moma login ;
alter role moma with encrypted password 'moma_final';
grant all privileges on database moma to moma;
```
4. Regresar al shell original (ejecutar 2 veces)
```
ctrl + d
```

En este punto ya tenemos los datos, el ambiente virtual y la base de datos SQL. Ahora estamos listos para realizar las transformaciones.

Ubicados en la carpeta `MOMA` vamos a correr el script ` moma.py`. Si ejecutas 

```
python moma.py
```
Se despliegan los comandos que se pueden seelecionar:
  	* create-raw-tables
 	* create-schemas
  	* load-moma
  	* to-cleaned
  	* to-semantic

-- Estoy pensando que poner aquí --


### Referencias

1. La base de datos [MoMA](https://github.com/MuseumofModernArt/collection) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3558822.svg)](https://doi.org/10.5281/zenodo.3558822)
