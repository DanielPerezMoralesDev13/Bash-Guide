<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 25 → Nivel 26***

- **Objetivo de nivel**

- *Entrar en bandit26 desde bandit25 debería ser bastante fácil... El shell para el usuario bandit26 no es /bin/bash, sino otra cosa. Averigua qué es, cómo funciona y cómo salir de él.*

- **NOTA: si eres un usuario de Windows y normalmente usas Powershell para hacer ssh en bandit: Powershell es conocido por causar problemas con la solución prevista a este nivel. Deberías usar símbolo del sistema en su lugar.**

- *Comandos que puedes necesitar para resolver este nivel*

- *ssh, cat, more, vi, ls, id, pwd*

## **Análisis del problema y explicación de la solución:**

---

### **Contexto:**

- *Estás intentando conectarte como el usuario `bandit26` a través de SSH usando una clave privada y el puerto 2220:*

```bash
ssh -i bandit26.sshkey bandit26@localhost -p 2220
```

```bash
ssh -i bandit26.sshkey bandit26@localhost -p 2220 bash
```

- *Sin embargo, **no funciona** debido a que el usuario `bandit26` no tiene asignada una shell interactiva estándar como `/bin/bash`. En lugar de eso, tiene configurado un script `/usr/bin/showtext`, lo cual limita las acciones al iniciar sesión.*

---

### **Paso a paso para resolverlo:**

#### 1. **Identificación del problema:**

- *El usuario `bandit26` tiene configurada una shell personalizada:*

```bash
bandit25@bandit:~$ cat /etc/passwd | grep -iEw "^bandit26|^$(whoami)"
bandit25:x:11025:11025:bandit level 25:/home/bandit25:/bin/bash
bandit26:x:11026:11026:bandit level 26:/home/bandit26:/usr/bin/showtext
```

```bash
bandit26:x:11026:11026:bandit level 26:/home/bandit26:/usr/bin/showtext
```

- *El script `/usr/bin/showtext` ejecuta `more` para mostrar un archivo de texto:*

```bash
bandit25@bandit:~$ cat /etc/passwd | grep -iEw "^bandit26" | rev | cut -d ':' -f 1 | rev
/usr/bin/showtext
```

```bash
bandit25@bandit:~$ cat $(!!)
cat $(cat /etc/passwd | grep -iEw "^bandit26" | rev | cut -d ':' -f 1 | rev)
#!/bin/sh

export TERM=linux

exec more ~/text.txt
exit 0
```

```bash
#!/bin/sh
export TERM=linux
exec more ~/text.txt
exit 0
```

#### 2. **Uso de SSH sin shell interactiva:**

- *El intento de ejecutar `ssh` directamente falla porque el script controla la sesión. Esto significa que cualquier comando ejecutado se verá atrapado dentro del comportamiento de `more`.*

---

### **Solución:**

#### **Bypass del script para obtener acceso a archivos como `/etc/bandit_pass/bandit26`:**

1. **Conectarse con SSH normalmente y esperar a que `more` cargue:**

    ```bash
    ssh -i bandit26.sshkey bandit26@localhost -p 2220
    ```

2. **Interrumpir la ejecución de `more`:**
   - *Presiona `v` para abrir el modo de edición en `vim`.*
  
3. **Abrir el archivo de la contraseña:**
   - *En el modo de comando de `vim`, escribe:*

   ```bash
   :e /etc/bandit_pass/bandit26
   ```

4. **Leer la contraseña en pantalla.**

---

### **Explicación de cada comando relevante:**

| **Comando**                      | **Descripción**                                                                   |
| -------------------------------- | --------------------------------------------------------------------------------- |
| *`ssh -i bandit26.sshkey`*       | *Especifica la clave privada para autenticación SSH.*                             |
| *`-p 2220`*                      | *Indica el puerto en el que corre el servidor SSH.*                               |
| *`export TERM=linux`*            | *Configura la variable de entorno `TERM` para que `more` funcione correctamente.* |
| *`exec more ~/text.txt`*         | *Ejecuta el comando `more` para mostrar el contenido del archivo `text.txt`.*     |
| *`v` (en `more`)*                | *Cambia al modo de edición `vim`.*                                                |
| *`:e /etc/bandit_pass/bandit26`* | *Abre el archivo que contiene la contraseña del siguiente nivel.*                 |

---

### **Conclusión:**

- *El bypass del script de inicio se logra utilizando el editor `vim` embebido en `more`. Esto permite explorar el sistema y leer la contraseña de `bandit26`. Este tipo de técnicas son comunes en desafíos de seguridad para entender mejor la explotación de configuraciones de shell.*

### **Explicación detallada de `more`, su funcionamiento y el comportamiento en el entorno descrito:**

---

### **¿Qué es `more`?**

- *`more` es una herramienta de Unix para visualizar contenido de archivos de texto, similar a `cat`, pero con la ventaja de permitir el **paginado**. Esto significa que muestra el contenido de un archivo de texto una página a la vez, en lugar de todo el contenido de golpe.*

- **Uso básico:**
  
  ```bash
  more archivo.txt
  ```

- **Interacciones comunes:**
  - **Espacio:** *Muestra la siguiente página.*
  - **Enter:** *Muestra la siguiente línea.*
  - **q:** *Sale del modo de paginado.*
  - **v:** *Abre el editor `vim` desde el contenido mostrado.*

---

### **Comportamiento de `more` en tu entorno:**

- *Cuando inicias sesión como `bandit26`, el script `/usr/bin/showtext` ejecuta el comando `more ~/text.txt`. Esto bloquea el acceso normal a la terminal y te coloca en un modo de paginado donde ves contenido controlado.*

- *En el caso del archivo `.bashrc` que mencionas:*

```bash
more ~/.bashrc
```

- *Esto muestra el contenido del archivo **paginado**. Al reducir el tamaño del panel de la terminal usando `tmux`, `more` solo muestra una parte del contenido:*

```bash
```bash
# https://github.com/ohmybash/oh-my-bash
# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
esac

# Path to your oh-my-bash installation.
export OSH='/home/d4nitrix13/.oh-my-bash'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="rr"
# Otro theme recomendado: "powerbash10k"

# If you set OSH_THEME to "random", you can ignore themes you don't like.
# OMB_THEME_RANDOM_IGNORED=("powerbash10k" "wanelo")

# Uncomment the following line to use case-sensitive completion.
# OMB_CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# OMB_HYPHEN_SENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

--Más--(16%)
```

```bash
--Más--(16%)
```

- *Este indicador significa que solo estás viendo el 16% del archivo, y necesitas interactuar con `more` para ver más o salir.*

---

### **Aplicación del Bypass en `bandit26`:**

- *Cuando `more` se abre al iniciar sesión, puedes interactuar de la siguiente manera:*

1. **Minimizar el panel con `tmux`**:
   - *Esto puede hacer que `more` se muestre en partes pequeñas.*

2. **Entrar al modo de edición con `vim`:**
   - *Presiona `v` para entrar al editor y usar el comando:*

   ```bash
   :e /etc/bandit_pass/bandit26
   ```

- *Esto te permite leer el contenido del archivo con la contraseña sin restricciones.*

- *El script `showtext` usa `more` para limitar lo que puedes hacer al iniciar sesión. Sin embargo, el uso del modo de edición de `more` te permite acceder a `vim`, y desde allí, explorar otros archivos del sistema, logrando un bypass efectivo.*
