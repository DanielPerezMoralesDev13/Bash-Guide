<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 4 → Nivel 5***

- **Meta de nivel**
- *La contraseña para el siguiente nivel se almacena en el único archivo legible por humanos en el directorio inhere. Consejo: si tu terminal está estropeada, prueba el comando «reset».*
- **Comandos que puede necesitar para resolver este nivel**
- *ls, cd, cat, file, du, find*

## ***1. Comando `whoami`***

```bash
whoami
```

- **Descripción:** *Este comando muestra el usuario actualmente autenticado en el sistema.*
- **Salida:**

  ```bash
  root
  ```

  **Análisis de la salida:**
  - **`root`:** *Indica que el usuario activo en la terminal es `root`, el superusuario del sistema.*

---

### ***2. Comando `touch file.txt`***

```bash
touch file.txt
```

- **Descripción:** *Crea un archivo vacío llamado `file.txt` en el directorio actual si no existe.*
- **Salida:** *Sin salida.*
- **Efecto en el sistema:**
  - *Se genera un archivo vacío `file.txt` en `/tmp`.*

---

### ***3. Comando `echo "My name is Daniel" >> file.txt`***

```bash
echo "My name is Daniel" >> file.txt
```

- **Descripción:** *Añade el texto "My name is Daniel" al archivo `file.txt`.*
- **Salida:** *Sin salida.*
- **Efecto en el sistema:**
  - *El archivo `file.txt` ahora contiene el texto `My name is Daniel`.*

---

### ***4. Comando `chmod o-r file.txt`***

```bash
chmod o-r file.txt
```

- **Descripción:** *Revoca el permiso de lectura para "otros" usuarios en el archivo `file.txt`.*
- **Salida:** *Sin salida.*
- **Efecto en el sistema:**
  - *El archivo `file.txt` ahora tiene permisos `rw-r-----`, limitando la lectura solo al propietario y grupo.*

---

### ***5. Comando `su d4nitrix13` y `cat file.txt`***

```bash
su d4nitrix13
cat file.txt
```

- **Descripción:** *Cambia al usuario `d4nitrix13` e intenta leer el archivo `file.txt`.*
- **Salida:**

  ```bash
  cat: file.txt: Permiso denegado
  ```

  **Análisis de la salida:**
  - **`Permiso denegado`:** *Indica que el usuario `d4nitrix13` no tiene permiso de lectura en `file.txt`.*

---

### ***6. Comando `chmod o+rw file.txt`***

```bash
chmod o+rw file.txt
```

- **Descripción:** *Otorga permisos de lectura y escritura para "otros" usuarios en el archivo `file.txt`.*
- **Salida:** *Sin salida.*
- **Efecto en el sistema:**
  - *El archivo `file.txt` ahora tiene permisos `rw-r--rw-`, permitiendo a cualquier usuario leer y escribir en él.*

---

### ***7. Comando `chgrp d4nitrix13 file.txt`***

```bash
chgrp d4nitrix13 file.txt
```

- **Descripción:** *Cambia el grupo propietario de `file.txt` al grupo `d4nitrix13`.*
- **Salida:** *Sin salida.*
- **Efecto en el sistema:**
  - *El grupo propietario de `file.txt` ahora es `d4nitrix13`.*

---

### ***8. Comando `chattr +i -V file.txt`***

```bash
chattr +i -V file.txt
```

- **Descripción:** *Configura el archivo `file.txt` como inmutable, lo que significa que no puede ser*modificado, eliminado ni renombrado.
- **Salida:**

  ```bash
  Las banderas de file.txt están puestas como ----i---------e-------
  ```

  **Análisis de la salida:**
  - **`i`:** *La bandera de inmutabilidad está activa.
  - **`e`:** *El archivo utiliza un sistema de extensión.

---

### ***9. Comando `rm file.txt`***

```bash
rm file.txt
```

- **Descripción:** *Intenta eliminar el archivo `file.txt`.*
- **Salida:**

  ```bash
  rm: no se puede borrar 'file.txt': Operación no permitida
  ```

  **Análisis de la salida:**
  - **`Operación no permitida`:** *El archivo está protegido por la bandera `i`.

---

### ***10. Comando `chattr -i -V file.txt`***

```bash
chattr -i -V file.txt
```

- **Descripción:** *Elimina la inmutabilidad del archivo `file.txt`.*
- **Salida:**

  ```bash
  Las banderas de file.txt están puestas como --------------e-------
  ```

  **Análisis de la salida:**
  - **`i` eliminada:** *El archivo ya no es inmutable.*

---

### ***11. Comando `find` para buscar y filtrar archivos***

```bash
find ./inhere/ -type f -name *file* | xargs file | grep -iF "text"
```

- **Descripción:** *Busca archivos cuyo nombre contenga `file` en el directorio `inhere` y filtra aquellos*que son de tipo texto ASCII.
- **Salida:**

  ```bash
  ./inhere/-file07: ASCII text
  ```

  **Análisis de la salida:**
  - **`-file07`:** *Archivo identificado como texto ASCII.*
  - **`ASCII text`:** *Especifica el tipo del contenido.*

