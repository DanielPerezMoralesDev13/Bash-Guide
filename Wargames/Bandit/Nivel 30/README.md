<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 29 → Nivel 30***

- **Meta de nivel**

- *Hay un repositorio git en ssh://bandit29-git@localhost/home/bandit29-git/repo a través del puerto 2220. La contraseña del usuario bandit29-git es la misma que la del usuario bandit29.*

- *Clona el repositorio y encuentra la contraseña para el siguiente nivel.*
- *Comandos que puedes necesitar para resolver este nivel*

- *git*

## Explicación detallada del proceso

- **A continuación te explico cada paso que se realizó para completar el nivel de Bandit 29 a Bandit 30:**

---

### ***1. `cd $(mktemp -d)`***

- **Descripción:** *Este comando cambia el directorio de trabajo al directorio temporal creado por `mktemp -d`.*
- **`mktemp -d`** *crea un nuevo directorio temporal de manera segura y devuelve la ruta del directorio creado. El `$()` se usa para capturar esta ruta y cambiar a ese directorio con `cd`.*
- **Objetivo:** *Usar un directorio temporal para clonar el repositorio y evitar conflictos con otros archivos o configuraciones.*

### ***2. `GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit29-git@localhost/home/*bandit29-git/repo`**

```bash
GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit29-git@localhost/home/bandit29-git/repo
Cloning into 'repo'...
The authenticity of host '[localhost]:2220 ([127.0.0.1]:2220)' can't be established.
ED25519 key fingerprint is SHA256:C2ihUBV7ihnV1wUXRb4RrEcLfXC5CXlhmAAM/urerLY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Could not create directory '/home/bandit29/.ssh' (Permission denied).
Failed to add the host to the list of known hosts (/home/bandit29/.ssh/known_hosts).
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

bandit29-git@localhost's password:
remote: Enumerating objects: 16, done.
remote: Counting objects: 100% (16/16), done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 16 (delta 2), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (16/16), done.
Resolving deltas: 100% (2/2), done.
```

- **Descripción:** *Este comando clona el repositorio Git ubicado en `ssh://bandit29-git@localhost/home/bandit29-git/repo`, pero utilizando un puerto SSH específico (`2220`).*
- **Explicación detallada:**
  - **`GIT_SSH_COMMAND="ssh -p 2220"`:** *Configura la variable de entorno `GIT_SSH_COMMAND` para especificar que se debe usar el puerto 2220 al conectar a través de SSH. Esto es necesario porque, por defecto, Git usa el puerto 22 para SSH, pero en este caso se usa el puerto 2220.*
  - **`git clone`:** *Clona el repositorio desde el servidor local `localhost` a un directorio local llamado `repo`.*
- **Resultado:** *Se clona el repositorio correctamente en el directorio actual, y se crea una carpeta llamada `repo`.*

### ***3. `ls` y `cd repo/`***

```bash
bandit29@bandit:/tmp/tmp.FJyCuUjl4N$ ls
repo
```

```bash
bandit29@bandit:/tmp/tmp.FJyCuUjl4N$ cd repo/
```

```bash
bandit29@bandit:/tmp/tmp.FJyCuUjl4N/repo$ ls
README.md
```

- **Descripción:** *El comando `ls` muestra el contenido del directorio actual, que en este caso solo tiene una carpeta llamada `repo`. Luego, el comando `cd repo/` se usa para entrar en el directorio `repo` clonado.*
- **Objetivo:** *Verificar que el repositorio se clonó correctamente y acceder a él.*

### ***4. `cat README.md`***

```bash
bandit29@bandit:/tmp/tmp.FJyCuUjl4N/repo$ cat README.md
# Bandit Notes
Some notes for bandit30 of bandit.

## credentials

- username: bandit30
- password: <no passwords in production!>
```

