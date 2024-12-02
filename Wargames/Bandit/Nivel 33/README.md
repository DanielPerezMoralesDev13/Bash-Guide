<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 32 → Nivel 33***

- **Objetivo de nivel**

- *Después de tanto git, toca otra escapada. ¡¡¡Buena suerte!!!*
- *Comandos que puedes necesitar para resolver este nivel*

- *sh, man*

## ***1. Conexión al servidor como bandit31***

- **Para conectarnos al servidor, usamos el siguiente comando:**

```bash
ssh bandit31@bandit.labs.overthewire.org -p 2220
```

- *Este comando establece una conexión SSH al servidor de Bandit en el puerto 2220 usando el nombre de usuario **bandit31**. El **Password** de bandit31 se proporciona en el escenario como **`fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy`**.*

### ***2. Consultar la entrada del usuario `bandit32` en `/etc/passwd`***

- *Una vez conectados, podemos ver detalles sobre el usuario **bandit32** en el archivo `/etc/passwd` con el siguiente comando:*

```bash
cat /etc/passwd | grep -iEw "^bandit32"
```

**La salida es:**

```bash
bandit32:x:11032:11032:bandit level 32:/home/bandit32:/home/bandit32/uppershell
```

- **Esto significa que:**

- **bandit32** *es el nombre de usuario.*
- *El **ID de usuario** y **ID de grupo** de bandit32 son ambos **11032**.*
- *La **descripción** del usuario es "bandit level 32".*
- *El **directorio home** de bandit32 es `/home/bandit32`.*
- *La **shell** que utiliza bandit32 está configurada como `/home/bandit32/uppershell`.*

### ***3. Observamos la shell de bandit32***

- *Cuando intentamos ejecutar ciertos comandos dentro de la shell, como `whoami` o `ls`, obtenemos el error:*

```bash
sh: 1: WHOAMI: Permission denied
sh: 1: LS: Permission denied
```

- *Esto sugiere que la shell de **bandit32** tiene restricciones de permisos. Es probable que la shell esté configurada para no permitir ejecutar ciertos comandos o esté en un entorno restringido.*

### ***4. Uso de `$0`***

- **El comando:**

```bash
$0
```

- *En este contexto, el `$0` hace referencia al **nombre del script o comando que está ejecutándose**. Si lo ejecutamos en la shell interactiva, generalmente devuelve el nombre de la shell en uso. En este caso, al ejecutar `$0`, podría devolver el nombre de la shell configurada, o ejecutar el intérprete de shell que se encuentra en `/home/bandit32/uppershell`, el cual parece ser una shell personalizada o limitada.*

### ***5. Obtenemos información sobre la terminal y la shell***

1. **`$ tty`:** *Este comando nos da la información sobre la terminal en la que estamos trabajando, mostrando algo como:*

   ```bash
   /dev/pts/38
   ```

   *Esto indica que estamos en la terminal 38 del sistema.*

2. **`$ echo $SHELL`:** *Este comando muestra la ruta de la shell predeterminada del usuario, que en este caso es la shell personalizada:*

   ```bash
   /home/bandit32/uppershell
   ```

   - *Esto confirma que la shell personalizada llamada **uppershell** se está utilizando como shell para bandit32.*

3. `***file /home/bandit32/uppershell`:** *Aquí usamos el comando `file` para obtener más información sobre el archivo de la shell:**

   ```bash
   /home/bandit32/uppershell: setuid ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, BuildID[sha1]=9a0992be6dd4b3e5fd9693be1d039ad4a68eaa70, for GNU/Linux 3.2.0, not stripped
   ```

   *Esto nos dice que **uppershell** es un archivo ejecutable de 32 bits, con la propiedad **setuid**, lo que significa que al ejecutarlo, se le otorgan los privilegios del propietario del archivo (probablemente **bandit32**). Además, está **dinámicamente enlazado** y usa el intérprete **/lib/ld-linux.so.2**.*

### ***6. Ejecutar `bash` para cambiar a una shell más funcional***

- *Al ejecutar el comando `bash`, cambiamos de la shell restringida a una shell más funcional, probablemente porque el sistema permite ejecutar `bash` desde la shell personalizada.*

```bash
bash
```

- *Ahora estamos usando una shell `bash` normal, que nos permite ejecutar los comandos habituales.*

### ***7. Ver los archivos en el directorio del usuario***

