<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 28 → Nivel 29***

- **Objetivo de nivel**

- *Hay un repositorio git en ssh://bandit28-git@localhost/home/bandit28-git/repo a través del puerto 2220. La contraseña del usuario bandit28-git es la misma que la del usuario bandit28.*

- *Clona el repositorio y encuentra la contraseña para el siguiente nivel.*
- *Comandos que puedes necesitar para resolver este nivel*

- *git*

## **Explicación paso a paso para resolver el nivel Bandit 28 → 29**

- **Este nivel requiere acceder al contenido de un repositorio Git, donde la contraseña para el siguiente nivel está oculta en el historial de cambios del archivo `README.md`.**

---

### **1. Crear un directorio temporal y clonar el repositorio**

- **Primero, se crea un directorio temporal y se clona el repositorio desde el servidor:**

```bash
cd $(mktemp -d)
GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit28-git@localhost/home/bandit28-git/repo
```

```bash
bandit28@bandit:/tmp/tmp.lM4bhzjGCQ$ GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit28-git@localhost/home/bandit28-git/repo
Cloning into 'repo'...
The authenticity of host '[localhost]:2220 ([127.0.0.1]:2220)' can't be established.
ED25519 key fingerprint is SHA256:C2ihUBV7ihnV1wUXRb4RrEcLfXC5CXlhmAAM/urerLY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Could not create directory '/home/bandit28/.ssh' (Permission denied).
Failed to add the host to the list of known hosts (/home/bandit28/.ssh/known_hosts).
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

bandit28-git@localhost's password:
remote: Enumerating objects: 9, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 9 (delta 2), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (9/9), done.
Resolving deltas: 100% (2/2), done.
```

- **`cd $(mktemp -d)`:** *Crea un directorio temporal.*
- **`GIT_SSH_COMMAND="ssh -p 2220"`:** *Indica a Git que use el puerto 2220 para la conexión SSH.*
- **`git clone`:** *Clona el repositorio remoto especificado en la ruta.*

- **El repositorio se clona exitosamente en el directorio `repo`.**

---

### **2. Explorar el repositorio**

- **Después de clonar el repositorio, se navega dentro de él y se examina su contenido:**

```bash
cd repo/
ls -l
```

**Salida:**

```bash
total 4
-rw-rw-r-- 1 bandit28 bandit28 111 Nov 29 15:11 README.md
```

- **Se observa que hay un archivo `README.md`.**

---

### **3. Ver el contenido del archivo `README.md`**

- **Se abre el archivo `README.md` para revisar su contenido:**

```bash
cat README.md
```

**Salida:**

```bash
# Bandit Notes
Some notes for level29 of bandit.

## credentials

- username: bandit29
- password: xxxxxxxxxx
```

- **El archivo contiene una nota indicando que la contraseña para el siguiente nivel está en la sección de credenciales, pero inicialmente está oculta como `xxxxxxxxxx`.**

---

### **4. Consultar el historial de commits en Git**

- **Para descubrir la contraseña real, se consulta el historial de commits del repositorio:**

```bash
git log --oneline --all --color=auto --summary --binary --abbrev-commit
```

**Salida:**

```bash
bandit28@bandit:/tmp/tmp.lM4bhzjGCQ/repo$ git log --oneline --all --color=auto --summary --binary --abbrev-commit
817e303 (HEAD -> master, origin/master, origin/HEAD) fix info leak
diff --git a/README.md b/README.md
index d4e3b74..5c6457b 100644
--- a/README.md
+++ b/README.md
@@ -4,5 +4,5 @@ Some notes for level29 of bandit.
 ## credentials

 - username: bandit29
-- password: 4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7
+- password: xxxxxxxxxx

3621de8 add missing data
diff --git a/README.md b/README.md
index 7ba2d2f..d4e3b74 100644
--- a/README.md
+++ b/README.md
@@ -4,5 +4,5 @@ Some notes for level29 of bandit.
 ## credentials

 - username: bandit29
-- password: <TBD>
+- password: 4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7

0622b73 initial commit of README.md
 create mode 100644 README.md

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..7ba2d2f
--- /dev/null
+++ b/README.md
@@ -0,0 +1,8 @@
+# Bandit Notes
+Some notes for level29 of bandit.
+
+## credentials
+
+- username: bandit29
+- password: <TBD>
+
```

- **En el historial, se observa que el commit con hash `817e303` modifica el archivo `README.md`, cambiando la contraseña de `4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7` a `xxxxxxxxxx`.**

---

### **5. Hacer checkout a un commit anterior**

- **Luego, se hace un checkout a un commit anterior para ver la contraseña antes de que fuera modificada:**

```bash
git checkout 3621de8
```

- **Salida:**

```bash
bandit28@bandit:/tmp/tmp.lM4bhzjGCQ/repo$ git checkout 3621de8
Note: switching to '3621de8'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 3621de8 add missing data
```

- **Esto cambia el estado del repositorio a un commit específico.**

---

### **6. Ver el contenido de `README.md` en el commit anterior**