- **Descripción:** *Muestra el contenido del archivo `README.md` del repositorio.*
- **Contenido:**
  - El archivo `README.md` *contiene una sección de **credenciales** que incluye el **username** (`bandit30`) y un **password** con un texto de ejemplo.*
  - **`password: <no passwords in production!>`** *es un texto que indica que no se almacenan contraseñas en producción, lo cual es un mensaje genérico.*

### ***5. `git branch -r`***

```bash
bandit29@bandit:/tmp/tmp.1lnNmJVGul/repo$ git branch -r
  origin/HEAD -> origin/master
  origin/dev
  origin/master
  origin/sploits-dev
```

- **Descripción:** *Muestra todas las ramas remotas del repositorio.*
- **Resultado:**

     ```bash
     origin/HEAD -> origin/master
     origin/dev
     origin/master
     origin/sploits-dev
     ```

- *Esto indica que el repositorio tiene varias ramas remotas: `master`, `dev` y `sploits-dev`, y la rama `HEAD` apunta a `master`.*

### ***6. `git log -p`***

```bash
bandit29@bandit:/tmp/tmp.1lnNmJVGul/repo$ git log -p
commit 6ac7796430c0f39290a0e29a4d32e5126544b022 (HEAD -> master, origin/master, origin/HEAD)
Author: Ben Dover <noone@overthewire.org>
Date:   Thu Sep 19 07:08:41 2024 +0000

    fix username

diff --git a/README.md b/README.md
index 2da2f39..1af21d3 100644
--- a/README.md
+++ b/README.md
@@ -3,6 +3,6 @@ Some notes for bandit30 of bandit.

 ## credentials

-- username: bandit29
+- username: bandit30
 - password: <no passwords in production!>


commit e65a928cca4db1863b478cf5e93d1d5b1c1bd6b2
Author: Ben Dover <noone@overthewire.org>
Date:   Thu Sep 19 07:08:41 2024 +0000

    initial commit of README.md

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..2da2f39
--- /dev/null
+++ b/README.md
@@ -0,0 +1,8 @@
+# Bandit Notes
+Some notes for bandit30 of bandit.
+
+## credentials
+
+- username: bandit29
+- password: <no passwords in production!>
+
```

- **Descripción:** *Muestra el historial de commits junto con las diferencias (diffs) de cada uno de ellos.*
- **Objetivo:** *Ver los cambios detallados de cada commit y buscar cualquier información relevante, como contraseñas o mensajes ocultos.*

### ***7. `git log --oneline --color=always --abbrev-commit --binary --all --stat`***

```bash
bandit29@bandit:/tmp/tmp.1lnNmJVGul/repo$ git log --oneline --color=always --abbrev-commit --binary --all --stat
6ac7796 (HEAD -> master, origin/master, origin/HEAD) fix username
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 2da2f39..1af21d3 100644
--- a/README.md
+++ b/README.md
@@ -3,6 +3,6 @@ Some notes for bandit30 of bandit.

 ## credentials

-- username: bandit29
+- username: bandit30
 - password: <no passwords in production!>

081ac38 (origin/dev) add data needed for development
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 1af21d3..bc6ad3d 100644
--- a/README.md
+++ b/README.md
@@ -4,5 +4,5 @@ Some notes for bandit30 of bandit.
 ## credentials

 - username: bandit30
-- password: <no passwords in production!>
+- password: qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL

7226732 (origin/sploits-dev) add some silly exploit, just for shit and giggles
 exploits/horde5.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/exploits/horde5.md b/exploits/horde5.md
new file mode 100644
index 0000000..8b13789
--- /dev/null
+++ b/exploits/horde5.md
@@ -0,0 +1 @@
+
e65a928 initial commit of README.md
 README.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..2da2f39
--- /dev/null
+++ b/README.md
@@ -0,0 +1,8 @@
+# Bandit Notes
+Some notes for bandit30 of bandit.
+
+## credentials
+
+- username: bandit29
+- password: <no passwords in production!>
+
03aa12c add gif2ascii
 code/gif2ascii.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/code/gif2ascii.py b/code/gif2ascii.py
new file mode 100644
index 0000000..8b13789
--- /dev/null
+++ b/code/gif2ascii.py
@@ -0,0 +1 @@
+
(END)
```