- *Al ejecutar el comando `ls -lA` en la nueva shell, vemos que el archivo **`uppershell`** ahora tiene permisos especiales (`rws`):*

```bash
ls -lA
```

- *La salida muestra que el archivo **`uppershell`** tiene el bit **setuid** activado:*

```bash
-rwsr-x--- 1 bandit33 bandit32 15136 Sep 19 07:08 uppershell
```

- *Esto significa que cuando **bandit33** ejecute el archivo `uppershell`, este se ejecutará con los privilegios del usuario **bandit32**.*

### ***8. Acceder a la contraseña de bandit33***

- *Finalmente, al leer el archivo **`/etc/bandit_pass/bandit33`**, obtenemos la contraseña de **bandit33**:*

```bash
cat /etc/bandit_pass/bandit33
```

- *La salida es la contraseña para el siguiente nivel:*

```bash
tQdtbs5D5i2vJwkO8mEyYEyTL8izoeJ0
```

### ***Resumen de lo que sucede***

1. C***onexión SSH:** *Nos conectamos como **bandit31** y consultamos el archivo `/etc/passwd` para ver información sobre **bandit32**.**
2. S***hell restringida:** *Al intentar usar la shell, encontramos que está restringida (no podemos usar comandos como `ls` o `whoami`).**
3. U***so de `$0`:** *El comando `$0` muestra el nombre del script o shell actual.**
4. O***btenemos detalles de la shell:** *Vemos que la shell de **bandit32** es un archivo ejecutable con el bit `setuid`, lo que otorga privilegios elevados al ejecutarlo.**
5. C***ambio a una shell más funcional:** *Ejecutamos `bash` para obtener una shell completa y funcional.**
6. A***ccedemos a la contraseña de bandit33:** *Finalmente, leemos el archivo que contiene la contraseña para el siguiente nivel de Bandit.**

- *Este proceso nos lleva a la contraseña de **bandit33** y nos permite avanzar al siguiente nivel del juego.*

