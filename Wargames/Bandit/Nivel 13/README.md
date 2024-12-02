<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 12 → Nivel 13***

- **Meta del nivel**

- *La contraseña para el siguiente nivel se almacena en el archivo data.txt, que es un hexdump de un archivo que ha sido comprimido repetidamente. Para este nivel puede ser útil crear un directorio bajo /tmp en el que puedas trabajar. Utilice mkdir con un nombre de directorio difícil de adivinar. O mejor, utilice el comando «mktemp -d». A continuación, copia el archivo de datos con cp y renómbralo con mv (¡lee las páginas de manual!).*
- *Comandos que puedes necesitar para resolver este nivel*

- *grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd, mkdir, cp, mv, file*
- *Material de lectura útil*

- *Volcado hexadecimal en Wikipedia*

## ***Comando `mktemp`***

```bash
mktemp [opciones] [plantilla]
```

### ***Descripción***

- ***`mktemp`** es un comando que crea un archivo o directorio temporal único en el sistema.*
- *El nombre generado es único, lo que evita colisiones entre procesos.*
- *El archivo o directorio se puede usar como un espacio seguro para datos temporales en scripts o aplicaciones.*

---

### ***Uso básico***

#### ***Crear un archivo temporal***

```bash
mktemp
```

- **Salida**:

  ```bash
  /tmp/tmp.ABCD1234
  ```

  - *Se crea un archivo vacío con un nombre aleatorio, en el directorio `/tmp`.*

#### ***Crear un archivo temporal en un directorio específico***

```bash
mktemp /path/to/dir/temp.XXXXXX
```

- **Salida**:

  ```bash
  /path/to/dir/temp.QWERTY
  ```

  - **`XXXXXX`:** *Es obligatorio en la plantilla; se reemplaza por una cadena aleatoria.*

---

#### ***Crear un directorio temporal***

```bash
mktemp -d
```

- **Salida**:

  ```bash
  /tmp/tmp.1234XYZ
  ```

  - *Se crea un directorio temporal único en `/tmp`.*

---

### ***Opciones principales***

| *Opción*   | *Descripción*                                                                                         |
| ---------- | ----------------------------------------------------------------------------------------------------- |
| `-d`       | *Crea un directorio en lugar de un archivo temporal.*                                                 |
| `-q`       | *No muestra mensajes de error; útil para scripts.*                                                    |
| `-u`       | *Genera el nombre del archivo, pero no lo crea. `Nota: no se recomienda por problemas de seguridad`.* |
| `--suffix` | *Agrega un sufijo al nombre del archivo temporal.*                                                    |

---

### ***Ejemplos prácticos***

#### ***1. Crear un archivo temporal con sufijo personalizado***

```bash
mktemp --suffix=".log"
```

- **Salida**:

  ```bash
  /tmp/tmp.XYZ789.log
  ```

#### ***2. Crear un directorio temporal en un directorio específico***

```bash
mktemp -d /path/to/dir/mydir.XXXXXX
```

- **Salida**:

  ```bash
  /path/to/dir/mydir.ABCD123
  ```

#### ***3. Uso en un script para almacenar datos temporales***

```bash
#!/bin/bash

tempFile=$(mktemp)
echo "Datos temporales" > "$tempFile"
cat "$tempFile"
rm "$tempFile"
```

- **Descripción**:
  - *Se crea un archivo temporal y se guarda algo de texto.*
  - *Luego se muestra el contenido y se elimina el archivo.*

#### ***4. Crear un directorio temporal para procesamiento***

```bash
#!/bin/bash

tempDir=$(mktemp -d)
echo "Directorio temporal: $tempDir"
# Realizar operaciones en el directorio
rm -rf "$tempDir"
```

---

### ***Resumen***

- **`mktemp`** *es una herramienta poderosa para gestionar archivos y directorios temporales.*
- *Los nombres únicos evitan colisiones entre procesos concurrentes.*
- *Usar `mktemp` mejora la seguridad al evitar conflictos o acceso no autorizado a archivos temporales en scripts o programas.*

---

## ***Uso combinado de `cat`, `xxd` y compresores***

