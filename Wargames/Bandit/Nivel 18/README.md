<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 17 → Nivel 18***

- *Meta de nivel*

- *Hay 2 archivos en el homedirectory: passwords.old y passwords.new. La contraseña para el siguiente nivel está en passwords.new y es la única línea que se ha cambiado entre passwords.old y passwords.new*

- *NOTA: si has resuelto este nivel y ves «¡Adiós!» al intentar entrar en bandit18, esto está relacionado con el siguiente nivel, bandit19.*
- *Comandos que puedes necesitar para resolver este nivel*

- *cat, grep, ls, diff*

## ***1. Comando `wc -l passwords.*`***

   ```bash
   wc -l passwords.*
   ```

   ```bash
   wc -l passwords.*
   100 passwords.new
   100 passwords.old
   200 total
   ```

- **`wc -l`:** *El comando `wc` (word count) se usa para contar líneas, palabras y caracteres de un archivo. La opción `-l` hace que se cuenten solo las líneas.*
- **`passwords.*`:** *Esto hace referencia a todos los archivos que empiecen con "passwords." en el directorio actual. En este caso, probablemente se refiera a dos archivos: `passwords.new` y `passwords.old`.*
- *El comando muestra que **`passwords.new`** tiene 100 líneas, **`passwords.old`** también tiene 100 líneas, y en total hay 200 líneas entre ambos archivos.*

### ***2. Comando `diff passwords.old passwords.new`***

   ```bash
   diff passwords.old passwords.new
   ```

   ```bash
   diff passwords.old passwords.new
   42c42
   < ktfgBvpMzWKR5ENj26IbLGSblgUG9CzB
   ---
   > x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
   ```

- **`diff`:** *El comando `diff` compara dos archivos línea por línea y muestra las diferencias.*
- *En este caso, la diferencia está en la línea 42 de ambos archivos. El signo `c` indica que la línea ha cambiado. La línea original en **`passwords.old`** (`ktfgBvpMzWKR5ENj26IbLGSblgUG9CzB`) ha sido reemplazada en **`passwords.new`** por (`x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO`).*

### ***3. Comando `cat /etc/passwd | head --lines=5`***

   ```bash
   diff passwords.old passwords.new
   ```

   ```bash
   cat /etc/passwd | head --lines=5
   root:x:0:0:root:/root:/bin/bash
   daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
   bin:x:2:2:bin:/bin:/usr/sbin/nologin
   sys:x:3:3:sys:/dev:/usr/sbin/nologin
   sync:x:4:65534:sync:/bin:/bin/sync
   ```

- **`cat /etc/passwd`:** *Muestra el contenido del archivo `/etc/passwd`, que contiene información sobre las cuentas de usuario del sistema.*
- **`head --lines=5`:** *Muestra las primeras 5 líneas del archivo.*
- *En este caso, las primeras 5 líneas muestran las entradas de usuario para `root`, `daemon`, `bin`, `sys` y `sync`.*

### ***4. Comando `grep -iv "root" /etc/passwd`***

   ```bash
   cat /etc/passwd | head --lines=5 | grep -iv "root"
   daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
   bin:x:2:2:bin:/bin:/usr/sbin/nologin
   sys:x:3:3:sys:/dev:/usr/sbin/nologin
   sync:x:4:65534:sync:/bin:/bin/sync
   ```

- **`grep -iv "root"`:** *Filtra las líneas que contienen la palabra "root". La opción `-i` hace que la búsqueda no distinga entre mayúsculas y minúsculas, y la opción `-v` invierte el resultado, es decir, muestra las líneas que **no** contienen la palabra "root".*
- *El resultado muestra todos los usuarios excepto el `root`.*

### ***5. Comando `grep -iE "^root|^daemon" /etc/passwd`***

   ```bash
   cat /etc/passwd | head --lines=5 | grep -iE "^root|^daemon"
   root:x:0:0:root:/root:/bin/bash
   daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
   ```

