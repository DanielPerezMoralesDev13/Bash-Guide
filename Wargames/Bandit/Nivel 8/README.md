<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 7 → Nivel 8***

- **Meta de nivel**
- *La contraseña del siguiente nivel está guardada en el archivo data.txt junto a la palabra millonésima*
- **Comandos que puedes necesitar para resolver este nivel**
- *man, grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd*

## ***1. Comando `cat data.txt | wc -l`***

```bash
cat data.txt | wc -l
```

- **Descripción:** *Cuenta el número de líneas en el archivo `data.txt`.*
- **Salida:**

  ```bash
  98567
  ```

  **Análisis de la salida:**
  - **`98567`:** *Indica que el archivo `data.txt` tiene 98,567 líneas.*

---

### ***2. Comando `cat data.txt | wc -c`***

```bash
cat data.txt | wc -c
```

- **Descripción:** *Cuenta el número de caracteres en el archivo `data.txt`.*
- **Salida:**

  ```bash
  4184396
  ```

  **Análisis de la salida:**
  - **`4184396`:** *El archivo contiene 4,184,396 caracteres.*

---

### ***3. Comparación entre implementaciones de búsqueda***

#### **Mala implementación:**

```bash
cat data.txt | grep -iF "millionth" data.txt
```

- **Descripción:** *Usa `cat` para leer el archivo y luego pasa su salida como entrada a `grep`.*
- **Problema:**
  - *Ejecuta `grep` innecesariamente sobre dos entradas (una de `cat` y otra del propio archivo).*
  - *Aumenta el uso de recursos y el tiempo de ejecución.*

#### **Buena implementación:**

```bash
grep -iF "millionth" data.txt
```

- **Descripción:** *Busca directamente el texto `millionth` en el archivo `data.txt` sin usar `cat`.*
- **Ventajas:**
  - Más rápido y eficiente, ya que elimina la sobrecarga de `cat`.

---

### ***4. Uso de `awk` para búsqueda***

#### **Comando óptimo:**

```bash
awk '/millionth/' data.txt
```

- **Descripción:** *Usa `awk` para buscar líneas que contengan `millionth` en `data.txt`.*
- **Salida:**

  ```bash
  millionth       dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
  ```

---

### ***5. Comparación de tiempos de ejecución con `time`***

#### **Medición con `awk`:**

```bash
time awk '/millionth/' data.txt
```

- **Salida:**
  
  ```bash
  millionth       dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc

  real    0m0.078s
  user    0m0.041s
  sys     0m0.004s
  ```

#### **Medición con `grep`:**

```bash
time grep -iF "millionth" data.txt
```

- **Salida:**

  ```bash
  millionth       dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc

  real    0m0.025s
  user    0m0.021s
  sys     0m0.004s
  ```

**Análisis:**

- *`grep` es más rápido que `awk` en esta tarea específica debido a su diseño optimizado para búsqueda de texto.*

---

### ***6. Extracción de columnas con `awk`***

#### **Obtener la primera columna:**

```bash
grep -iF "millionth" data.txt | awk '{print $1}'
```

- **Salida:**

  ```bash
  millionth
  ```

#### **Obtener la segunda columna:**

```bash
grep -iF "millionth" data.txt | awk '{print $2}'
```

- **Salida:**

  ```bash
  dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
  ```

#### **Obtener la última columna:**

```bash
grep -iF "millionth" data.txt | awk '{print $NF}'
```

- **Salida:**

  ```bash
  dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
  ```

---

### ***Resumen de comandos eficientes***

1. **Cuenta de líneas y caracteres:**

   ```bash
   wc -l data.txt
   wc -c data.txt
   ```

2. **Búsqueda eficiente:**

   ```bash
   grep -iF "millionth" data.txt
   ```

3. **Uso de `awk`:**

   ```bash
   awk '/millionth/' data.txt
   ```

