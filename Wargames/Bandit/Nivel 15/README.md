<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 14 → Nivel 15***

- *Meta de nivel*

- *La contraseña del siguiente nivel se puede recuperar enviando la contraseña del nivel actual al puerto 30000 en localhost.*
- *Comandos que puedes necesitar para resolver este nivel*
- *ssh, telnet, nc, openssl, s_client, nmap*
- **Material de lectura útil**
  - *Cómo funciona Internet en 5 minutos (YouTube) (No es completamente preciso, pero es suficiente para principiantes)*
  - *Direcciones IP*
  - *Dirección IP en Wikipedia*
  - *Localhost en Wikipedia*
  - *Puertos*
  - *Puerto (redes informáticas) en Wikipedia*

## ***Explicación detallada sobre IP Addresses, Localhost y Ports***

### ***Direcciones IP (IP Addresses)***

> *Una **dirección IP (Protocolo de Internet)** es una etiqueta numérica que identifica de forma única a un dispositivo en una red que usa el protocolo IP para la comunicación. Las direcciones IP pueden ser de dos tipos:*

### **Tipos de Direcciones IP:**

1. **IPv4 (Internet Protocol version 4):**
   - *La forma más común de una dirección IP.*
   - *Está formada por cuatro bloques de números de 8 bits (entre 0 y 255), separados por puntos. Ejemplo:*

    ```bash
    192.168.1.1
    ```

   - *Tiene un espacio de direcciones limitado, lo que llevó a la creación de IPv6.*

2. **IPv6 (Internet Protocol version 6):**
   - *Una versión más nueva y extensa del protocolo, que utiliza direcciones de 128 bits.*
   - *Es representada como ocho bloques de cuatro caracteres hexadecimales, separados por dos puntos.* **Ejemplo:**

    ```bash
    2001:0db8:85a3:0000:0000:8a2e:0370:7334
    ```

   - *Ofrece un número casi ilimitado de direcciones.*

### **Uso de las Direcciones IP:**

- **En redes locales (LAN)** y **en redes globales (Internet)**.
- *Las direcciones IP permiten que los dispositivos se encuentren y se comuniquen entre sí.*

---

## **Localhost**

> ***Localhost** es un nombre que hace referencia a la **dirección IP interna de tu propio dispositivo**. Es como una referencia al "servidor local", es decir, se refiere al mismo dispositivo desde el cual estás trabajando.*

### **Dirección IP de Localhost:**

- *La dirección IP que corresponde a `localhost` es **127.0.0.1** en IPv4, y **::1** en IPv6.*
- **localhost** *permite que tu computadora se conecte a ella misma, lo cual es útil para pruebas y desarrollo de software.*

### **Uso de Localhost:**

- **Pruebas de servicios en la misma máquina:** *Si estás desarrollando una aplicación web, puedes usar `localhost` para probarla sin necesidad de estar conectado a una red externa.*
- **Bases de datos locales:** *A menudo se accede a bases de datos en `localhost` durante el desarrollo.*

### **Ejemplo de uso:**

- *Al escribir `http://localhost` en un navegador web, accederás a un servidor web que está funcionando en tu máquina local.*

---

## **Puertos (Ports)**

*Un **puerto** es un número que se utiliza en redes para identificar un servicio específico en un dispositivo o máquina. Los puertos permiten que varios servicios puedan funcionar en un solo dispositivo, utilizando diferentes números de puerto para diferenciarlos.*

### **Tipos de Puertos:**

1. **Puertos bien conocidos** (del 0 al 1023):
   - *Son utilizados por servicios importantes y conocidos en la red.*
   - *Ejemplo:*
     - **HTTP:** *80*
     - **HTTPS:** *443*
     - **FTP:** *21*
     - **SSH:** *22*

2. **Puertos registrados** (del 1024 al 49151):
   - *Estos puertos están registrados para aplicaciones específicas, pero no son tan conocidos como los anteriores.*
   - *Ejemplo:*
     - **MySQL:** *3306*
     - **PostgreSQL:** *5432*

3. **Puertos dinámicos o privados** (del 49152 al 65535):
   - *Son puertos que generalmente son utilizados por aplicaciones cliente para establecer conexiones a servicios en servidores.*
   - *Son asignados temporalmente durante la comunicación y no están reservados para servicios específicos.*