- **`grep -iE "^root|^daemon"`:** *Filtra las líneas que comienzan (`^`) con "root" o "daemon". La opción `-i` hace que la búsqueda no distinga mayúsculas de minúsculas, y `-E` permite usar expresiones regulares extendidas para combinar las condiciones (`^root|^daemon` significa "comienza con root o daemon").*
- *El resultado muestra solo las líneas que corresponden a los usuarios `root` y `daemon`.*

### ***6. Comando `diff <(echo "$oldProcess") <(echo "newProcess")`***

   ```bash
   #!/usr/bin/env bash

   oldProcess=$(ps -eo command)

   while true; do
     newProcess=$(ps -eo command)
     diff <(echo "$oldProcess") <(echo "newProcess") | grep -vE "procmon|command"
     oldProcess=$newProcess
     sleep 3
   done
   ```

- **`ps -eo command`:** *El comando `ps` muestra los procesos en ejecución. La opción `-e` muestra todos los procesos, y `-o command` muestra solo el comando de cada proceso.*
- **`diff <(echo "$oldProcess") <(echo "$newProcess")`:** *Compara el estado actual de los procesos (`$oldProcess`) con el estado actualizado después de 3 segundos (`$newProcess`). `diff` mostrará las diferencias entre ambos estados.*
- **`grep -vE "procmon|command"`:** *Filtra las líneas que contienen "procmon" o "command", es decir, para excluir de la salida los procesos relacionados con el monitoreo.*
- Esto se repite indefinidamente cada 3 segundos, mostrando las diferencias entre los procesos en ejecución.

### ***7. Comando `diff passwords.old passwords.new | tail -n 1 | awk 'NF{print $2}'`***

   ```bash
   diff passwords.old passwords.new | tail -n 1 | awk 'NF{print $2}'
   x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
   ```

- **`diff passwords.old passwords.new`:** *Compara los archivos `passwords.old` y `passwords.new` y muestra las diferencias.*
- **`tail -n 1`:** *Muestra solo la última línea de las diferencias.*
- **`awk 'NF{print $2}'`:** *Filtra la salida para mostrar solo el segundo campo de la línea, siempre que haya un campo (es decir, cuando la línea no esté vacía). El resultado es la nueva contraseña (`x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO`).*

### ***8. ¿Qué es el directorio `/dev/shm`?***

- **`/dev/shm`** *es un directorio especial en sistemas basados en Linux que se utiliza para almacenamiento temporal en memoria compartida (tmpfs). Los archivos almacenados en este directorio no se escriben en el disco, sino que residen en la RAM, lo que permite un acceso muy rápido a los datos.*

### ***Conclusión***

- *Estos comandos y conceptos están relacionados principalmente con la gestión de archivos, procesos, y seguridad en un sistema Linux. El uso de herramientas como `diff`, `ps`, `grep` y `awk` son esenciales para monitorear cambios, procesar archivos y gestionar el sistema.*

### ***Explicación detallada***

*El constructo `<(echo "$oldProcess")` es una característica del shell de Linux, conocida como **"process substitution"**. Esto permite tratar la salida de un comando como si fuera un archivo.*

- **`<(command)`:** *La sintaxis `<(command)` crea un **archivo virtual** que contiene la salida del comando ejecutado dentro de los paréntesis. Este archivo no es un archivo físico en el sistema de archivos, sino un archivo especial en memoria que puede ser leído por otros comandos, como si fuera un archivo regular.*

- **`echo "$oldProcess"`:** *Aquí, `echo "$oldProcess"` imprime el valor de la variable `oldProcess`, que contiene una lista de los procesos en ejecución obtenida con el comando `ps -eo command`.*

Entonces, **`<(echo "$oldProcess")`:**

- *Ejecuta el comando `echo "$oldProcess"` para imprimir el contenido de la variable `$oldProcess`.*
- *Ese contenido es luego tratado como un archivo virtual y pasado como argumento al comando que lo reciba.*

