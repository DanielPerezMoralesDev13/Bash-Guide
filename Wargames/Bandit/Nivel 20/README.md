<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 19 → Nivel 20***

- **Objetivo de nivel**

- *Para acceder al siguiente nivel, debes utilizar el binario setuid en el homedirectory. Ejecútalo sin argumentos para saber cómo utilizarlo. La contraseña para este nivel se encuentra en el lugar habitual (/etc/bandit_pass), después de haber utilizado el binario setuid.*
- **Material de lectura útil**
- **setuid en Wikipedia**

## **¿Qué es `setuid` y para qué sirve?**

**`setuid` (Set User ID)** *es un permiso especial en los sistemas operativos tipo Unix/Linux que permite a un usuario ejecutar un archivo con los privilegios del propietario del archivo, en lugar de sus propios privilegios. Este mecanismo es útil para otorgar acceso controlado a recursos o funciones que normalmente requerirían privilegios más altos, como los de **root**.*

---

### **Funcionamiento del bit `setuid`:**

- *Cuando un archivo ejecutable tiene el bit `setuid` activado, el sistema cambia temporalmente el **ID de usuario efectivo** al del propietario del archivo durante la ejecución.*
- *Esto significa que si un usuario normal ejecuta un archivo con `setuid` y el propietario es **root**, el archivo se ejecutará con privilegios de **root**.*

---

### **Uso y propósito de `setuid`:**

1. **Acceso a recursos restringidos:**
   - *Permite que los usuarios accedan a recursos o funciones que normalmente estarían restringidos, sin necesidad de otorgar permisos completos de administrador.*

2. **Ejemplos comunes:**
   - **`passwd`:** *El comando para cambiar contraseñas en Linux tiene el bit `setuid` activado y está propiedad de **root**. Esto es necesario porque el archivo `/etc/shadow` que almacena las contraseñas encriptadas solo es accesible por **root**.*

    ```bash
    ls -l /usr/bin/passwd
    -rwsr-xr-x 1 root root 54232 Mar 15  2023 /usr/bin/passwd
    ```

    - *El carácter **`s`** en lugar de la **`x`** indica que el bit `setuid` está activado.*

3. **Seguridad controlada:**
   - *Permite realizar tareas específicas con permisos elevados sin otorgar acceso total al sistema, minimizando riesgos.*

---

### **Cómo se activa el bit `setuid`:**

*El bit `setuid` se activa con el comando **`chmod`** y el número octal **4**.*

```bash
chmod u+s archivo
```

- **O usando el modo octal:**

```bash
chmod 4755 archivo
```

#### ***Ejemplo***

```bash
ls -l archivo
-rwxr-xr-x 1 usuario usuario 12345 nov 27 12:00 archivo

chmod u+s archivo

ls -l archivo
-rwsr-xr-x 1 usuario usuario 12345 nov 27 12:00 archivo
```

---

### **Riesgos de `setuid`:**

- **Explotación de vulnerabilidades:** *Si un archivo con `setuid` tiene fallos de seguridad, un atacante podría obtener privilegios elevados.*
- **Mal uso:** *Archivos con permisos incorrectos pueden permitir el acceso a recursos sensibles.*

- *Por esta razón, se recomienda usar `setuid` solo cuando sea absolutamente necesario y con archivos que se hayan revisado cuidadosamente.*

---

### ***Resumen:***

- **`setuid`** *es un permiso especial que permite ejecutar archivos con los privilegios del propietario, no del usuario que lo ejecuta.*
- *Es útil para tareas que requieren permisos elevados, como cambiar contraseñas.*
- *Debe manejarse con cuidado debido a los riesgos de seguridad asociados.*

## **Objetivo del nivel**  

*El objetivo es usar el binario `bandit20-do`, que tiene el bit `setuid` activado, para ejecutar comandos como el usuario `bandit20` y obtener la contraseña almacenada en el archivo `/etc/bandit_pass/bandit20`.*

---

## **Análisis del directorio y del archivo `bandit20-do`:**

```bash
bandit19@bandit:~$ ll
total 36
drwxr-xr-x  2 root     root      4096 Sep 19 07:08 ./
drwxr-xr-x 70 root     root      4096 Sep 19 07:09 ../
-rwsr-x---  1 bandit20 bandit19 14880 Sep 19 07:08 bandit20-do*
-rw-r--r--  1 root     root       220 Mar 31  2024 .bash_logout
-rw-r--r--  1 root     root      3771 Mar 31  2024 .bashrc
-rw-r--r--  1 root     root       807 Mar 31  2024 .profile
```

- **`bandit20-do`**:
  - *Es un archivo ejecutable con el bit **`setuid`** activado (**`-rwsr-x---`**), lo que significa que se ejecutará con los permisos del propietario (`bandit20`), incluso si lo ejecuta el usuario `bandit19`.*
  
- **Propietario**: *El archivo es propiedad del usuario `bandit20` y del grupo `bandit19`.*

---

### **Identificación del binario:**

```bash
bandit19@bandit:~$ file bandit20-do
bandit20-do: setuid ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, BuildID[sha1]=368cd8ac4633fabdf3f4fb1c47a250634d6a8347, for GNU/Linux 3.2.0, not stripped
```

- *El archivo es un ejecutable ELF de 32 bits con el bit `setuid` habilitado y dinámicamente enlazado.*

---

## **Uso básico del binario `bandit20-do`:**

```bash
bandit19@bandit:~$ ./bandit20-do
Run a command as another user.
  Example: ./bandit20-do id
```