- ***`cat`*** *es un comando básico para mostrar el contenido de un archivo.*
- ***`xxd`*** *convierte datos binarios en texto hexadecimal (hex dump) y viceversa.*
- *Herramientas como `gzip`, `7z` y otras son esenciales para manejar formatos de compresión.*

---

### ***Uso básico de `cat` y `xxd`***

#### ***1. Mostrar contenido de un archivo***

```bash
cat data.txt
```

#### ***2. Convertir texto en formato hexadecimal***

```bash
echo "Hello World" | xxd
```

- **Salida**:

  ```bash
  00000000: 4865 6c6c 6f20 576f 726c 640a            Hello World.
  ```

---

#### ***3. Revertir hex dump a texto original***

```bash
echo "Hello World" | xxd | xxd -r
```

- **Salida**:

  ```bash
  Hello World
  ```

- *La opción `-r` revierte un hex dump al contenido original.*

#### ***4. Crear un directorio temporal y trabajar con archivos***

```bash
mktemp -d
```

- **Salida**:

  ```bash
  /tmp/tmp.mPA06BAcqL
  ```

  - *Se crea un directorio temporal único. Usa `rmdir` para eliminarlo.*

---

### ***Ejemplo práctico con compresión***

#### ***1. Crear un directorio temporal y trabajar con un archivo***

```bash
cd $(mktemp -d)
cat ~/data.txt > ./data.hex
xxd -r ./data.hex > data
```

- **Salida de `file data`**:

  ```bash
  data: gzip compressed data, was "data2.bin", last modified: Thu Sep 19 07:08:15 2024, max compression, from Unix, original size modulo 2^32 574
  ```

- *El archivo comprimido se identifica como un archivo `gzip`.*

---

#### ***2. Renombrar y analizar el archivo***

```bash
mv data data.gzip
```

- *Renombramos el archivo para reflejar correctamente su formato.*

#### ***3. Verificar el contenido del archivo comprimido con `7z`***

```bash
7z l data.gzip
```

- **Salida**:

  ```bash
  7-Zip 23.01 (x64) : Copyright (c) 1999-2023 Igor Pavlov : 2023-06-20

  64-bit locale=es_ES.UTF-8 Threads:4 OPEN_MAX:1024

  Scanning the drive for archives:
  1 file, 607 bytes (1 KiB)

  Listing archive: data.gzip

  --
  Path = data.gzip
  Type = gzip
  Headers Size = 20      
  Date      Time    Attr         Size   Compressed  Name
  ------------------- ----- ------------ ------------  ------------------------
  2024-09-19 01:08:15 .....          574          607  data2.bin
  ------------------- ----- ------------ ------------  ------------------------
  2024-09-19 01:08:15                574          607  1 files
  ```

#### ***4. Extraer el archivo comprimido***

```bash
7z x data.gzip
```

- **Salida**:

  ```bash
  7-Zip 23.01 (x64) : Copyright (c) 1999-2023 Igor Pavlov : 2023-06-20
  64-bit locale=es_ES.UTF-8 Threads:4 OPEN_MAX:1024

  Scanning the drive for archives:
  1 file, 607 bytes (1 KiB)

  Extracting archive: data.gzip
  --
  Path = data.gzip
  Type = gzip
  Headers Size = 20

  Everything is Ok

  Size:       574
  Compressed: 607
  ```

- *El archivo extraído (`data2.bin`) es identificado como un archivo comprimido adicional.*

#### ***5. Identificar el tipo del archivo extraído***

```bash
file data2.bin
```

- **Salida**:

  ```bash
  data2.bin: bzip2 compressed data, block size = 900k
  ```

---

### ***Formatos de compresión comunes***

| *Formato* | *Descripción*                                             | *Herramientas asociadas* |
| --------- | --------------------------------------------------------- | ------------------------ |
| `gzip`    | *Compresión rápida y eficiente, usada en sistemas UNIX.*  | *`gzip`, `gunzip`*       |
| `bzip2`   | *Compresión más lenta pero con mayor tasa de compresión.* | *`bzip2`, `bunzip2`*     |
| `7z`      | *Formato versátil con soporte para múltiples algoritmos.* | *`7z`*                   |
| `tar`     | *Archivos agrupados sin compresión nativa.*               | *`tar -cf`, `tar -xf`*   |

