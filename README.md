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

### Postgres (o como sea) ME GUSTA MÁS ORACLE

Para crear la base de datos es necesario ejecutar los siguientes comandos

1. Conectar a postgres
```
sudo su postgres
```
2. Ejecutar
```
psql
```
3. Finalmente corremos las siguientes lineas para crear la base de datos y el rol
```
CREATE DATABASE moma WITH ENCODING='UTF8' LC_CTYPE='en_US.UTF-8' LC_COLLATE='en_US.UTF-8' OWNER=postgres TEMPLATE=template0 CONNECTION LIMIT=-1;
create role moma login ;
alter role moma with encrypted password 'moma_final';
grant all privileges on database moma to moma;
```
4. Regresar al cmd original (ejecutar 2 veces)
```
ctrl + d
```



### Referencias

1. La base de datos [MoMA](https://github.com/MuseumofModernArt/collection) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3558822.svg)](https://doi.org/10.5281/zenodo.3558822)