- **Descripción:** *El binario permite ejecutar comandos como el usuario `bandit20`.*

---

### **Ejecutando comandos básicos:**

```bash
bandit19@bandit:~$ ./bandit20-do id
uid=11019(bandit19) gid=11019(bandit19) euid=11020(bandit20) groups=11019(bandit19)
```

- *El UID sigue siendo el de `bandit19`, pero el **UID efectivo (euid)** es `bandit20`, lo que significa que el comando se ejecuta con permisos de `bandit20`.*

```bash
bandit19@bandit:~$ ./bandit20-do whoami
bandit20
```

- *Confirma que el comando se ejecuta con los permisos de `bandit20`.*

---

### **Problema con shells:**

```bash
bandit19@bandit:~$ ./bandit20-do bash
bash-5.2$ whoami
bandit19
```

- *Aunque `bash` se inicia, el usuario sigue siendo `bandit19` debido a que el shell intenta reiniciar el UID efectivo.*

---

## **Solución: Usar el flag `-p` (privileged):**

*El flag `-p` evita que el shell reinicie el UID efectivo, permitiendo mantener los privilegios de `bandit20`.*

```bash
bandit19@bandit:~$ ./bandit20-do bash -p
bash-5.2$ whoami
bandit20
```

- *Ahora el shell mantiene los privilegios de `bandit20`.*

---

### **Ejecutando `sh` con privilegios:**

```bash
bandit19@bandit:~$ ./bandit20-do sh -p
$ whoami
bandit20
```

---

## **Obtención de la contraseña:**

*Finalmente, puedes usar el binario para leer el archivo que contiene la contraseña del siguiente nivel:*

```bash
bandit19@bandit:~$ ./bandit20-do cat /etc/bandit_pass/bandit20
0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
```

- *El binario `bandit20-do` es un ejecutable con el bit `setuid` que permite ejecutar comandos como el usuario `bandit20`.*
- *El flag `-p` es esencial para mantener privilegios elevados al iniciar un shell.*
- *La contraseña del siguiente nivel se obtiene ejecutando el comando adecuado con este binario.*

### **¿Qué significa UID?**

- *UID significa User Identifier (Identificador de Usuario). Es un número único asignado a cada usuario en un sistema operativo tipo Unix/Linux para identificarlos de manera interna.*
- **Propósito del UID:**

  - *El UID se utiliza para gestionar y controlar el acceso a los recursos del sistema (archivos, procesos, etc.).*
  - *En un sistema Unix/Linux, cada usuario tiene un UID único, que es asignado cuando el usuario es creado.*

---

### **Tipos de UID:**

1. **UID real (ruid):**  
   - *Identifica al usuario que inició el proceso.*  
   - *Permite saber quién es el dueño original del proceso.*  

2. **UID efectivo (euid):**  
   - *Determina los permisos que el proceso tiene mientras se está ejecutando.*  
   - *Este puede ser diferente del UID real si el archivo ejecutable tiene el bit `setuid` activado.*  

3. **UID de guardián (suid):**  
    - **El ID de guardián (suid)** *se usa como un respaldo temporal para guardar el UID efectivo original cuando un proceso cambia de permisos, permitiendo volver a esos permisos si es necesario.*
    - *Esto ayuda a realizar cambios controlados en los privilegios sin perder el acceso a los permisos originales.*

4. **UID de Grupo (gid):**
    - *Similar al UID, pero asociado a los grupos de usuarios en lugar de los usuarios individuales. Cada grupo tiene un GID único.*

---

### ***Ejemplo de cómo se usan los UID en un sistema:***

- *Cuando un usuario ejecuta un comando, el sistema operativo usa el UID real (ruid) para identificarlo y asegurar que tiene los permisos necesarios. Sin embargo, si el comando tiene el bit setuid activado, el UID efectivo (euid) cambiará al UID del propietario del archivo, permitiendo que el proceso se ejecute con los privilegios de ese propietario (por ejemplo, root).*

### **Ejemplo de funcionamiento:**

1. **Proceso normal:**

   - *Si un usuario llamado `usuario1` ejecuta un programa sin `setuid`, ambos UID serán iguales:*

   ```bash
   $ id
   uid=1001(usuario1) gid=1001(usuario1) groups=1001(usuario1)
   ```

   - *UID real (ruid) y UID efectivo (euid) = `1001`.*

2. **Proceso con `setuid`:**

   - *Si un archivo tiene el bit **`setuid`** activado y es propiedad de `root`, el UID efectivo cambiará:*

   ```bash
   $ ls -l /usr/bin/passwd
   -rwsr-xr-x 1 root root 54232 Mar 15  2023 /usr/bin/passwd
   ```

   **Al ejecutar `passwd`:**

   ```bash
   $ /usr/bin/passwd
   uid=1001(usuario1) euid=0(root)
   ```

   - *El UID real sigue siendo `1001` (`usuario1`), pero el UID efectivo es `0` (`root`), permitiendo acceso a recursos restringidos.*

---

### **¿Por qué es importante el euid?**

- **Seguridad controlada:**  
   *Permite que un usuario normal ejecute tareas específicas con privilegios elevados sin tener acceso completo al sistema.*  

- **Gestión de permisos:**  
   *El euid asegura que solo los permisos necesarios se otorguen temporalmente durante la ejecución de un proceso.*  

- *El **UID efectivo (euid)** determina los permisos con los que un proceso se ejecuta.*
- *Es fundamental en la ejecución de programas con privilegios elevados mediante el bit `setuid`.*