- *El uso de `xxd` facilita la manipulación de datos binarios en formato legible.*
- *Herramientas como `gzip` y `7z` son esenciales para analizar y trabajar con archivos comprimidos.*
- *Los formatos de compresión tienen diferentes ventajas según el caso de uso.*

## ***¿Qué es un Hex Dump y para qué sirve?***

- **Hex Dump** *es una representación visual de los datos binarios en formato hexadecimal.*
- *Muestra los bytes de un archivo o flujo de datos, normalmente junto a su representación en texto ASCII (o caracteres legibles).*
- *Se utiliza comúnmente para inspeccionar el contenido de archivos binarios y depurar datos.*

---

### ***Formato de un Hex Dump***

Un **hex dump** generalmente se presenta de la siguiente manera:

```bash
00000000  48 65 6c 6c 6f 20 57 6f  72 6c 64 0a           Hello World.
```

- **Primer campo (dirección):** *La posición del primer byte en el archivo (en formato hexadecimal).*
- **Segundo campo (hexadecimal):** *Los valores hexadecimales de los bytes.*
- **Tercer campo (ASCII):** *La representación de los bytes como caracteres ASCII (si es posible).*

---

### ***¿Para qué sirve un Hex Dump?***

1. **Inspección de archivos binarios:**
   - *Permite ver los datos contenidos en archivos binarios (como imágenes, archivos comprimidos, etc.) en un formato legible.*

2. **Depuración y análisis de datos:**
   - *Es útil para depurar errores en datos binarios, por ejemplo, si un archivo está corrupto o si se necesitan identificar patrones específicos.*

3. **Investigación forense:**
   - *En la informática forense, un hex dump es esencial para examinar archivos de manera detallada y encontrar información oculta o no legible en su forma normal.*

4. **Reversión de cifrados simples:**
   - *Herramientas como `xxd` permiten analizar datos cifrados o codificados, como contraseñas o mensajes cifrados.*

5. **Optimización y comprensión de archivos de texto:**
   - *A veces, un hex dump se utiliza para ver si hay datos extraños o metadatos ocultos en archivos de texto que no se pueden ver a simple vista.*

---

### ***Ejemplo de uso de Hex Dump***

#### ***Generar un Hex Dump de un archivo***

```bash
xxd archivo.bin
```

- *Este comando genera un hex dump del archivo `archivo.bin` y lo muestra en la terminal.*

#### ***Convertir texto en Hex Dump***

```bash
echo "Hello World" | xxd
```

- **Salida**:

  ```bash
  00000000: 4865 6c6c 6f20 576f 726c 640a            Hello World.
  ```

- **Hex Dump** *es una herramienta poderosa para visualizar el contenido binario de un archivo o flujo de datos en formato hexadecimal.*
- *Es útil en una variedad de contextos, desde la depuración hasta la investigación forense, permitiendo el análisis detallado de archivos no legibles de otra forma.*
- *Comandos como `xxd` en Linux hacen que la generación de hex dumps sea rápida y fácil.*

## ***Explicación detallada del script y conceptos utilizados***

---

### ***Explicación del script***

*El objetivo de este script es descomprimir de manera iterativa un archivo comprimido (en este caso `data.gzip`) que contiene otros archivos comprimidos en su interior. Cada vez que se extrae un archivo, el script busca otro comprimido dentro y repite el proceso hasta que ya no haya más archivos comprimidos.*

#### ***Sintaxis y explicaciones detalladas***

```bash
#!/usr/bin/env bash
```

- **`#!/usr/bin/env bash`:** *Es el **shebang** que indica el intérprete de comandos que debe ejecutarse para este script. En este caso, `bash`, que es un intérprete de comandos popular en sistemas Unix/Linux. El uso de **`/usr/bin/env`** garantiza que se use el `bash` correcto, incluso si el intérprete no está en una ubicación fija en el sistema.*

```bash
pathDirectory="/tmp/tmp.t6au34Dj2j"
pathComprimido="$pathDirectory/data.gzip"
```

- **`pathDirectory`** y **`pathComprimido`:** *Definen las rutas a los directorios y archivos que se van a manipular. Estas variables se usan para almacenar las ubicaciones de los archivos comprimidos y sus destinos.*

