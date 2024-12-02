<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 16 → Nivel 17***

- *Meta de nivel*

- *Las credenciales para el siguiente nivel se pueden recuperar enviando la contraseña del nivel actual a un puerto en localhost en el rango 31000 a 32000. Primero averigua cuáles de estos puertos tienen un servidor escuchando en ellos. Luego averigua cuáles de ellos hablan SSL/TLS y cuáles no. Sólo hay 1 servidor que dará las siguientes credenciales, los demás simplemente te devolverán lo que le envíes.*

- *Nota útil: ¿Recibes «DONE», «RENEGOTIATING» o «KEYUPDATE»? Lee la sección «COMANDOS CONECTADOS» *en la página de manual.*

- *Comandos que puede necesitar para resolver este nivel*

- *ssh, telnet, nc, ncat, socat, openssl, s_client, nmap, netstat, ss*
- *Material de lectura útil*

- *Escáner de puertos en Wikipedia*

# ***Explicación detallada del proceso***

## ***1. Visualización del archivo `id_rsa`:***

```bash
ls -l id_rsa
-rw-rw-r-- 1 bandit16 bandit16 1675 Nov 27 02:13 id_rsa
```

- **Comando:** *`ls -l id_rsa`*
- **Salida:**
  - **`-rw-rw-r--`:** *Los permisos actuales son:*
    - **`rw-`:** *El propietario (`bandit16`) puede leer y escribir el archivo.*
    - **`rw-`:** *El grupo (`bandit16`) también tiene permisos de lectura y escritura.*
    - **`r--`:** *Otros usuarios solo pueden leer el archivo.*
  - **Tamaño del archivo:** *1675 bytes.*
  - **Fecha:** *Última modificación fue el 27 de noviembre a las 02:13.*

---

## **2. Identificación del tipo de archivo:**

```bash
file id_rsa
id_rsa: PEM RSA private key
```

- **Comando:** *`file id_rsa`*
- **Descripción:** *El archivo `id_rsa` es una **clave privada RSA** en formato PEM, comúnmente utilizada para autenticación en SSH.*

---

## **3. Búsqueda del archivo y verificación de permisos:**

```bash
find ./ -name id_rsa -printf "%f\t%m\n"
```

```bash
find ./ -name id_rsa -printf "%f\t%m\n"
id_rsa  664
```

- **Comando:** *`find ./ -name id_rsa -printf "%f\t%m\n"`*
  - **`%f`:** *Muestra el nombre del archivo (`id_rsa`).*
  - **`%m`:** *Muestra los permisos del archivo (en este caso `664`).*
- **Resultado:** *El archivo tiene permisos `664`, lo que significa:*
  - **6 (rw-):** *El propietario puede leer y escribir.*
  - **6 (rw-):** *El grupo puede leer y escribir.*
  - **4 (r--):** *Otros usuarios solo pueden leer.*

---

## **4. Ajuste de permisos (modo seguro):**

```bash
chmod 600 id_rsa
```

- **Comando:** *`chmod 600 id_rsa`*
  - *Cambia los permisos del archivo a **600**, es decir:*
    - **6 (rw-):** *Solo el propietario puede leer y escribir.*
    - **0 (---):** *Ni el grupo ni otros usuarios tienen permisos.*

---

## **5. Verificación de permisos actualizados:**

```bash
ls -l id_rsa
-rw------- 1 bandit16 bandit16 1675 Nov 27 02:13 id_rsa
```

- **Nuevo resultado:** *`-rw-------` confirma que solo el propietario tiene acceso de lectura y escritura. Este es el permiso correcto para una clave privada, asegurando que otros usuarios no puedan acceder a ella.*

---

## **6. Conexión SSH con la clave privada:**

```bash
ssh -i id_rsa bandit17@localhost -p 2220
```

- **Comando:** *`ssh -i id_rsa bandit17@localhost -p 2220`*
  - **`-i id_rsa`:** *Especifica el uso de la clave privada `id_rsa`.*
  - **`bandit17@localhost`:** *Se conecta al usuario `bandit17` en la máquina local.*
  - **`-p 2220`:** *Utiliza el puerto 2220, que es el puerto por defecto para el reto Bandit.*

---

### **Resumen:**

- *Se ajustaron los permisos de la clave privada a **600** para protegerla de accesos no autorizados.*
- *La clave se usó para conectarse al siguiente nivel (`bandit17`) mediante SSH en el puerto 2220. Esto es esencial para mantener la seguridad de la clave y cumplir con los requisitos del sistema SSH.*

### **Explicación del código paso a paso**

### **1. Escaneo de puertos con `nmap` y creación de una lista:**

```bash
list=($(nmap --open -T5 -vvv -n -p31000-32000 127.0.0.1 | grep -Eo '^[0-9]+/tcp' | cut -d'/' -f1))
```

