<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 30 → Nivel 31***

- **Meta de nivel**

- *Hay un repositorio git en ssh://bandit30-git@localhost/home/bandit30-git/repo a través del puerto 2220. La contraseña del usuario bandit30-git es la misma que la del usuario bandit30.*

- *Clona el repositorio y encuentra la contraseña para el siguiente nivel.*
- *Comandos que puedes necesitar para resolver este nivel*

- *git*

Aquí te explico detalladamente cómo resolver el nivel 30 de Bandit.

## **1. Crear un directorio temporal y clonar el repositorio**

- *Comenzamos creando un directorio temporal usando el comando `mktemp -d`, que genera un directorio único y seguro, y luego nos movemos a ese directorio:*

```bash
cd $(mktemp -d)
```

- *Luego, usamos el comando `git clone` para clonar el repositorio del usuario `bandit30-git` desde el servidor local. Es importante especificar el puerto correcto (2220) usando la variable de entorno `GIT_SSH_COMMAND` para indicar que se debe conectar a ese puerto:*

```bash
GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit30-git@localhost/home/bandit30-git/repo
```

- *Esto clonará el repositorio en el directorio actual y descargará todos los archivos.*

### **2. Explorar el contenido del repositorio**

- *Una vez que el repositorio ha sido clonado, cambiamos al directorio `repo` que se ha creado:*

```bash
cd repo
```

- *Al ejecutar el comando `cat README.md`, vemos que el archivo `README.md` está vacío, con un mensaje que dice **"just an empty file... muahaha"**. Esto puede ser una pista de que la solución no está directamente en el contenido de este archivo, sino en algo más dentro del repositorio:*

```bash
cat README.md
just an empty file... muahaha
```

### **3. Consultar el historial de commits**

- *Luego, se ejecuta `git log` para ver el historial de los commits en el repositorio. Este comando muestra los detalles de los commits previos en el repositorio. Las opciones `--all`, `--oneline`, `--color=always`, `--binary`, `--summary`, `--abbrev-commit`, y `--stat` personalizan cómo se visualiza la información:*

```bash
git log --all --oneline --color=always --binary --summary --abbrev-commit --stat
```

- **Este comando muestra lo siguiente:**

```bash
acfc3c6 (HEAD -> master, origin/master, origin/HEAD) initial commit of README.md
 README.md | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 README.md

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..029ba42
--- /dev/null
+++ b/README.md
@@ -0,0 +1 @@
+just an empty file... muahaha
```

- *En este historial de commits, vemos que el único commit registrado en el repositorio es el **commit inicial** que creó el archivo `README.md` con el mensaje **"just an empty file... muahaha"**.*

### **4. Verificar las tags del repositorio**

- *Para ver las tags asociadas con el repositorio, ejecutamos el comando `git tag`. Las tags son puntos específicos en el historial del repositorio que pueden usarse para marcar versiones importantes:*

```bash
git tag
```

- *La salida indica que existe una tag llamada **`secret`**:*

```bash
secret
```

### **5. Mostrar detalles de la tag `secret`**

- **Finalmente, podemos usar el comando `git show` para ver el contenido asociado con la tag `secret`. Este comando muestra el commit específico al que está asociada la tag, y el mensaje oculto en ese commit:**

```bash
git show secret
```

**La salida es:**

```bash
fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy
```

- *Este es el **password** necesario para acceder al siguiente nivel.*

### ***Resumen de los pasos***

1. *Creamos un directorio temporal y clonamos el repositorio.*
2. *Abrimos el archivo `README.md`, que parece estar vacío, pero contiene una pista.*
3. *Consultamos el historial de commits usando `git log` para revisar los cambios previos en el repositorio.*
4. *Listamos las tags del repositorio con `git tag`, y encontramos una tag llamada `secret`.*
5. *Mostramos los detalles de la tag `secret` con `git show secret`, lo que revela la contraseña para el siguiente nivel.*

- **La contraseña que encontramos es:**
**fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy**.

*Este es el password necesario para el siguiente nivel, **bandit31**.*