```bash
while true; do
```

- **`while true; do`:** *Comienza un bucle **infinito**. Este bucle seguirá ejecutándose hasta que se cumpla alguna condición de salida. Es común usarlo cuando no sabemos de antemano cuántas veces se ejecutará el bucle, y queremos que continúe hasta que ya no haya más archivos comprimidos.*

```bash
nextComprimido=$(7z l $pathComprimido 2>/dev/null | grep -iFwA 2 "Name" | tail -n1 | awk 'NF{print $NF}')
```

- **`nextComprimido=$(...)`:** *Ejecuta un comando y almacena su salida en la variable **`nextComprimido`**.*
  - **`7z l $pathComprimido`:** *Lista los contenidos de un archivo comprimido utilizando el programa `7z` (7-Zip).*
  - **`2>/dev/null`:** *Redirige los errores a `/dev/null` (lo que significa que los errores no se mostrarán en la terminal).*
  - **`grep -iFwA 2 "Name"`:** *Filtra la salida buscando la palabra "Name" en el listado, asegurándose de que sea insensible a mayúsculas (`-i`) y con coincidencias exactas (`-F`).*
  - **`tail -n1`:** *Extrae la última línea del resultado.*
  - **`awk 'NF{print $NF}'`:** *Muestra el último campo de la línea (el nombre del archivo encontrado).*

```bash
if ! [ -z $nextComprimido ]; then
```

- **`if ! [ -z $nextComprimido ]; then`:** *Verifica si la variable **`nextComprimido`** no está vacía.*
  - **`-z $nextComprimido`:** *La opción **`-z`** evalúa si la variable está vacía.*
  - **`!`:** *La negación asegura que solo se ejecutará el bloque siguiente si la variable **`nextComprimido`** **no** está vacía.*

```bash
7z x $pathComprimido >/dev/null 2>&1 && pathComprimido="$pathDirectory/$nextComprimido"
```

- **`7z x $pathComprimido`:** *Extrae el archivo comprimido especificado en **`$pathComprimido`**.*
- **`>/dev/null 2>&1`:** *Redirige tanto la salida estándar como los errores a `/dev/null`, de modo que no se muestre nada en la terminal.*
- **`&& pathComprimido="$pathDirectory/$nextComprimido"`:** *Si la extracción es exitosa, se actualiza **`pathComprimido`** con el nombre del nuevo archivo comprimido para seguir procesando.*

```bash
continue
```

- **`continue`:** *Salta a la siguiente iteración del bucle `while`, es decir, reejecuta el ciclo con el nuevo archivo comprimido.*

```bash
awk 'NF{print $NF}' $pathComprimido | xclip -selection clipboard
```

- **`awk 'NF{print $NF}' $pathComprimido`:** *Extrae el último campo del archivo comprimido (que normalmente es el nombre del archivo o la extensión).*
- **`xclip -selection clipboard`:** *Copia la salida del comando anterior al portapapeles de X11.*

```bash
echo "[] Ya no hay mas ficheros que descomprimir"
exit 1
```

- **`echo "[] Ya no hay mas ficheros que descomprimir"`:** *Muestra un mensaje indicando que ya no hay más archivos comprimidos por extraer.*
- **`exit 1`:** *Termina el script con un código de salida **`1`**, lo que indica que el script se ha ejecutado correctamente.*

```bash
done
```

- **`done`:** *Termina el bucle **`while`**.*

---

### ***Otros conceptos explicados***

1. **`$` y variables:**
   - **`$variable`:** *El signo **`$`** se utiliza para acceder al valor almacenado en una variable. Por ejemplo, si tienes **`nombre="Juan"`**, entonces **`$nombre`** te devolverá el valor **"Juan"**.*

2. **`while true; do` y el `;`:**
   - El **`while true; do`** es un bucle infinito. El **`;`** se utiliza para separar el encabezado del bucle de su contenido. En este caso, **`while true`** significa "ejecutar continuamente", y **`do`** indica que comienza el bloque de código que debe ejecutarse en cada ciclo.