4. **Extracción de datos:**

   ```bash
   grep -iF "millionth" data.txt | awk '{print $1}'  # Primera columna
   grep -iF "millionth" data.txt | awk '{print $2}'  # Segunda columna
   grep -iF "millionth" data.txt | awk '{print $NF}' # Última columna
   grep -iF "millionth" data.txt | awk 'NF{print $NF}' # Última columna
   ```

### ***1. Revertir y extraer valores con `rev`***

#### **Comando inicial:**

```bash
grep -iF "millionth" data.txt | rev
```

- **Descripción:** *Busca la línea que contiene "millionth" en `data.txt` y revierte el contenido de cada línea utilizando `rev`.*
- **Salida:**

  ```bash
  cEe7gLMksWoR9eOFbNfw0Um4iQFzvwfd        htnoillim
  ```

---

#### **Extraer la primera palabra de la línea revertida:**

```bash
grep -iF "millionth" data.txt | rev | awk '{print $1}'
```

- **Descripción:** *Extrae la primera palabra de la línea revertida.*
- **Salida:**

  ```bash
  cEe7gLMksWoR9eOFbNfw0Um4iQFzvwfd
  ```

---

#### **Revertir nuevamente para obtener la segunda columna:**

```bash
grep -iF "millionth" data.txt | rev | awk '{print $1}' | rev
```

- **Descripción:** *Reinvierte el valor extraído para recuperar su formato original.*
- **Salida:**

  ```bash
  dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
  ```

---

### ***2. Obtener el número de línea de una búsqueda***

```bash
grep -iFn "millionth" data.txt
```

- **Descripción:** *Busca "millionth" en `data.txt`, mostrando el número de línea junto al contenido.*
- **Salida:**

  ```bash
  1457:millionth  dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
  ```

#### **Extraer solo el número de línea:**

```bash
grep -iFn "millionth" data.txt | cut -d ':' -f 1
```

- **Descripción:** *Utiliza `cut` para separar la salida por `:` y extraer el número de línea (primer campo).*
- **Salida:**

  ```bash
  1457
  ```

---

### ***3. Combinar `grep`, `awk` y números de línea***

```bash
awk "NR==$(grep -iFn 'millionth' data.txt | cut -d ':' -f 1)" data.txt | awk 'NF{print $NF}'
```

- **Descripción:**
  - *Encuentra el número de línea donde aparece "millionth" con `grep` y `cut`.*
  - *`awk` selecciona esa línea específica (`NR` igual al número de línea).*
  - *Finalmente, `awk` imprime la última columna de esa línea.*

- **Salida:**

  ```bash
  dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
  ```

---

### ***4. Análisis de permisos con `ls`, `sed` y `grep`***

```bash
ls -l | sed '1d' | cut -c 2-4 | grep -iFo "r" --color=always
```

- **Descripción:**
  - *Lista los archivos y directorios con sus permisos (`ls -l`).*
  - *Elimina la primera línea (`sed '1d'`), que contiene el total.*
  - *Recorta los caracteres 2 a 4 para centrarse en las columnas de permisos de lectura/escritura/ejecución.*
  - *Busca la letra "r" (`grep -iFo "r"`) y la resalta (`--color=always`).*

- **Salida (ejemplo):**

  ```bash
  r
  r
  r
  ```

---

### ***Resumen de comandos útiles***

1. **Revertir texto y extraer columnas:**

   ```bash
   grep -iF "millionth" data.txt | rev | awk '{print $1}' | rev
   ```

2. **Obtener el número de línea:**

   ```bash
   grep -iFn "millionth" data.txt | cut -d ':' -f 1
   ```

3. **Combinar búsqueda por línea y extracción de palabras:**

   ```bash
   awk "NR==$(grep -iFn 'millionth' data.txt | cut -d ':' -f 1)" data.txt | awk '{print $NF}'
   ```

4. **Análisis de permisos:**

   ```bash
   ls -l | sed '1d' | cut -c 2-4 | grep -iFo "r" --color=always
   ```
