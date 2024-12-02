<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 24 → Nivel 25***

- *Objetivo de nivel*

- *Un demonio está escuchando en el puerto 30002 y te dará la contraseña para bandit25 si se le da la contraseña para bandit24 y un pincode secreto numérico de 4 dígitos. No hay forma de recuperar el código PIN excepto repasando todas las 10000 combinaciones, lo que se conoce como forzar de forma bruta.*
- *No es necesario crear nuevas conexiones cada vez.*

---

## **Objetivo del Nivel:**

- *Debes conectarte a un servicio que escucha en el puerto `30002`. El servicio solicita:*

1. *La **contraseña** de Bandit24.*
2. *Un **PIN** de 4 dígitos.*

*El desafío es forzar el PIN probando todas las combinaciones posibles (0000-9999) mediante un ataque de fuerza bruta.*

---

## **Pasos detallados:**

### **1. Preparar el entorno:**

```bash
cd $(mktemp -d)
touch script.sh
chmod u+x script.sh
nano script.sh
```

- **`mktemp -d`:** *Crea un directorio temporal único y cambia a él.*
- **`touch script.sh`:** *Crea el archivo del script.*
- **`chmod u+x script.sh`:** *Da permisos de ejecución al script.*
- **`nano script.sh`:** *Abre el script para editarlo.*

---

### **2. Crear el script para generar combinaciones:**

**Contenido del script:**

```bash
#!/usr/bin/env bash

for i in {0000..9999}; do echo "gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8 $i"; done
```

#### **Explicación:**

- **`for i in {0000..9999}`:** *Genera todos los números entre `0000` y `9999`.*
- **`echo "gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8 $i"`:** *Imprime la contraseña de Bandit24 junto con cada PIN en el formato que el servicio espera.*

---

### **3. Generar el diccionario:**

```bash
./script.sh > dictionary.txt
```

- **Ejecución del script** y guarda la salida en `dictionary.txt`, un archivo que contiene todas las combinaciones posibles de contraseña y PIN.

#### **Verificar el archivo:**

```bash
wc -l dictionary.txt
```

**Salida:**

```bash
10000 dictionary.txt
```

- **wc -l:** *Cuenta el número de líneas en el archivo, confirmando que tiene 10,000 combinaciones.*

---

### **4. Enviar las combinaciones al servicio usando `nc`:**

```bash
cat dictionary.txt | nc localhost 30002 | grep -iEv "Wrong|Please" | head -n 2 | tail -n 1 | awk 'NF{print $NF}'
```

#### **Explicación detallada:**

- **`cat dictionary.txt`:** *Lee todas las combinaciones generadas.*
- **`nc localhost 30002`:** *Conecta al servicio en el puerto 30002 y envía las combinaciones.*
- **`grep -iEv "Wrong|Please"`:** *Filtra las respuestas, eliminando aquellas que contienen "Wrong" o "Please".*
- **`head -n 2 | tail -n 1`:** *Toma la segunda línea relevante de la salida, que es donde aparece la contraseña correcta.*
- **`awk 'NF{print $NF}'`:** *Extrae y muestra la última palabra de la línea, que es la **contraseña para el siguiente nivel**.*

---

### **5. Resultado:**

- *La salida final es la contraseña para **Bandit25**:*

```bash
iCi86ttT4KSNe1armKiwbQNmB3YJP3q4
```

---

### **Resumen:**

- *Este nivel se resuelve creando un script que genera todas las combinaciones posibles de un PIN de 4 dígitos, junto con la contraseña de Bandit24. El script envía cada combinación al servicio en el puerto `30002` utilizando **netcat** (`nc`). Finalmente, se filtra la salida para obtener la contraseña correcta mediante herramientas como **grep**, **head**, **tail** y **awk**.*