3. **`! [ -z $nextComprimido ]`:**
   - **`-z`:** *Comprueba si la cadena está vacía.*
   - **`!`:** *La negación, asegura que solo se ejecute el bloque de código si **`$nextComprimido`** no está vacío.*

4. **`#!/usr/bin/env bash`:**
   - *Este es un **shebang** que le dice al sistema qué intérprete utilizar para ejecutar el script. En este caso, **`/usr/bin/env bash`** asegura que el script se ejecute con `bash`, el shell adecuado.*

*El script proporcionado es un ejemplo de cómo automatizar la descompresión de archivos comprimidos anidados utilizando `7z`. La lógica del script sigue estos pasos:*

1. *Listar los contenidos del archivo comprimido.*
2. *Extraer el siguiente archivo comprimido.*
3. *Continuar con el proceso hasta que ya no haya más archivos comprimidos.*
4. *Copiar el nombre del último archivo descomprimido al portapapeles.*
5. *Finalizar el script.*

```bash
#!/usr/bin/env bash

pathDirectory="/tmp/tmp.t6au34Dj2j"
pathComprimido="$pathDirectory/data.gzip"

while true; do
  nextComprimido=$(7z l $pathComprimido 2>/dev/null | grep -iFwA 2 "Name" | tail -n1 | awk 'NF{print $NF}')
  if ! [ -z $nextComprimido ]; then
    7z x $pathComprimido >/dev/null 2>&1 && pathComprimido="$pathDirectory/$nextComprimido"
    continue
  fi

  awk 'NF{print $NF}' $pathComprimido | xclip -selection clipboard
  echo "[] Ya no hay mas ficheros que descomprimir"
  exit 1

done
```

---

### ***Descripción:***

**Comando:**

```bash
lsd -lA
```

---

### **Salida:**

```bash
.rw-rw-r-- d4nitrix13 d4nitrix13 607 B  Sun Nov 24 14:10:24 2024  data.gzip
.rw-rw-r-- d4nitrix13 d4nitrix13 2.5 KB Sun Nov 24 14:10:05 2024  data.hex
.rw-rw-r-- d4nitrix13 d4nitrix13 432 B  Thu Sep 19 01:08:15 2024  data2
.rw-rw-r-- d4nitrix13 d4nitrix13 574 B  Thu Sep 19 01:08:15 2024  data2.bin
.rw-rw-r-- d4nitrix13 d4nitrix13  20 KB Thu Sep 19 01:08:15 2024  data4.bin
.rw-r--r-- d4nitrix13 d4nitrix13  10 KB Thu Sep 19 01:08:15 2024  data5.bin
.rw-rw-r-- d4nitrix13 d4nitrix13  10 KB Thu Sep 19 01:08:15 2024  data6
.rw-r--r-- d4nitrix13 d4nitrix13 221 B  Thu Sep 19 01:08:15 2024  data6.bin
.rw-r--r-- d4nitrix13 d4nitrix13  79 B  Thu Sep 19 01:08:15 2024  data8.bin
.rw-rw-r-- d4nitrix13 d4nitrix13  49 B  Thu Sep 19 01:08:15 2024  data9.bin
.rwxrw-r-- d4nitrix13 d4nitrix13 507 B  Sun Nov 24 18:24:24 2024  descompressor.sh
```

---

### ***Análisis de la Salida:***

- **Permisos:**
  - **`rw-rw-r--`:** *Indica que los archivos son legibles y escribibles para el propietario y el grupo, y solo legibles para otros usuarios.*
  - **`rwxrw-r--`:** *El archivo `descompressor.sh` tiene permisos de ejecución para el propietario.*

- **Propietario y Grupo:**
  - **`d4nitrix13 d4nitrix13`:** *El propietario y el grupo de los archivos es `d4nitrix13`.*

- **Tamaño:**
  - *Los archivos tienen tamaños variables. Por ejemplo:*
    - *`data.gzip` tiene 607 bytes.*
    - *`data4.bin` tiene 20 KB.*

- **Fecha de modificación:**
  - *Los archivos fueron modificados en diferentes fechas, algunos el 19 de septiembre, otros el 24 de noviembre.*

- **Nombre de archivo:**
  - *Los archivos varían en nombre y extensión, lo que indica que son de diferentes tipos, incluidos comprimidos, binarios y scripts.*