- **`nmap --open -T5 -vvv -n -p31000-32000 127.0.0.1`:**  
  - *Escanea los puertos entre **31000 y 32000** en la dirección **127.0.0.1** (localhost).*
  - **`--open`:** *Muestra solo los puertos abiertos.*
  - **`-T5`:** *Utiliza la máxima velocidad de escaneo.*
  - **`-vvv`:** *Nivel de detalle muy alto en la salida.*
  - **`-n`:** *No realiza resolución de nombres (más rápido).*
  - **`-p31000-32000`:** *Especifica el rango de puertos.*

- **`grep -Eo '^[0-9]+/tcp'`:**  
  *Filtra la salida de `nmap` para capturar líneas que comienzan con números seguidos de `/tcp`.*

- **`cut -d'/' -f1`:**  
  *Corta las líneas filtradas y se queda solo con el número del puerto, eliminando el `/tcp`.*

- **Resultado:**  
  *La variable `list` contendrá un **array** con los números de los puertos abiertos en el rango especificado.*

---

### **2. Lectura de la contraseña:**

```bash
password=$(cat /etc/bandit_pass/bandit16)
```

- **Comando:** *`cat /etc/bandit_pass/bandit16`*
- **Descripción:** *Lee la contraseña del archivo correspondiente al usuario `bandit16` y la almacena en la variable `password`.*

---

### **3. Inicialización de la variable `ok`:**

```bash
ok="False"
```

- **Descripción:** *Inicializa la variable `ok` con el valor `"False"`. Se usará más adelante para controlar el flujo del script y verificar si se encuentra el puerto correcto.*

---

### **4. Bucle `for` para probar los puertos:**

```bash
for port in "${list[@]}"; do
  echo -e "\n[*] Probing port: $port"
```

- **`for port in "${list[@]}"`:**  
  *Itera sobre cada puerto almacenado en la lista `list`.*

- **`echo -e "\n[*] Probing port: $port"`:**  
  *Imprime un mensaje indicando el puerto que está siendo probado, con un salto de línea al inicio para mejorar la legibilidad.*

---

### **Lo que hace el script en conjunto:**

1. *Escanea los puertos abiertos en el rango 31000-32000 en `localhost`.*
2. *Crea una lista de puertos abiertos (`list`).*
3. *Lee la contraseña del archivo correspondiente (`password`).*
4. *Inicia un bucle para imprimir y probar cada puerto encontrado, preparando el entorno para posteriores conexiones o validaciones.*

---

### **Siguiente paso esperado:**

- *El script probablemente intentará conectarse a cada puerto usando la contraseña leída, lo cual podría implicar comandos adicionales (como `openssl` o `nc`) en las siguientes líneas.*

### **Significado de** ` "${list[@]}" `

- **`${list[@]}`:** *Esta expresión en **Bash** hace referencia a **todos los elementos de un array** (`list`) como una lista de valores separados por espacios. Cada elemento se trata como una unidad independiente.*
- **`"${list[@]}"` (con comillas dobles):** *Asegura que cada elemento del array se preserve como una sola unidad, incluso si contiene espacios o caracteres especiales.*

---

### **Ejemplo práctico:**

```bash
list=("puerto1" "puerto 2" "puerto3")
for i in "${list[@]}"; do
  echo "$i"
done
```

- **Salida:**

  ```bash
  puerto1
  puerto 2
  puerto3
  ```

- **Sin las comillas, el segundo elemento se dividiría en dos partes:**

```bash
for i in ${list[@]}; do
  echo "$i"
done
```

- **Salida incorrecta:**

  ```bash
  puerto1
  puerto
  2
  puerto3
  ```

---

### **¿Por qué usar paréntesis y el signo `$` para crear una lista?**

```bash
list=($(nmap --open ...))
```

- **Paréntesis `()`:** *Sirven para **crear y llenar un array** en Bash. Los elementos dentro se separan por espacios.*
- **Dólar `$`:** *Ejecuta el comando dentro de los paréntesis y captura su salida. Cada palabra o línea se convierte en un elemento del array.*

---

### **Ejemplo para aclarar:**

```bash
list=(1 2 3 4)
```

*Esto crea un array con los elementos `1`, `2`, `3`, y `4`.*

```bash
list=($(echo "a b c"))
```

- *Aquí, **`$(...)`** ejecuta `echo "a b c"`, y Bash asigna cada palabra como un elemento del array.*

---

### **Conclusión:**

- **`"${list[@]}"`** *permite iterar sobre cada elemento del array, tratándolos como unidades completas.*
- *Usar paréntesis con `$()` es necesario para ejecutar comandos y capturar su salida como elementos de una lista.*

> [!IMPORTANT]
> *El término correcto para referirse a un **archivo de identidad autorizada en SSH** es:*

### **`authorized_keys`**

- **Descripción:** *Este archivo contiene las **claves públicas** de los usuarios autorizados para conectarse a una cuenta a través de SSH. Se encuentra normalmente en el directorio `~/.ssh/` del usuario en el servidor remoto.*

- **Ruta típica:**

  ```bash
  ~/.ssh/authorized_keys
  ```

- **Función:** *Cuando un usuario intenta conectarse mediante SSH, el servidor compara la clave pública en este archivo con la clave privada del cliente. Si coinciden, la autenticación se permite.*
