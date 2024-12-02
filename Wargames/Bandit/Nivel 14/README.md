<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 13 → Nivel 14***

- **Meta de nivel**

- *La contraseña para el siguiente nivel se almacena en `/etc/bandit_pass/bandit14` y sólo puede ser leída por el usuario bandit14. Para este nivel, no obtienes la siguiente contraseña, pero obtienes una clave SSH privada que se puede utilizar para iniciar sesión en el siguiente nivel. Nota: localhost es un nombre de host que se refiere a la máquina en la que estás trabajando.*
- *Comandos que puedes necesitar para resolver este nivel*

- *ssh, telnet, nc, openssl, s_client, nmap*
- **Material de lectura útil**
- *SSH/OpenSSH/Claves*

# ***Explicación detallada del proceso con SSH***

## **¿Qué es SSH y para qué sirve?**

> [!IMPORTANT]
> **SSH (Secure Shell)** *es un protocolo de red que permite realizar conexiones seguras y encriptadas entre dos dispositivos. Su principal objetivo es acceder de manera remota a un sistema, transferir archivos de forma segura o ejecutar comandos en un servidor. SSH asegura la privacidad y la integridad de los datos utilizando métodos de cifrado.*

### **Usos comunes de SSH:**

1. **Acceso remoto seguro:** *Administrar servidores o máquinas de forma remota.*
2. **Transferencia de archivos cifrada:** *A través de herramientas como `scp` o `rsync`.*
3. **Túneles SSH:** *Crear conexiones seguras para otros servicios de red.*
4. **Gestión de claves públicas y privadas:** *Implementación de autenticación sin contraseña.*

---

## **Explicación del comando y salida**

### **Generación de claves SSH con `ssh-keygen`**

El comando `ssh-keygen` se utiliza para generar un par de claves criptográficas para la autenticación SSH.

```bash
ssh-keygen
```

#### **Pasos en la salida:**

1. **Generación del par de claves**:

   ```bash
   Generating public/private ed25519 key pair.
   ```

   Se crea un par de claves: una privada y otra pública utilizando el algoritmo Ed25519, que es rápido y seguro.

2. **Ubicación del archivo de clave:**

   ```bash
   Enter file in which to save the key (/home/d4nitrix13/.ssh/id_ed25519):
   ```

   Aquí se define el archivo donde se almacenará la clave privada. Por defecto, está en `~/.ssh/id_ed25519`. Puedes presionar Enter para aceptar el valor predeterminado.

3. **Frase de paso (opcional):**

   ```bash
   Enter passphrase (empty for no passphrase):
   ```

   Se solicita una frase de paso para proteger la clave privada con una capa adicional de seguridad. Puedes dejarlo vacío si prefieres no usarla.

4. **Confirmación de frase de paso:**

   ```bash
   Enter same passphrase again:
   ```

   Se verifica que la frase de paso coincida.

5. **Confirmación de generación:**

   ```bash
   Your identification has been saved in /home/d4nitrix13/.ssh/id_ed25519
   Your public key has been saved in /home/d4nitrix13/.ssh/id_ed25519.pub
   ```

   - **Clave privada:** *Guardada en `id_ed25519`. Nunca debe compartirse.*
   - **Clave pública:** *Guardada en `id_ed25519.pub`. Esta se comparte con el servidor remoto.*

6. **Huella digital y arte ASCII:**

   ```bash
   The key fingerprint is: SHA256:CCNIhRDRbJiaX85sJQVOXlXNHu62ohhAptzJ36Tb0hM
   ```

   *La **huella digital** identifica la clave de forma única.*

   ```bash
   The key's randomart image is:
   ```

   *El arte aleatorio (randomart) es una representación visual única de la clave, útil para detectar cambios.*

---

### **Configuración de claves SSH en el servidor**

1. **Copiar clave pública al archivo `authorized_keys`:**

   ```bash
   cp id_ed25519.pub authorized_keys
   ```

   *Esto permite al servidor reconocer la clave pública como válida para la autenticación.*

---

### **Conexión SSH**

#### **Comando básico:**

```bash
ssh d4nitrix13@localhost
```

#### **Salida y explicación:**

1. **Autenticidad del host no verificada:**

   ```bash
   The authenticity of host 'localhost (127.0.0.1)' can't be established.
   ```

   *Es la primera vez que te conectas a este servidor, por lo que SSH no puede confirmar su identidad.*

2. **Huella digital del host:**

   ```bash
   ED25519 key fingerprint is SHA256:8ZMyHdhz5W+IhRgpky+1iKQFQddHEX/1gVgPtB/km3U.
   ```

   *El servidor presenta su clave pública para que confirmes si confías en ella.*

3. **Confirmación del usuario:**

   ```bash
   Are you sure you want to continue connecting (yes/no/[fingerprint])?
   ```

   *Si confías en el servidor, escribe `yes`.*

4. **Clave añadida a los hosts conocidos:**

   ```bash
   Warning: Permanently added 'localhost' (ED25519) to the list of known hosts.
   ```

   *El servidor se agrega al archivo `~/.ssh/known_hosts`, de modo que no te pedirá confirmación en futuras conexiones.*

5. **Acceso exitoso:**

   ```bash
   Welcome to Ubuntu 24.04.1 LTS
   ```

   *Ya estás conectado al sistema remoto.*

---

### **Comprobación de conexión SSH activa**

