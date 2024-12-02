<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 5 → Nivel 6***

- **Meta de nivel**
- **La contraseña para el siguiente nivel se almacena en un archivo en algún lugar bajo el directorio inhere y tiene todas las siguientes propiedades:**
- *legible por humanos*
- *1033 bytes de tamaño*
- *no ejecutable*
- **Comandos que puede necesitar para resolver este nivel**
- *ls, cd, cat, file, du, find*

Aquí tienes la explicación detallada en el formato que me pediste:

---

## ***1. Comando `find . -type f -readable`***

```bash
find . -type f -readable
```

- **Descripción:** *Busca todos los archivos legibles (`-readable`) en el directorio actual (`.`) y sus subdirectorios. La opción `-type f` asegura que solo se busquen archivos regulares (no directorios ni enlaces, etc.).*
- **Salida:** *Muestra una lista de archivos que son legibles para el usuario actual.*

---

## ***2. Comando `find . -type f -writable`***

```bash
find . -type f -writable
```

- **Descripción:** *Busca todos los archivos escribibles (`-writable`), es decir, aquellos en los que el usuario actual tiene permiso para modificar su contenido.*
- **Salida:** *Muestra una lista de archivos que el usuario puede escribir.*

---

## ***3. Comando `find . -type f -executable`***

```bash
find . -type f -executable
```

- **Descripción:** *Busca todos los archivos ejecutables (`-executable`), es decir, aquellos que el usuario actual puede ejecutar.*
- **Salida:** *Muestra una lista de archivos ejecutables en el directorio actual.*

---

## ***4. Comando `find . -type f -readable ! -executable`***

```bash
find . -type f -readable ! -executable
```

- **Descripción:** *Busca todos los archivos que son legibles (`-readable`) pero **no ejecutables** (`! -executable`).*

> [!NOTE]
> *La exclamación (`!`) se usa para negar la condición, por lo que solo se devolverán archivos legibles que no sean ejecutables.*

- **Salida:** *Muestra una lista de archivos que son legibles pero no ejecutables.*

---

## ***5. Comando `bash ctrl + r`***

```bash
bash ctrl + r
```

- **Descripción:** *Este atajo de teclado en **Bash** permite buscar interactivamente en el historial de comandos anteriores. Al presionar `Ctrl + r`, puedes escribir una parte de un comando previamente ejecutado y Bash lo completará automáticamente.*
- **Salida:** *No tiene salida directa, pero inicia la búsqueda interactiva del historial.*

---

## ***6. Comando `find . -type f -readable ! -executable -size 1033c | xargs cat`***

```bash
find . -type f -readable ! -executable -size 1033c | xargs cat
```

- **Descripción:** *Busca archivos legibles, no ejecutables y con un tamaño específico de 1033 bytes (`-size 1033c`). Los archivos encontrados se pasan al comando `cat` mediante `xargs` para mostrar su contenido.*
- **Salida:** *Muestra el contenido de los archivos que cumplen con los criterios de búsqueda.*

---

## ***7. Comando `xargs nos formatea bien`***

```bash
xargs
```

- **Descripción:** *`xargs` se utiliza para construir y ejecutar comandos con la entrada proporcionada, normalmente a partir de la salida de otro comando. Aquí facilita pasar los archivos encontrados al comando `cat` para mostrar su contenido.*
- **Salida:** *No produce salida directa, pero organiza correctamente los resultados entre comandos.*

---

## ***8. Comando `find . -type f -readable ! -executable -size 1033c | xargs cat | sed 's/  //g'`***

```bash
find . -type f -readable ! -executable -size 1033c | xargs cat | sed 's/  //g'
```

- **Descripción:** *Usa `sed` para eliminar los espacios dobles en el contenido de los archivos. La expresión `s/  //g` busca y reemplaza los espacios dobles con nada, eliminándolos.*
- **Salida:** *El contenido de los archivos se muestra sin los espacios dobles.*

---

## ***9. Comando `find . -type f -readable ! -executable -size 1033c | xargs cat | awk 'NF==1'`***

```bash
find . -type f -readable ! -executable -size 1033c | xargs cat | awk 'NF==1'
```

- **Descripción:** *Usa `awk` para filtrar solo las líneas que contienen un solo campo, es decir, las que no tienen espacios en blanco adicionales o líneas vacías.*
- **Salida:** *Solo se muestran las líneas que contienen una única palabra o valor.*

---

## ***10. Comando `find . -type f -readable ! -executable -size 1033c | xargs cat | tr -d " "`***

```bash
find . -type f -readable ! -executable -size 1033c | xargs cat | tr -d " "
```

- **Descripción:** *Usa `tr` para eliminar todos los espacios en blanco en el contenido de los archivos encontrados. El `tr -d " "` elimina todos los caracteres de espacio.*
- **Salida:** *El contenido de los archivos es mostrado sin ningún espacio en blanco.*

---

## ***11. Comando `find . -type f -readable ! -executable -size 1033c | xargs cat | xargs`***

```bash
find . -type f -readable ! -executable -size 1033c | xargs cat | xargs
```

- **Descripción:** *Usa `xargs` nuevamente para procesar y ejecutar el comando `cat` con los resultados. Esto es redundante, pero asegura que los datos se pasen correctamente entre comandos.*
- **Salida:** *Muestra el contenido de los archivos encontrados, similar a los comandos anteriores.*

---

## ***12. Comando `find . -type f -readable ! -executable -size 1033c | xargs cat | sed 's/^ *//'`***

```bash
find . -type f -readable ! -executable -size 1033c | xargs cat | sed 's/^ *//'
```

- **Descripción:** *Usa `sed` para eliminar los espacios al principio de cada línea (`^ *`). Esto es útil para formatear el contenido y quitar los espacios innecesarios al inicio de las líneas.*
- **Salida:** *El contenido de los archivos se muestra sin los espacios al principio de cada línea.*

---

## ***13. Comando `find . -type f -readable ! -executable -size 1033c | xargs cat | sed 's/^\s *$//'`***

```bash
find . -type f -readable ! -executable -size 1033c | xargs cat | sed 's/^\s *$//'
```

- **Descripción:** *Usa `sed` para eliminar las líneas vacías o aquellas que contienen solo espacios en blanco. La expresión `^\s *$` busca líneas que comienzan y terminan con espacios y las elimina.*
- **Salida:** *Muestra el contenido de los archivos eliminando las líneas vacías o con solo espacios.*

---

### ***Resumen***

1. **`find`**: *Permite realizar búsquedas avanzadas de archivos basadas en permisos, tamaño y tipo.*
2. **`xargs`**: *Facilita pasar la salida de un comando a otro, organizando correctamente los resultados.*
3. **`sed`**: *Permite realizar sustituciones y eliminar texto en base a patrones.*
4. **`awk`**: *Filtra y procesa el texto, permitiendo trabajar con líneas y campos específicos.*
5. **`tr`**: *Transforma o elimina caracteres en el texto.*