---

### **Descripción:**

**Comando:**

```bash
file *
```

*Este comando determina el tipo de archivo de todos los archivos del directorio, identificando el formato y el contenido de cada archivo.*

---

### ***Salida:***

```bash
data2:            gzip compressed data, was "data4.bin", last modified: Thu Sep 19 07:08:15 2024, max compression, from Unix, original size modulo 2^32 20480
data2.bin:        bzip2 compressed data, block size = 900k
data4.bin:        POSIX tar archive (GNU)
data5.bin:        POSIX tar archive (GNU)
data6:            POSIX tar archive (GNU)
data6.bin:        bzip2 compressed data, block size = 900k
data8.bin:        gzip compressed data, was "data9.bin", last modified: Thu Sep 19 07:08:15 2024, max compression, from Unix, original size modulo 2^32 49
data9.bin:        ASCII text
data.gzip:        gzip compressed data, was "data2.bin", last modified: Thu Sep 19 07:08:15 2024, max compression, from Unix, original size modulo 2^32 574
data.hex:         ASCII text
descompressor.sh: Bourne-Again shell script, Unicode text, UTF-8 text executable
```

---

### ***Análisis de la Output:***

- **Tipos de archivo:**
  - **`gzip compressed data`:** *Archivos comprimidos con `gzip`, como `data2`, `data8.bin` y `data.gzip`.*
  - **`bzip2 compressed data`:** *Archivos comprimidos con `bzip2`, como `data2.bin` y `data6.bin`.*
  - **`POSIX tar archive (GNU)`:** *Archivos comprimidos en el formato `tar`, como `data4.bin`, `data5.bin` y `data6`.*
  - **`ASCII text`:** *El archivo `data9.bin` es texto en formato ASCII, legible por humanos.*
  - **`Bourne-Again shell script`:** *`descompressor.sh` es un script ejecutable en formato shell, escrito en UTF-8.*

- *La salida de `lsd -lA` proporciona información sobre los archivos en el directorio, incluyendo sus permisos, propietarios, tamaños y fechas de modificación.*
- *El comando `file *` identifica el tipo de archivo y su formato de compresión o contenido, lo cual es útil para saber cómo tratar cada archivo (descomprimir, abrir como texto, etc.).*

### ***Código de estado (exit status)***

- **Definición:**  
  - *Es un valor numérico devuelto por un comando o programa al finalizar.*
  - **0:** *Indica que el programa terminó correctamente (sin errores).*
  - **Distinto de 0:** *Indica que ocurrió un error o que no se ejecutó correctamente.*

#### ***Cómo verificar el código de estado:***

```bash
echo $?
```

- **Descripción:**  
  - **`$?`:** *Una variable especial en Bash que almacena el código de estado del último comando ejecutado.*

---

### ***Ejemplo práctico:***

#### ***Comando exitoso***

```bash
ls
echo $?
```

- **Salida:**

  ```bash
  alacritty      carapace   GIMP            keepassxc      nushell         starship.toml    user-dirs.dirs
  atril          Code       github-copilot  kitty          nvim            systemd          user-dirs.locale
  atuin          crossnote  gtk-2.0         lazygit        procps          Thunar           wezterm
  autostart      dconf      gtk-3.0         libreoffice    ptpython        tmux             xfce4
  bash-env-json  fastfetch  hexchat         mimeapps.list  pulse           Trolltech.conf   xubuntu
  bash-env.nu    fish       htop            neofetch       QtProject.conf  update-notifier  zellij
  0
  ```

  - **`0`:** *El comando `ls` se ejecutó correctamente.*

#### *Comando con error*

```bash
ls Directory
echo $?
```

- **Salida:**

  ```bash
  ls: cannot access 'Directory': No such file or directory
  2
  ```

  - **`2`:** *El comando `ls` no pudo ejecutarse porque el directorio no existe.*

---

### ***Resumen:***

- **Código de estado (`exit status`):** *Indica el resultado de un comando.*
- **`0`:** *Ejecución exitosa.*
- **`!= 0`:** *Error o fallo en la ejecución.*
- *Puedes usar **`$?`** para inspeccionar el último código de estado.*