### ***Puertos en la comunicación de red:***

- **Cada servicio de red** *escucha en un puerto específico. Por ejemplo, un servidor web puede escuchar en el puerto 80 para recibir solicitudes HTTP.*
- *El número de puerto, junto con la dirección IP, define un **socket** único que identifica la comunicación entre un cliente y un servidor en la red.*

- **SSH** *(Secure Shell) usa el puerto 22 por defecto. Si deseas conectarte a un servidor mediante SSH, tu cliente SSH usará este puerto para la conexión:*

  ```bash
  ssh user@hostname -p 22
  ```

- **Acceso a un servidor web local:** *Si tienes un servidor web corriendo en tu máquina en el puerto 8080, puedes acceder a él usando:*

  ```bash
  http://localhost:8080
  ```

---

### **Resumen de Conceptos:**

- **Dirección IP:** *Identificación única de un dispositivo en una red.*
- **Localhost:** *Hace referencia a tu propia máquina (127.0.0.1), usada principalmente para pruebas y desarrollo local.*
- **Puerto:** *Un número utilizado para identificar servicios específicos en un dispositivo para establecer conexiones de red.*

# ***Explicación detallada de los comandos y procedimientos***

## **1. Comando `netstat -nat`**

### **Descripción:**

- **`netstat`** *es una herramienta de red que muestra las conexiones de red y las estadísticas de las interfaces de red en un sistema.*
- *La opción **`-n`** muestra las direcciones y puertos de manera numérica (sin resolver nombres de host o servicios).*
- *La opción **`-a`** muestra todas las conexiones y puertos de escucha.*
- *La opción **`-t`** filtra para mostrar solo las conexiones TCP.*

### **Salida esperada:**

- *El comando muestra todas las conexiones activas y los puertos en los que tu máquina está escuchando para las conexiones entrantes, como:*

- *Estado de las conexiones.*
- *Dirección local y remota (dirección IP y puerto).*
- *Estado (LISTENING, ESTABLISHED, etc.).*

---

## **2. Comando `ss`**

- *El comando **`ss`** es una herramienta más moderna y eficiente que `netstat` para mostrar estadísticas de sockets. Es útil para obtener información más rápida sobre las conexiones de red activas y las interfaces de escucha.*

- **`ss`** *es similar a `netstat`, pero más rápido y con más opciones detalladas para mostrar información sobre puertos y conexiones.*

---

## **3. Comando `python3 -m http.server 3000`**

- *Este comando inicia un **servidor web** simple utilizando Python en el **puerto 3000**. El servidor sirve archivos desde el directorio actual en el que se ejecuta el comando.*

- **`python3 -m http.server`:** *Lanza un servidor HTTP básico en Python.*
- **`3000`:** *Especifica el puerto en el cual el servidor escuchará (en este caso, el puerto 3000).*

- *El servidor se ejecuta y comienza a escuchar en el puerto 3000, proporcionando una interfaz de servidor web simple que puede ser accedida desde un navegador:*

```bash
Serving HTTP on 0.0.0.0 port 3000 (http://0.0.0.0:3000/) ...
```

---

## **4. Comando `lsof -i:3000`**

**`lsof`** *(List Open Files) es una herramienta que muestra los archivos abiertos y los procesos que los están usando. El **`-i`** especifica que se deben mostrar las conexiones de red.*

- **`-i:3000`** *filtra las conexiones que están usando el puerto 3000.*

- *La salida muestra el proceso que está utilizando el puerto 3000. En este caso, **`python3`** está escuchando en el puerto 3000:*

```bash
COMMAND    PID       USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
python3 269967 d4nitrix13    3u  IPv4 604042      0t0  TCP *:3000 (LISTEN)
```

- **PID:** *ID del proceso.*
- **USER:** *Usuario que ejecuta el proceso.*
- **FD:** *Descriptor de archivo (en este caso, es un socket de red).*
- **TCP *:3000 (LISTEN):** *El servidor está escuchando en el puerto 3000 para conexiones entrantes.*

---

## **5. Comando `pwdx 269967`**

