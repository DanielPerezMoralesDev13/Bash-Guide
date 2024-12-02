<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 10 → Nivel 11***

- **Meta de nivel**

*La contraseña para el siguiente nivel se almacena en el archivo data.txt, que contiene datos codificados en base64*
*Comandos que puedes necesitar para resolver este nivel*

- *grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd*
- **Material de lectura útil**

- *Base64 en Wikipedia*

## ***Explicación de comandos usados***

---

### **1. Codificación y decodificación con `base64`**

```bash
echo "Mi nombre es Zeus" | base64
```

- **Descripción:** *Codifica la cadena "Mi nombre es Zeus" en formato Base64.*
- **Salida:**

  ```bash
  TWkgbm9tYnJlIGVzIFpldXMK
  ```

---

```bash
echo "Mi nombre es Zeus" | base64 | base64 -d
```

- **Descripción:** *Decodifica la salida Base64 para recuperar la cadena original.*
- **Salida:**

  ```bash
  Mi nombre es Zeus
  ```

---

```bash
base64 -d data.txt
```

- **Descripción:** *Decodifica el contenido del archivo `data.txt` en Base64.*
- **Salida:**

  ```bash
  The password is dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
  ```

---

#### **2. Transformación con `tr`**

```bash
base64 -d data.txt | tr ' ' '\n'
```

- **Descripción:** *Reemplaza los espacios en blanco por saltos de línea (`\n`) en la salida decodificada.*
- **Salida:**

  ```bash
  The
  password
  is
  dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
  ```

---

```bash
base64 -d data.txt | tr ' ' '\n' | tail -n 1
```

- **Descripción:** *Obtiene la última palabra de la salida anterior (el password).*
- **Salida:**

  ```bash
  dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
  ```

---

#### **3. Extracción con `tail`**

```bash
cat /etc/passwd | tail -n 1
```

- **Descripción:** *Muestra la última línea del archivo `/etc/passwd`.*
- **Salida:**

  ```bash
  d4nitrix13:x:1000:1000:d4nitrix13:/home/d4nitrix13:/bin/bash
  ```

---

#### **4. Uso incorrecto de `tr`**

```bash
cat /etc/passwd | tail -n 1 | tr 'd4nitrix13' 'Zeus'
```

- **Descripción:** *Reemplaza cada letra de `d4nitrix13` por las correspondientes en `Zeus`.*
- **Problema:** *`tr` no opera por palabras, sino por caracteres individuales. Además, si la cadena de reemplazo tiene menos caracteres que la original, los caracteres restantes se repiten.*
  
- **Salida:**

  ```bash
  Zeusssssss:s:s000:s000:Zeusssssss:/home/Zeusssssss:/bsu/bash
  ```

---

#### **Solución alternativa para palabras completas**

**Si quieres reemplazar palabras completas en vez de caracteres, utiliza `sed`:**

```bash
cat /etc/passwd | tail -n 1 | sed 's/d4nitrix13/Zeus/g'
```

- **Descripción:** *Reemplaza todas las ocurrencias de la palabra `d4nitrix13` por `Zeus`.*
- **Salida:**

  ```bash
  Zeus:x:1000:1000:Zeus:/home/Zeus:/bin/bash
  ```
