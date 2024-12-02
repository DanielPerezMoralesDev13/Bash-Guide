<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 20 → Nivel 21***

- **Meta de nivel**

- *Hay un binario setuid en el homedirectory que hace lo siguiente: establece una conexión con localhost en el puerto que especifiques como argumento en la línea de comandos. Luego lee una línea de texto de la conexión y la compara con la contraseña del nivel anterior (bandit20). Si la contraseña es correcta, transmitirá la contraseña para el siguiente nivel (bandit21).*

- *NOTA: Prueba a conectarte a tu propio demonio de red para ver si funciona como crees*
- *Comandos que puedes necesitar para resolver este nivel*
- *ssh, nc, cat, bash, screen, tmux, Unix 'control de trabajos' (bg, fg, jobs, &, CTRL-Z, ...)*

## **Meta del Nivel**  

- *El objetivo es usar el binario `suconnect` en el directorio del usuario `bandit20`, que se conecta a **localhost** en un puerto especificado y compara una línea de texto recibida con la contraseña anterior (`bandit20`).*
- *Si la contraseña es correcta, devuelve la contraseña para el siguiente nivel (`bandit21`).*

---

### **Inspección del binario `suconnect`:**

```bash
bandit20@bandit:~$ ls -l
-rwsr-x--- 1 bandit21 bandit20 15604 Sep 19 07:08 suconnect
```

- **`-rwsr-x---`:** *Indica que el binario tiene el bit `setuid` activado y es ejecutable con los permisos del propietario (`bandit21`).*
- **Propietario:** *`bandit21`*
- **Grupo:** *`bandit20`*
- **Significado:** *Al ejecutarse, el binario `suconnect` correrá con privilegios del usuario `bandit21`, permitiendo acceder a la contraseña del siguiente nivel.*

---

## **Uso del binario `suconnect`:**

```bash
bandit20@bandit:~$ ./suconnect
Usage: ./suconnect <portnumber>
This program will connect to the given port on localhost using TCP. If it receives the correct password from the other side, the next password is transmitted back.
```

- **Función:** *Se conecta a un puerto en `localhost` y espera recibir la contraseña actual (`bandit20`).*
- Si la contraseña es correcta, devuelve la contraseña del siguiente nivel.

---

### **Resolución paso a paso:**

#### **1. Iniciar un servidor en un puerto local con `nc` (Netcat):**

   ```bash
   bandit20@bandit:~$ nc -nlvp 5757
   Listening on 0.0.0.0 5757
   ```

- **`-n`:** *No resuelve nombres de host.*
- **`-l`:** *Modo escucha.*
- **`-v`:** *Modo verbose (detallado).*
- **`-p 5757`:** *Escucha en el puerto **5757**.*

#### **2. Ejecutar el binario `suconnect` especificando el puerto:**

   ```bash
   bandit20@bandit:~$ ./suconnect 5757
   ```

- *Esto establece una conexión con el servidor Netcat en el puerto **5757**.*

#### **3. Interacción entre `suconnect` y Netcat:**

- *Cuando el binario se conecta, Netcat mostrará la conexión:*

   ```bash
   Connection received on 127.0.0.1 36682
   ```

#### **4. Enviar la contraseña del nivel actual:**  

   *Desde la sesión de Netcat, envía la contraseña (`bandit20`):*

   ```bash
   0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
   ```

#### **5. Recibir la contraseña del siguiente nivel:**

   *Si la contraseña es correcta, `suconnect` responde con la contraseña de `bandit21`:*

   ```bash
   EeoULMCra2q0dSkYj561DX7s1CpBuOBt
   ```

- **`suconnect`** *es un binario que usa un puerto local para autenticar la contraseña del nivel actual.*
- *La contraseña correcta se envía a través de una conexión TCP, y el binario devuelve la nueva contraseña si coincide.*
- **Netcat (`nc`)** *es una herramienta útil para simular la conexión requerida y enviar la contraseña adecuada.*

# **Significado del comando y salida: `file suconnect`**

- *El comando **`file`** en Linux se utiliza para determinar el tipo de archivo mediante el análisis de su contenido. La salida proporciona información detallada sobre el binario **`suconnect`**.*

---

## **Análisis detallado de la salida:**

```bash
suconnect: setuid ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, BuildID[sha1]=4c95669a71860e303b714721dde9020213ad3c9a, for GNU/Linux 3.2.0, not stripped
```

---

### **Desglose de la salida:**

1. **`setuid`:**
   - *Indica que el binario tiene el bit `setuid` activado,* *lo que significa que cuando se ejecuta, el programa adopta los privilegios del propietario (en este caso, del usuario `bandit21`).*

2. **`ELF`** *(Executable and Linkable Format):*
   - *Formato estándar de archivos ejecutables en sistemas Unix/Linux. Es el formato que el sistema operativo entiende para ejecutar programas.*

3. **`32-bit`:**
   - *El binario está compilado para arquitecturas de 32 bits, es decir, puede ejecutarse en sistemas que soporten este modo.*

4. **`LSB (Least Significant Byte)`:**
   - *La arquitectura usa el orden de bytes LSB, lo que significa que el byte menos significativo se almacena primero (endianess).*

5. **`Intel 80386`:**
   - *El programa está diseñado para ejecutarse en procesadores compatibles con la arquitectura x86 (i386).*

6. **`version 1 (SYSV)`:**
   - *El binario sigue las convenciones de la ABI (Application Binary Interface) del System V*.

7. **`dynamically linked`:**
   - *El binario se enlaza dinámicamente, lo que significa que depende de bibliotecas externas para funcionar. Estas bibliotecas se cargan en tiempo de ejecución.*

8. **`interpreter /lib/ld-linux.so.2`:**
   - *Especifica el cargador dinámico (interpreter), encargado de cargar las bibliotecas necesarias para el programa.*

9. **`BuildID[sha1]`:**
   - *El identificador único del binario basado en SHA1. Permite rastrear y verificar la integridad del archivo.*

10. **`for GNU/Linux 3.2.0`:**
    - *El binario fue compilado para ejecutarse en sistemas Linux con el kernel 3.2.0 o superior.*

11. **`not stripped`:**
    - **El binario no está "stripped",** *lo que significa que aún contiene símbolos de depuración y otra información útil para análisis y debugging.*

- *El archivo **`suconnect`** es un ejecutable de 32 bits en formato ELF, diseñado para sistemas Linux. Tiene el bit **`setuid`** activado, lo que permite que se ejecute con privilegios elevados (del propietario). Está enlazado dinámicamente y usa el cargador `/lib/ld-linux.so.2` para ejecutar el programa en tiempo de ejecución.*