- **Descripción:** *Muestra un historial de commits con las siguientes opciones:*
  - **`--oneline`:** *Muestra un resumen de cada commit en una sola línea.*
  - **`--color=always`:** *Habilita los colores en la salida, para mejorar la visualización.*
  - **`--abbrev-commit`:** *Muestra los hashes de los commits de manera abreviada.*
  - **`--binary`:** *Muestra cambios en archivos binarios.*
  - **`--all`:** *Muestra el historial de todas las ramas (no solo la rama actual).*
  - **`--stat`:** *Muestra estadísticas sobre los archivos modificados en cada commit (por ejemplo, cuántas líneas se añadieron o eliminaron).*
- **Objetivo:** *Buscar más detalles en los commits, ya que podría haber más pistas sobre el password en los mensajes de los commits o en los cambios realizados.*

### ***8. `git checkout 081ac38`***

```bash
bandit29@bandit:/tmp/tmp.FJyCuUjl4N/repo$ git checkout 081ac38
Note: switching to '081ac38'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 081ac38 add data needed for development
```

- **Descripción:** *Cambia el repositorio al commit especificado por el hash `081ac38`.*
- **Resultado:** *Se coloca el repositorio en un **estado HEAD separado** (`detached HEAD`), lo que significa que el repositorio ya no está en una rama específica, sino que se está viendo un commit individual.*
- **Objetivo:** *Ver los archivos tal como estaban en ese commit específico, para encontrar información relevante.*

### ***9. `cat README.md`***

```bash
cat README.md
# Bandit Notes
Some notes for bandit30 of bandit.

## credentials

- username: bandit30
- password: qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL

```

- **Descripción:** *Al ejecutar `cat README.md` después de hacer el `git checkout`, se muestra el contenido del archivo `README.md` en el commit `081ac38`, que ahora contiene la contraseña real:*
  - **`password: 4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7`**

### ***10. `cat README.md | grep -iEw "password*" | rev | awk '{print $1}' | rev`***

```bash
cat README.md | grep -iEw "password*" | rev | awk '{print $1}' | rev
qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL
```

- **Descripción:** *Este comando extrae la contraseña de manera eficiente:*
  - **`grep -iEw "password*"`:** *Busca la palabra "password" (sin distinguir entre mayúsculas y minúsculas) en el archivo `README.md`.*
  - **`rev`:** *Invierte las líneas del resultado del `grep`.*
  - **`awk '{print $1}'`:** *Extrae la primera palabra de cada línea (en este caso, la contraseña).*
  - **`rev`:** *Invierte nuevamente el texto para obtener la contraseña en su formato original.*
- **Resultado:** *Extrae la contraseña en formato limpio y la muestra:*

     ```bash
     qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL
     ```

- **Objetivo:** *Obtener la contraseña para el siguiente nivel, `bandit30`.*

---

### **Resumen del proceso**

**1. Clonación del repositorio:** *Se clonó el repositorio del usuario `bandit29-git` usando un puerto SSH no estándar (`2220`).*
**2. Revisión de ramas y commits:** *Se revisaron las ramas y los logs de commits en busca de información oculta.*
**3. Cambio de estado de HEAD:** *Se hizo un checkout a un commit específico, lo que permitió acceder a una versión anterior del archivo `README.md`.*
**4. Extracción de la contraseña:** *Se extrajo la contraseña de manera eficiente usando herramientas como `grep`, `awk`, y `rev`, que permiten buscar y manipular texto en la salida.*

- *De esta manera, se obtuvo la contraseña para el siguiente nivel (`bandit30`).*