- *El comando **`pwdx`** muestra el directorio de trabajo actual de un proceso dado por su PID.*

- **`269967`** *es el ID del proceso que corresponde al servidor Python ejecutándose en el puerto 3000.*

```bash
269967: /home/d4nitrix13
```

- *Esto indica que el proceso con ID `269967` (servidor Python) está ejecutándose en el directorio `/home/d4nitrix13`.*

---

## **6. Comando `lsof -i:5000`**

- *Similar a `lsof -i:3000`, este comando muestra los procesos que están utilizando el **puerto 5000**. En este caso, se utiliza **`nc`** (Netcat), una herramienta de red, que está escuchando en el puerto 5000.*

```bash
COMMAND    PID       USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
nc      273892 d4nitrix13    3u  IPv4 615095      0t0  TCP *:5000 (LISTEN)
```

**`nc`** *está escuchando en el puerto 5000 para conexiones entrantes.*

---

## **7. Comando `pwdx 273892`**

- *Muestra el directorio de trabajo del proceso con ID `273892` (en este caso, **`nc`**).*

```bash
273892: /home/d4nitrix13/Escritorio
```

- *El proceso **`nc`** está ejecutándose en el directorio `/home/d4nitrix13/Escritorio`.*

---

## **8. Comando de conexión `echo "" >/dev/tcp/127.0.0.1/30000`**

- *Este comando utiliza la característica de **redirección especial en bash** para realizar una conexión TCP al puerto 30000 de la máquina local (localhost).*

- **`/dev/tcp`:** *Es una forma especial de redirigir la salida a un puerto en particular a través de TCP.*
- *Si el puerto está **abierto** y acepta conexiones, el comando tendrá éxito.*

### **Salida esperada (Puerto Abierto):**

```bash
[*] Puerto Abierto
```

*El puerto 30000 está abierto y acepta conexiones.*

---

## **9. Comando de conexión `echo "" >/dev/tcp/127.0.0.1/50000`**

- *Intenta conectar al puerto 50000 de localhost utilizando la misma redirección especial.*

### **Salida esperada (Puerto Cerrado):**

```bash
-bash: connect: Connection refused
-bash: /dev/tcp/127.0.0.1/50000: Connection refused
```

*El puerto 50000 está cerrado, por lo que la conexión es rechazada.*

---

## **10. Comando `bash -c 'echo "" >/dev/tcp/127.0.0.1/50000' 2>/dev/null && echo "[*] Puerto Abierto" || echo "[x] Puerto Cerrado"`**

- *Este comando ejecuta la conexión TCP al puerto 50000 y maneja el error si la conexión es rechazada.*

- **`2>/dev/null`** *redirige cualquier error a **`/dev/null`** (lo descarta).*
- *Si la conexión tiene éxito, muestra **"[Puerto Abierto]"**, de lo contrario, muestra **"[Puerto Cerrado]"**.*

```bash
[x] Puerto Cerrado
```

---

## **11. Comando `cat /etc/bandit_pass/bandit14 | nc localhost 30000`**

- *Este comando utiliza **Netcat (`nc`)** para enviar el contenido de un archivo (en este caso, la contraseña de **bandit14**) al puerto 30000 en localhost.*

```bash
Correct!
8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
```

- *El comando transmite la contraseña correcta para acceder al siguiente nivel.*

---

## **12. Comando `telnet localhost 30000`**

**Telnet** *es una herramienta para acceder a servicios remotos en una red. En este caso, se conecta al puerto 30000 en* **localhost.**

```bash
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
Correct!
8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
Connection closed by foreign host.
```

- *Telnet conecta con éxito al puerto 30000, muestra la contraseña y luego cierra la conexión.*

---

### **Resumen de conceptos clave:**

- **`netstat` y `ss`:** *Herramientas para ver las conexiones de red activas.*
- **`python3 -m http.server`:** *Inicia un servidor HTTP en el puerto especificado.*
- **`lsof`:** *Muestra qué procesos están usando un puerto específico.*
- **`nc`:** *Herramienta para crear conexiones TCP/UDP.*
- **`/dev/tcp`:** *Método para realizar conexiones TCP directamente desde bash.*