1. **Comando `lsof` para verificar el puerto 22 (SSH):**

   ```bash
   lsof -i:22
   ```

   *Esto muestra los procesos que están usando el puerto SSH. Salida:*

   ```bash
   COMMAND    PID       USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
   ssh     123555 d4nitrix13    3u  IPv4 267391      0t0  TCP localhost:48016->d4nitrix13-Inspiron-3558:ssh (ESTABLISHED)
   ```

   - **`COMMAND`:** *Nombre del proceso (`ssh`).*
   - **`PID`:** *ID del proceso.*
   - **`USER`:** *Usuario ejecutando el proceso (`d4nitrix13`).*
   - **`FD`:** *Descriptor del archivo.*
   - **`NAME`:** *Conexión establecida entre cliente y servidor.*

---

### **Conceptos importantes**

1. **Claves públicas y privadas:**
   - **Privada:** *Permanece en tu máquina. No debe compartirse.*
   - **Pública:** *Se comparte con el servidor para validar la conexión.*

2. **Known Hosts (`~/.ssh/known_hosts`):** *Registro de claves públicas de servidores confiables.*

3. **Autenticación segura:** *Permite acceso sin contraseña utilizando las claves.*

4. **Puertos SSH:** *Generalmente se usa el puerto 22.*

# ***Explicación detallada de la gestión de claves SSH y conexión sin contraseña***

## **Salida y explicación de los comandos**

### **Cerrar sesión y eliminar el archivo de claves autorizadas**

1. **Cerrar sesión:**

   ```bash
   exit
   ```

   - *Este comando cierra la sesión SSH actual.*

2. **Eliminar `authorized_keys`:**

   ```bash
   rm authorized_keys
   ```

   - *Esto elimina el archivo `authorized_keys` en el servidor, lo que revoca el acceso SSH sin contraseña utilizando las claves. Después de eliminar este archivo, se requerirá ingresar la contraseña del usuario para realizar la autenticación.*

---

### **Conexión con contraseña después de eliminar `authorized_keys`**

- *Cuando se elimina el archivo `authorized_keys`, la próxima vez que intentes conectarte por SSH, **se te pedirá la contraseña del usuario**.*

```bash
ssh $USER@$HOST
```

```bash
ssh $USER@$HOST
d4nitrix13@d4nitrix13-inspiron-3558's password:
```

- *Aquí, el sistema te solicita la **contraseña del usuario** para autenticarte, ya que la autenticación basada en claves ha sido desactivada por la eliminación del archivo `authorized_keys`.*

**Salida esperada tras ingresar la contraseña:**

```bash
Welcome to Ubuntu 24.04.1 LTS (GNU/Linux 6.8.0-49-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

El mantenimiento de seguridad expandido para Applications está desactivado

Se pueden aplicar 0 actualizaciones de forma inmediata.

8 actualizaciones de seguridad adicionales se pueden aplicar con ESM Apps.
Aprenda más sobre cómo activar el servicio ESM Apps at https://ubuntu.com/esm

Last login: Mon Nov 25 17:55:27 2024 from 127.0.0.1
➜  d4nitrix13 ~
```

---

### **Copiar la clave pública con `ssh-copy-id`**

- *El comando `ssh-copy-id` se utiliza para copiar la clave pública al servidor, permitiendo que el acceso SSH se realice sin necesidad de ingresar la contraseña cada vez.*

1. **Comando para copiar la clave pública:**

   ```bash
   ssh-copy-id -i id_ed25519 $USER@$HOST
   ```

2. **Salida del comando:**

   ```bash
   /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "id_ed25519.pub"
   /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
   /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
   d4nitrix13@d4nitrix13-inspiron-3558's password:
   Number of key(s) added: 1
   ```

   - **`-i`:** *Especifica la clave pública que se va a copiar (en este caso, `id_ed25519.pub`).*
   - *El sistema te solicita la contraseña para poder copiar la clave pública y añadirla al archivo `authorized_keys` en el servidor.*

**Salida después de la adición de la clave:**

   ```bash
   Now try logging into the machine, with:   "ssh 'd4nitrix13@d4nitrix13-Inspiron-3558'"
   and check to make sure that only the key(s) you wanted were added.
   ```

   *Ahora que la clave pública se ha copiado al servidor, puedes conectarte sin necesidad de ingresar la contraseña.*

---

### **Conexión SSH sin contraseña utilizando la clave**

*Una vez que la clave pública se ha copiado correctamente al servidor, puedes conectarte utilizando la clave sin tener que ingresar la contraseña del usuario.*

1. **Comando para conectarse usando la clave privada:**

   ```bash
   ssh -i authorized_keys $USER@$HOST
   ```

   *Aquí, en lugar de usar la clave pública `id_ed25519.pub`, se usa el archivo `authorized_keys` (que contiene las claves autorizadas) para autenticarte.*

**Salida esperada al conectarse:**

```bash
Welcome to Ubuntu 24.04.1 LTS (GNU/Linux 6.8.0-49-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

El mantenimiento de seguridad expandido para Applications está desactivado

Se pueden aplicar 0 actualizaciones de forma inmediata.

8 actualizaciones de seguridad adicionales se pueden aplicar con ESM Apps.
Aprenda más sobre cómo activar el servicio ESM Apps at https://ubuntu.com/esm

Last login: Mon Nov 25 17:57:27 2024 from 127.0.0.1
➜  d4nitrix13 ~
```

### **Resumen de los pasos y conceptos clave:**

1. **Eliminar el archivo `authorized_keys` revoca el acceso sin contraseña.**
2. **El comando `ssh-copy-id`** *facilita la instalación de claves públicas en el servidor remoto.*
3. **La opción `-i` de `ssh`** *permite especificar el archivo de clave privada para la autenticación.*
4. **Una vez copiada la clave pública,** *se puede acceder al servidor SSH sin necesidad de ingresar la contraseña.*

- *Este proceso es muy útil para automatizar conexiones seguras y hacer que la administración remota sea más eficiente y sin necesidad de recordar contraseñas.*
