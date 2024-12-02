<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 27 → Nivel 28***

- *Meta de nivel*

- *Hay un repositorio git en ssh://bandit27-git@localhost/home/bandit27-git/repo a través del puerto 2220. La contraseña del usuario bandit27-git es la misma que la del usuario bandit27.*

- *Clona el repositorio y encuentra la contraseña para el siguiente nivel.*
- *Comandos que puedes necesitar para resolver este nivel*

- *git*

## **Explicación de la resolución del nivel Bandit 27 → 28**

- *Este nivel requiere clonar un repositorio Git alojado en un servidor accesible por SSH en el puerto **2220**. Aquí está la explicación paso a paso:*

---

### **1. Crear un directorio temporal y cambiar a él**

```bash
cd $(mktemp -d)
```

- **`mktemp -d`:** *Crea un directorio temporal con un nombre aleatorio en `/tmp`.*
- **`cd $(...)`:** *Cambia el directorio de trabajo al creado por `mktemp`.*

- *Esto garantiza que trabajes en un espacio seguro sin afectar archivos previos.*

---

### **2. Clonar el repositorio con el puerto adecuado**

- *El primer intento sin especificar el puerto falla, por lo que se usa este comando:*

```bash
GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit27-git@localhost/home/bandit27-git/repo
```

- **`GIT_SSH_COMMAND="ssh -p 2220"`:** *Especifica que Git debe usar el puerto 2220 para la conexión SSH.*
- **`git clone ssh://bandit27-git@localhost/home/bandit27-git/repo`:** *Clona el repositorio remoto.*

```bash
bandit27@bandit:/tmp/tmp.dWYArOh8Zn$ GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit27-git@localhost/home/bandit27-git/repo
Cloning into 'repo'...
The authenticity of host '[localhost]:2220 ([127.0.0.1]:2220)' can't be established.
ED25519 key fingerprint is SHA256:C2ihUBV7ihnV1wUXRb4RrEcLfXC5CXlhmAAM/urerLY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Could not create directory '/home/bandit27/.ssh' (Permission denied).
Failed to add the host to the list of known hosts (/home/bandit27/.ssh/known_hosts).
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

bandit27-git@localhost's password:
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.
```

---

### **3. Verificar el contenido del repositorio**

- *Una vez clonado, se listan los archivos del repositorio:*

```bash
ls -l repo/
```

- **Salida:**

```bash
total 4
-rw-rw-r-- 1 bandit27 bandit27 68 Nov 29 15:01 README
```

- **Hay un archivo `README`.**

---

### **4. Leer el contenido del archivo `README`**

```bash
cat repo/README
```

- **Salida:**

```bash
The password to the next level is: Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN
```

- *El archivo contiene la contraseña para el siguiente nivel.*

---

### **5. Extraer la contraseña con `awk` (opcional)**

```bash
cat repo/README | awk 'NF{print $NF}'
```

- **`NF{print $NF}`:** *Muestra el último campo (`$NF`) de cada línea no vacía (`NF`).*

- **Esto imprime solo la contraseña:**

```bash
Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN
```

---

### **Conclusión**

- *La contraseña para el siguiente nivel es: **`Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN`**. Este nivel demuestra cómo usar Git con SSH en un puerto específico y trabajar con repositorios remotos en situaciones controladas.*
