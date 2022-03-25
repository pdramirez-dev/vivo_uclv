# VIVO dockerizado

Este proyecto crea tres contenedores dockerizados,
- `vivo` La instancia vivo
- `solr` Una instancia de solr independiente, basada en una imagen acoplable de solr
- `mariadb` Una instancia independiente de mariadb.

Estas imágenes se pueden usar juntas o de forma independiente para configurar algunas instancias acoplables de VIVO en desarrollo o en funcionamiento.

# Uso

## Ejemplo de instalación de Docker

Independientemente del uso, deberá crear las imágenes, lo que requiere los siguientes pasos:

1. [Instalar](https://docs.docker.com/install/) Docker
2. [Instalar](https://docs.docker.com/compose/install/) Docker Compose
3. Clonar este proyecto 
```bash 
   git clone https://github.com/pdramirez-dev/vivo_uclv.git
```
git clone https://github.com/pdramirez-dev/vivo_uclv.git
3. Inicie los contenedores:
```bash
      docker-compose up -d
```

## Ejemplo de tiempo de ejecución de VIVO

El ejemplo [docker-compose.yml](docker-compose.yml) es una instalación típica para probar una instalación simple de VIVO en docker. Este archivo inicia tres contenedores y utiliza el sistema SDB estándar con el backend mariadb. Este ejemplo también muestra cómo se usa un directorio local [example-config](example-config) para sobrescribir el `runtime.properties` predeterminado tal como lo instaló Dockerfile. Aquí se modifica la contraseña de root y el dominio.

```bash
   docker-compose up -d
```
 Comenzará este proyecto. Al navegar a http://localhost:8080/vivo, se iniciará esta instancia simple.

 Si obtiene un error que indica que no se encontró la base de datos, esto podría deberse a un error en el que la instancia de vivo no está esperando que la instancia de mariadb se inicialice. SI tiene este error, intente `docker-compose down; ventana acoplable-componer -d`.


## Desarrollo VIVO

Puede usar estos mismos contenedores para desarrollar una instalación VIVO local. En esto
caso, su archivo `docker-compose.yml` solo contendría `solr` y el
Imágenes `mariadb`. Luego puede conectarse a estas imágenes con su configuración local.

1. Instale VIVO como de costumbre, con los siguientes cambios en `runtime.properties`:
   ```
   vitro.local.solr.url = http://localhost:8983/solr/vivocore
   ```
1. Abra un navegador para: http://localhost:8080/vivo


# Notas

## LCA de MariaDB
Actualmente, [Mariadb Dockerfile](mariadb/Dockerfile) incluye [SQL](mariadb/mysql-init.sql), que inicializa un nombre de usuario:contraseña para que VIVO se comunique con mariadb. Si desea cambiar esto, deberá realizar algunos comandos de concesión de sql adicionales para modificar esto.


Para versiones anteriores de VIVO dockerizado, consulte [vivo-docker](https://github.com/gwu-libraries/vivo-docker)