---

### ***Resumen***

1. **`whoami`:** *Muestra el usuario actual.*
2. **`touch`:** *Crea un archivo vacío.*
3. **`chmod`:** *Gestiona permisos de usuarios y grupos.*
4. **`chattr`:** *Configura atributos especiales como inmutabilidad.*
5. **`find`:** *Busca archivos con filtros avanzados.*

## ***1. Comando: Buscar y filtrar archivos por contenido***

```bash
find ./inhere/ -type f -name *file* | xargs file | grep -iF "text" | awk '{print $1}' | tr -d ':' | xargs cat
```

- **Descripción:**  
  *Este comando busca archivos en el directorio `./inhere/` cuyo nombre contiene `file`. Luego:*  
  1. *Identifica los archivos mediante el comando `file`.*  
  2. *Filtra aquellos cuyo contenido sea de texto (`ASCII text`) usando `grep`.*  
  3. *Extrae solo el nombre del archivo con `awk`.*  
  4. *Limpia los caracteres `:` con `tr`.*  
  5. *Finalmente, muestra el contenido del archivo con `cat`.*  

- **Salida:**

  ```bash
  4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
  ```

  **Análisis de la salida:**  
  - **`4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw`:** *Este es el contenido del archivo de texto identificado, probablemente el archivo `./inhere/-file07`.*  

---

## ***2. Comando: Identificar el archivo sin leer su contenido***

```bash
find ./inhere/ -type f -name *file* | xargs file | grep -iF "text" | awk '{print $1}' | tr -d ':'
```

- **Descripción:**  
  *Similar al anterior, pero aquí solo muestra el nombre del archivo que contiene texto (`ASCII text`).*

- **Salida:**

  ```bash
  ./inhere/-file07
  ```

  **Análisis de la salida:**  
  - **`./inhere/-file07`:** *Nombre del archivo que contiene texto ASCII.*  

---

## ***3. Comando: Identificar archivo mostrando formato original***

```bash
find ./inhere/ -type f -name *file* | xargs file | grep -iF "text" | awk '{print $1}'
```

- **Descripción:**  
  *Similar al comando anterior, pero conserva los dos puntos (`:`) al final del nombre del archivo.*

- **Salida:**

  ```bash
  ./inhere/-file07:
  ```

  **Análisis de la salida:**  
  - **`./inhere/-file07:`** *Archivo encontrado, incluyendo el separador `:`.*  

---

## ***4. Comando: Ver detalles del tipo de archivo***

```bash
find ./inhere/ -type f -name *file* | xargs file | grep -iF "text" --color=always
```

- **Descripción:**  
  *Busca archivos cuyo contenido sea texto (`ASCII text`) y resalta el resultado con colores para una mejor visualización.*

- **Salida:**

  ```bash
  ./inhere/-file07: ASCII text
  ```

  **Análisis de la salida:**  
  - **`ASCII text`:** *Identifica que el archivo contiene texto en formato ASCII.*  
  - **`--color=always`:** *Añade color a las coincidencias encontradas.*  

---

## ***5. Comando: Mostrar todos los archivos y sus tipos***

```bash
find ./inhere/ -type f -name *file* | xargs file
```

- **Descripción:**  
  *Lista todos los archivos que contienen `file` en su nombre y muestra el tipo de cada archivo.*

- **Salida:**

  ```bash
  ./inhere/-file08: data
  ./inhere/-file02: data
  ./inhere/-file09: data
  ./inhere/-file01: data
  ./inhere/-file00: data
  ./inhere/-file05: data
  ./inhere/-file07: ASCII text
  ./inhere/-file03: data
  ./inhere/-file06: data
  ./inhere/-file04: data
  ```

  **Análisis de la salida:**  
  - **`ASCII text`:** *Solo el archivo `-file07` contiene texto.*  
  - **`data`:** *Los demás archivos no contienen texto legible.*  

---

## ***6. Comando: Mostrar únicamente nombres de archivos***

```bash
find ./inhere/ -type f -name *file*
```

- **Descripción:**  
  *Busca y lista todos los archivos cuyo nombre contiene `file` en el directorio `./inhere/`.*

- **Salida:**

  ```bash
  ./inhere/-file08
  ./inhere/-file02
  ./inhere/-file09
  ./inhere/-file01
  ./inhere/-file00
  ./inhere/-file05
  ./inhere/-file07
  ./inhere/-file03
  ./inhere/-file06
  ./inhere/-file04
  ```

  **Análisis de la salida:**  
  - **Lista completa de archivos:** *Identifica todos los archivos en `inhere` que coinciden con el patrón `*file*`.*  

1. **`find` con filtros:** *Busca archivos por nombre o tipo.*  
2. **`file`:** *Identifica el contenido de cada archivo.*  
3. **`grep`:** *Filtra resultados con coincidencias específicas.*  
4. **`awk` y `tr`:** *Procesan y limpian los resultados.*  
5. **`xargs`:** *Permite ejecutar comandos como `cat` para múltiples resultados.*  