### ***Ejemplo de uso con `diff`***

**En el contexto de tu ejemplo:**

```bash
diff <(echo "$oldProcess") <(echo "$newProcess")
```

- **`<(echo "$oldProcess")`:** *Esto genera un "archivo" en memoria con la salida de la variable `oldProcess` (la lista de procesos antes de esperar).*
- **`<(echo "$newProcess")`:** *Similarmente, genera otro "archivo" con la salida de la variable `newProcess` (la lista de procesos después de esperar).*

- *El comando `diff` luego compara estos dos "archivos virtuales" (es decir, las salidas de los dos comandos `echo`), mostrando las diferencias entre los dos estados de los procesos.*

### ***¿Por qué se usa esto?***

- *Esta técnica de **"process substitution"** es útil cuando se quiere proporcionar la salida de un comando a otro comando que normalmente espera un archivo como entrada, sin tener que escribir la salida en un archivo físico. Es eficiente y evita la necesidad de archivos temporales.*

### **Script: `main.py`**

```python
#!/usr/bin/env python3

"""
Redirección del stdin a un archivo y ejecutar el script
"""

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

from sys import exit, stdout

def main(name: str) -> str:
    """
    Esta función recibe un nombre y lo devuelve en un mensaje
    """
    return "My name is {nombre}".format(nombre=name)

if __name__ == "__main__":
    print(main(name=input("Ingresa tu nombre: ")), end="\n", file=stdout)
    exit(0)
```

---

### **Explicación del Script**

- **`main(name: str) -> str`:** *Esta función toma un nombre como argumento y devuelve un mensaje formateado.*
- **`input("Ingresa tu nombre: ")`:** *El script pide al usuario que ingrese un nombre a través de la entrada estándar (`stdin`).*
- **`file=stdout`:** *Envía la salida al flujo estándar de salida (`stdout`).*

---

### **1. Redirección usando `echo` y tuberías:**

```bash
echo "Daniel Perez" | python3 main.py
```

#### Explicación

- **`echo "Daniel Perez"`:** *Imprime el texto `"Daniel Perez"`.*
- **`|` (pipe):** *Redirige la salida de `echo` como entrada (`stdin`) para el script `main.py`.*
- **`python3 main.py`:** *El script recibe el texto `"Daniel Perez"` como entrada y lo usa en la función `main`.*

**Salida:**

```bash
Ingresa tu nombre: My name is Daniel Perez
```

---

### **2. Uso de Process Substitution (`< <(command)`):**

```bash
python3 main.py < <(echo "Daniel Perez")
```

```bash
python3 main.py <<(echo "Daniel Perez")
```

- **`<(echo "Daniel Perez")`:** *Crea un archivo temporal que contiene la salida del comando `echo "Daniel Perez"`.*
- **`<`:** *Redirige ese archivo temporal como entrada al script `main.py`.*

**Salida:**

```bash
Ingresa tu nombre: My name is Daniel Perez
```

---

### **3. Uso de un archivo como entrada:**

```bash
echo "Daniel Perez" > name.txt
python3 main.py < name.txt
```

- **`echo "Daniel Perez" > name.txt`:** *Escribe el texto `"Daniel Perez"` en un archivo llamado `name.txt`.*
- **`< name.txt`:** *Redirige el contenido del archivo `name.txt` como entrada para el script `main.py`.*

**Salida:**

```bash
Ingresa tu nombre: My name is Daniel Perez
```

---

### **Conclusión:**

- **Redirección simple (`<`):** *Permite usar archivos como entrada para scripts o comandos.*
- **Process Substitution (`<(command)`):** *Crea archivos temporales con la salida de un comando, permitiendo que el script los lea como si fueran archivos reales.*
- *Este enfoque es útil para automatizar entradas dinámicas o evitar la creación de archivos intermedios físicos.*