- *[Foro](https://stackoverflow.com/questions/29258603/what-do-0-1-2-mean-in-shell-script#29258643 "https://stackoverflow.com/questions/29258603/what-do-0-1-2-mean-in-shell-script#29258643")*

### ***¿Qué es `$0`?***

- *El valor de `$0` se refiere al **nombre del script o el comando ejecutado** en una sesión de shell. Si estás en una shell interactiva (como en tu caso), `$0` mostrará el nombre del intérprete de comandos que está en uso.*

#### ***Primera vez que ejecutamos `$0`***

- *Cuando ejecutamos el comando `$0` en la shell restringida (`/home/bandit32/uppershell`), obtenemos:*

```bash
$ echo $0
sh
```

- *Aquí, `$0` devuelve **"sh"**, que indica que la shell actual está usando **`sh`** (una versión muy básica de la shell de Unix). Esto se debe a que la shell **uppershell** es un ejecutable configurado con el bit `setuid`, y puede estar configurado para ejecutar una shell restringida o limitada, como `sh`.*

#### ***Después de cambiar a `bash`***

- **Al ejecutar el comando `bash`, cambias a una shell más completa y funcional:**

```bash
$ bash
bandit33@bandit:~$ echo $0
bash
```

- *Ahora, al ejecutar `$0` en la nueva shell, devuelve **"bash"**, lo que indica que estamos usando la shell `bash`, que es más completa y permite ejecutar una mayor variedad de comandos.*

- **$0** *en una shell interactiva normalmente muestra el nombre de la shell o el script que se está ejecutando.*
- *Inicialmente, `$0` muestra **"sh"**, porque estábamos dentro de una shell restringida.*
- *Después de ejecutar `bash`, el valor de `$0` cambia a **"bash"**, ya que ahora estamos usando la shell `bash`.*

- *Este comportamiento se utiliza para verificar o referirse al intérprete que está en uso, lo cual es útil cuando estamos trabajando con shells restringidas o configuradas con un intérprete personalizado, como en este caso.*

---

### ***¿Por qué aparece `-bash` en lugar de solo `bash`?***

- *Cuando ejecutas el comando `echo $0` y obtienes **`-bash`**, el guion al principio del nombre de la shell indica que **estás en un "login shell"**. En un entorno Unix/Linux, un **"login shell"** es una shell que se inicia cuando inicias sesión en el sistema. Esto es diferente de una shell interactiva normal que se abre dentro de un terminal ya activo.*

### ***¿Qué hace Oh My Bash?***

**Oh My Bash** *es un framework de configuración para Bash, similar a **Oh My Zsh** para Zsh. Al instalarlo, Oh My Bash agrega muchas funcionalidades y configuraciones que pueden alterar tu entorno, entre ellas:*

- **Cambio de configuraciones predeterminadas de Bash**.
- **Personalización de tu prompt**.
- **Modificación de variables de entorno**.

### ***¿Por qué la shell aparece como `-bash`?***

- *Cuando inicias sesión en el sistema y la shell se ejecuta como **login shell**, el sistema coloca un guion antes del nombre del intérprete. Este comportamiento es completamente normal y estándar para las shells de login. La forma de la variable `$0` te ayuda a distinguir si es una shell interactiva o de login.*

- **`-bash`** *indica que estás usando una **login shell**.*
- *Este comportamiento no está directamente relacionado con **Oh My Bash**; es una característica de **Bash** en general cuando se ejecuta como shell de login.*
- *Oh My Bash probablemente no está afectando esto, ya que su propósito es más bien personalizar el prompt y agregar funcionalidades adicionales, pero no cambia cómo Bash maneja el entorno o las variables como `$0`.*

- *Si quieres ver cómo se comporta la shell de manera no interactiva (sin el guion), podrías probar ejecutando una shell **no-login** con el siguiente comando:*

```bash
bash --noprofile --norc
```

- *Esto debería mostrarte **`bash`** sin el guion, ya que no se carga el entorno de login.*

### ***1. `echo $0` en tu terminal actual:***

- *Cuando ejecutas `echo $0` y ves **`-bash`**, esto indica que tu shell actual es un **login shell**. Como mencioné antes, cuando inicias sesión en una shell (ya sea directamente en la consola o mediante un gestor de sesiones), la shell se ejecuta en modo **login**. Esto es parte del comportamiento estándar de Bash cuando se inicia como shell de login.*

**¿Por qué el guion (`-`) antes de `bash`?**

- *El guion indica que esta shell fue iniciada como un **login shell**.*
- *En un login shell, se cargan configuraciones y perfiles específicos (por ejemplo, **`.bash_profile`**, **`.bashrc`**, etc.), lo que puede modificar el entorno.*

### ***2. Ejecutando `bash --noprofile --norc`:***

**Cuando ejecutas:**

```bash
bash --noprofile --norc
```

```bash
➜  d4nitrix13 ~ echo $0
-bash
```

```bash
➜  d4nitrix13 ~ bash --noprofile --norc
bash-5.2$ echo $0
bash
bash-5.2$
```

- *La opción **`--noprofile`** evita que se carguen los archivos de configuración de la shell de login, como **`.bash_profile`** o **`.profile`**. La opción **`--norc`** evita que se cargue el archivo **`.bashrc`**, que es normalmente utilizado para configurar una shell interactiva.*

- *Esto hace que la shell que se abre no sea una shell de login, y por lo tanto, no muestra el guion en **`$0`**. Cuando luego ejecutas **`echo $0`**, se muestra **`bash`**, ya que la shell no está en modo login.*

### ***3. Abrir una nueva terminal (con Ctrl + Alt + T):***

```bash

➜  d4nitrix13 ~ echo $0
/bin/bash
```

- *Cuando abres una nueva terminal utilizando el atajo **Ctrl + Alt + T**, lo que se inicia es una nueva instancia de **bash**, pero **no en modo login**. Aquí el valor de **`$0`** es **`/bin/bash`**.*

- *Esto es porque, al no ser una shell de login (al menos no en el sentido completo como en tu terminal anterior), no se marca con el guion. La shell simplemente es **`/bin/bash`**, ya que es la ruta completa del ejecutable de Bash.*

### ***Resumen de lo que está sucediendo***

- **`-bash`:** *La terminal actual está en modo **login shell**. Esto incluye la carga de archivos de configuración de la shell (como **`.bash_profile`**, **`.bashrc`**).*
- **`bash`:** *Cuando ejecutas **`bash --noprofile --norc`**, inicias una nueva shell sin configuraciones de login ni de entorno interactivo, lo que elimina el guion.*
- **`/bin/bash`:** *En una nueva terminal abierta con **Ctrl + Alt + T**, la shell simplemente es **bash** sin el guion, y es la ruta completa del ejecutable.*

- *Este comportamiento es normal y está relacionado con cómo Bash maneja las shells de login y las shells interactivas.*
