<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 3 → Nivel 4***

- **Meta de nivel**

- *La contraseña para el siguiente nivel se guarda en un archivo oculto en el directorio inhere.*
- *Comandos que puedes necesitar para resolver este nivel*
  - *ls, cd, cat, file, du, find*

---

## ***Comando `find ./ -type f`***

```bash
find ./ -type f
```

- **Descripción**:
  - *Busca archivos dentro del directorio actual (`./`) y sus subdirectorios.*
  - *La opción **`-type f`** restringe la búsqueda a **archivos regulares** (excluye directorios, enlaces simbólicos, etc.).*

- **Salida:**

  ```bash
  find ./ -type f
  ./inhere/...Hiding-From-You
  ./.profile
  ./.bashrc
  ./.bash_logout
  ```

  **Análisis de la salida**:
  - **`./.bash_logout`, `./.bashrc`, `./.profile` :** *Archivo encontrado en el directorio actual.*
  - **`./inhere/...Hiding-From-You`:** *Archivo dentro de un subdirectorio llamado `inhere`.*

---

### ***1. Comando `find ./ -type f -printf "%f\t%p\t%u\t%g\t%m\n" | column -t`***

```bash
find ./ -type f -printf "%f\t%p\t%u\t%g\t%m\n" | column -t
```

- *Busca archivos regulares (`-type f`) en el directorio actual (`./`) y formatea la salida para mostrar:*
  - **`%f`:** *Nombre del archivo.*
  - **`%p`:** *Ruta completa.*
  - **`%u`:** *Propietario.*
  - **`%g`:** *Grupo.*
  - **`%m`:** *Permisos.*
- *La salida se organiza en columnas usando `column -t`.*

- **Salida:**

  ```bash
  ...Hiding-From-You  ./inhere/...Hiding-From-You  bandit4  bandit3  640
  .profile            ./.profile                   root     root     644
  .bashrc             ./.bashrc                    root     root     644
  .bash_logout        ./.bash_logout               root     root     644
  ```

  **Análisis de la salida:**
  - **Columna 1 (`%f`):** *Muestra el nombre del archivo (por ejemplo, `.profile`).*
  - **Columna 2 (`%p`):** *Indica la ruta completa del archivo.*
  - **Columna 3 (`%u`):** *Propietario del archivo.*
  - **Columna 4 (`%g`):** *Grupo del archivo.*
  - **Columna 5 (`%m`):** *Permisos del archivo en formato numérico.*

---

### ***2. Comando `find . -name ...Hiding-From-You | cat`***

```bash
find . -name ...Hiding-From-You | cat
```

- *Busca el archivo llamado `...Hiding-From-You` en el directorio actual (`.`) y sus subdirectorios, mostrando su ruta completa con `cat`.*

- **Salida:**

  ```bash
  ./inhere/...Hiding-From-You
  ```

  **Análisis de la salida:**
  - *Se encuentra el archivo y muestra su ubicación exacta: `./inhere/...Hiding-From-You`.*

---

### ***3. Comando `find . -name ...Hiding-From-You | xargs cat`***

```bash
find . -name ...Hiding-From-You | xargs cat
```

- *Busca el archivo `...Hiding-From-You` y muestra su contenido usando `xargs` para pasar la ruta al comando `cat`.*

- **Salida:**

  ```bash
  2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
  ```

  **Análisis de la salida:**
  - *El contenido del archivo `...Hiding-From-You` es `2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ`, posiblemente una contraseña.*

---

### ***4. Comando `find . -type f | xargs cat`***

```bash
find . -type f | xargs cat
```

- *Busca todos los archivos regulares (`-type f`) y pasa sus rutas al comando `cat` para mostrar su contenido.*

- **Salida:** *(Dependerá del contenido de los archivos encontrados).*

---

### ***5. Comando `find . -type f | xargs grep -iFn "alias"`***

```bash
find . -type f | xargs grep -iFn "alias"
```

- *Busca la palabra `alias` en todos los archivos regulares encontrados:*
  - **`-i`:** *Ignora mayúsculas y minúsculas.*
  - **`-F`:** *Usa la palabra como literal.*
  - **`-n`:** *Muestra los números de línea donde aparece.*

- **Salida:** *(Muestra las líneas donde aparece `alias`, si existen).*

1. **`find`** *con opciones como `-type f` y `-name` permite localizar archivos específicos.*
2. **`-printf`** *personaliza la información mostrada por `find`.*
3. **`xargs`** *se usa para pasar rutas de archivos a comandos como `cat` o `grep`.*
4. *Estas herramientas son esenciales para la administración de sistemas Unix/Linux y permiten búsquedas avanzadas en estructuras de directori os.*

---

### ***Resumen***

1. *El comando **`find`** recorre recursivamente los directorios, buscando elementos que coincidan con las condiciones dadas.*
2. *La opción **`-type f`** filtra para mostrar solo archivos regulares.*
3. *Útil para localizar archivos en estructuras de directorios complejas.*

---

### ***1. ¿Por qué es útil `xargs`?***

- **Descripción general:**
  - *`xargs` toma una lista de elementos de entrada (normalmente generada por otro comando como `find`, `ls`, o `grep`) y los convierte en argumentos para otro comando.*
  - *Es útil porque muchos comandos no aceptan directamente una lista de elementos en su entrada estándar o tienen limitaciones al procesar grandes cantidades de datos.*

---

### ***2. Ejemplo básico: Sin `xargs`***

```bash
find . -name "*.txt" | cat
```

- **Problema:**
  - *Este comando pasará las rutas de los archivos al comando `cat`, pero no como argumentos individuales. Esto no siempre funciona, especialmente si la lista de archivos es extensa o contiene caracteres especiales.*