- **Al revisar el archivo `README.md` en este commit, se ve que la contraseña era diferente antes de la modificación:**

```bash
cat README.md
```

- **Salida:**

```bash
# Bandit Notes
Some notes for level29 of bandit.

## credentials

- username: bandit29
- password: 4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7
```

- *Aquí se revela la contraseña anterior: `4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7`.*

---

### **7. Extraer solo la contraseña**

- *Para obtener solo la contraseña de manera más eficiente, se utiliza el siguiente comando con `awk` para filtrar la última palabra (que es la contraseña):*

```bash
cat README.md | tail -n 2 | head -n 1 | awk 'NF{print $NF}'
```

- *Este comando filtra la última línea del archivo y extrae el último campo (la contraseña):*

**Salida:**

```bash
4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7
```

---

### **Conclusión**

- *La contraseña para el siguiente nivel, Bandit 29, es: **`4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7`**. La clave para resolver este nivel fue explorar el historial de commits de Git y descubrir cómo la contraseña fue modificada en un commit posterior.*

- *Estas son opciones que se usan con el comando `git log` para personalizar cómo se muestra el historial de commits. A continuación te explico qué hace cada una:*

### ***1. `--oneline`***

- **Descripción:** *Muestra cada commit en una sola línea.*
- **Uso:** *Reduce la salida, mostrando solo el hash corto del commit y el mensaje asociado.*
- **Ejemplo de salida:**

     ```bash
     817e303 (HEAD -> master) fix info leak
     ```

- **Ventaja:** *Es útil cuando se quiere una vista compacta del historial sin detalles excesivos.*

### ***2. `--all`***

- **Descripción:** *Muestra el historial de todos los commits en todas las ramas.*
- **Uso:** *Si el repositorio tiene varias ramas, esta opción asegura que se muestren los commits de todas ellas.*
- **Ejemplo de salida:**
  - *Verás commits de ramas como `master`, `feature-branch`, etc.*

     ```bash
     817e303 (HEAD -> master, origin/master, origin/HEAD) fix info leak
     ```

- **Ventaja:** *Permite ver no solo los commits de la rama actual, sino también los de las ramas remotas y otras ramas locales.*

### ***3. `--color=auto`***

- **Descripción:** *Muestra la salida con colores, pero solo si el comando se ejecuta en una terminal que soporta colores.*
- **Uso:** *Mejora la legibilidad al resaltar diferentes partes de la salida (por ejemplo, los hashes de los commits y las ramas).*
- **Ejemplo de salida:**
  - *Los hashes de los commits y las ramas pueden aparecer en colores diferentes.*

     ```bash
     817e303 (HEAD -> master) fix info leak
     ```

- **Ventaja:** *Hace que el historial sea más fácil de leer visualmente, especialmente en un terminal con soporte de colores.*

### ***4. `--summary`***

- **Descripción:** *Muestra un resumen de los cambios realizados en cada commit, incluyendo los archivos modificados.*
- **Uso:** *Permite ver qué archivos fueron afectados y cómo en cada commit, sin necesidad de ver el diffs completos.*
- **Ejemplo de salida:**

     ```bash
     diff --git a/README.md b/README.md
     index d4e3b74..5c6457b 100644
     --- a/README.md
     +++ b/README.md
     @@ -4,5 +4,5 @@ Some notes for level29 of bandit.
     ```

- **Ventaja:** *Es útil para ver rápidamente qué archivos cambiaron en cada commit sin ver el diff completo.*

### ***5. `--binary`***

- **Descripción:** *Muestra los cambios en los archivos binarios como si fueran cambios de texto.*
- **Uso:** *Esta opción es más relevante para archivos binarios, y es útil si necesitas ver los cambios binarios en un formato que Git pueda mostrar en texto.*
- **Ejemplo de salida:** *Aunque los archivos binarios no suelen mostrar un "diff" legible, esta opción intentará representarlos de manera diferente.*
- **Ventaja:** *Permite que Git maneje los archivos binarios en lugar de omitirlos o no mostrarlos.*

### ***6. `--abbrev-commit`***

- **Descripción:** *Muestra un hash abreviado de cada commit.*
- **Uso:** *En lugar de mostrar el hash completo del commit (que puede ser largo), se muestra una versión abreviada (generalmente los primeros 7 caracteres del hash).*
- **Ejemplo de salida:**

     ```bash
     817e303 fix info leak
     ```

- **Ventaja:** *Reduce la longitud del output y hace más fácil manejar los hashes sin perder información importante.*

---

### **Resumen:**

- *Estas opciones combinadas te permiten obtener un historial de commits más compacto y visualmente accesible, mostrando:*

- *Los commits de todas las ramas (`--all`).*
- *Un formato más corto para cada commit (`--oneline`).*
- *Colores para facilitar la lectura (`--color=auto`).*
- *Resumen de los cambios en los archivos (`--summary`).*
- *Abreviaciones de los hashes de los commits (`--abbrev-commit`).*
- *Información de archivos binarios (`--binary`).*

- *Es una forma eficiente de explorar el historial de un repositorio, especialmente cuando buscas información rápidamente.*