---

### ***3. Ejemplo con `xargs`:***

```bash
find . -name "*.txt" | xargs cat
```

- **Ventajas:**
  - *`xargs` toma cada línea generada por `find` y las pasa como argumentos individuales a `cat`.*
  - *Funciona de manera eficiente incluso con una gran cantidad de archivos.*
  - *Si las rutas tienen caracteres especiales o espacios, puedes usar `-print0` con `find` y `-0` con `xargs` para manejar los nombres correctamente.*

---

### ***4. Casos prácticos***

#### ***4.1 Procesar archivos grandes***

```bash
find /var/log -name "*.log" | xargs grep "error"
```

- *Busca la palabra `error` en todos los archivos `.log` en el directorio `/var/log` y subdirectorios.*
- *`xargs` asegura que las rutas encontradas sean pasadas correctamente a `grep`.*

---

#### ***4.2 Borrar archivos encontrados por `find`***

```bash
find . -name "*.tmp" | xargs rm
```

- *Elimina todos los archivos temporales (`*.tmp`) encontrados en el directorio actual.*
- *`xargs` pasa cada archivo como argumento a `rm`, evitando posibles errores.*

---

#### ***4.3 Contar líneas en múltiples archivos***

```bash
find . -name "*.txt" | xargs wc -l
```

- *Cuenta las líneas en todos los archivos `.txt` encontrados por `find`.*
- *`xargs` organiza los argumentos para el comando `wc -l`.*

---

### ***5. Opciones útiles de `xargs`***

1. **`-0`:** *Trabaja con entradas terminadas en nulo (`\0`) en lugar de saltos de línea, ideal para manejar nombres de archivo con espacios.*

   ```bash
   find . -name "*.txt" -print0 | xargs -0 cat
   ```

2. **`-n`:** *Controla cuántos argumentos pasar a la vez.*

  ```bash
  find . -name "*.log" | xargs -n 2 grep "error"
  ```

- *Pasa de a dos archivos por vez al comando `grep`.*

1. **`-p`:** *Pide confirmación antes de ejecutar.*

  ```bash
  find . -name "*.bak" | xargs -p rm
  ```

1. *`xargs` es útil para conectar comandos y manejar largas listas de argumentos.*
2. *Mejora la eficiencia y compatibilidad en scripts y tareas de terminal.*
3. *Funciona bien con comandos que no aceptan entrada estándar directamente.*
4. *Es ideal para manejar tareas como búsqueda, eliminación, y procesamiento de datos en múltiples archivos.*

---

## ***1. Comando `ls -l`***

```bash
ls -l
```

- *Muestra una lista detallada del contenido del directorio actual.*
- **Salida:**

  ```bash
  total 4
  drwxr-xr-x 2 root root 4096 Sep 19 07:08 inhere
  ```

  **Análisis de la salida:**
  - **`drwxr-xr-x`:** *Indica que **`inhere/`** es un directorio (`d`) con permisos:*
    - Propietario: Lectura, escritura y ejecución.
    - Grupo y otros: Solo lectura y ejecución.
  - **`root root`:** *El directorio pertenece al usuario `root` y al grupo `root`.*
  - **`4096`:** *Tamaño del directorio en bytes.*
  - **`inhere`:** *Nombre del directorio.*

---

### ***2. Comando `cd inhere/`***

```bash
cd inhere/
```

- *Cambia al directorio llamado **`inhere/`**.*
- *Después de este comando, el prompt cambia a indicar que ahora estás dentro de **`~/inhere`**.*

---

### ***3. Comando `ls -la`***

```bash
ls -la
```

- *Lista todo el contenido del directorio actual, incluyendo archivos ocultos (que comienzan con un punto).*
- **Salida:**

  ```bash
  total 12
  drwxr-xr-x 2 root    root    4096 Sep 19 07:08 .
  drwxr-xr-x 3 root    root    4096 Sep 19 07:08 ..
  -rw-r----- 1 bandit4 bandit3   33 Sep 19 07:08 ...Hiding-From-You
  ```

  **Análisis de la salida:**
  - **`.`:** *Representa el directorio actual.*
  - **`..`:** *Representa el directorio padre.*
  - **`...Hiding-From-You`:**
    - *Es un archivo regular (`-`) con permisos:*
      - *Propietario (`bandit4`): Lectura y escritura.*
      - *Grupo (`bandit3`): Solo lectura.*
      - *Otros: Sin permisos.*
    - *Tamaño: 33 bytes.*
    - *Nombre: **`...Hiding-From-You`** (un archivo con un nombre poco común que comienza con puntos).*

---

### **4. Comando `cat ./...Hiding-From-You`**

```bash
cat ./...Hiding-From-You
```

- **`cat`:** *Muestra el contenido del archivo.*
- **`./...Hiding-From-You`:**
  - *El prefijo `./` indica que el archivo está en el directorio actual.*
  - *Esto es necesario porque el nombre del archivo comienza con puntos (`...`), lo que puede ser confuso para algunos comandos si no se especifica claramente.*

- **Salida:**

  ```bash
  2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
  ```

  - *Este es el contenido del archivo, probablemente la contraseña para el siguiente nivel.*

---

### ***Resumen:***

1. *Usas `ls` y `ls -la` para localizar archivos en un directorio, incluso aquellos ocultos o con nombres poco comunes.*
2. *Cambias al directorio que contiene el archivo usando `cd`.*
3. *Para archivos con nombres extraños o con caracteres especiales (como múltiples puntos), utilizas un prefijo `./` o comillas al referenciarlos.*
4. *Finalmente, `cat` te permite leer el contenido del archivo.*
