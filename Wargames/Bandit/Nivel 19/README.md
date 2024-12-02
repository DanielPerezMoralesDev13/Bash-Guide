<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 18 → Nivel 19***

- **Meta de nivel**

- *La contraseña para el siguiente nivel está almacenada en un archivo readme en el homedirectory. Desafortunadamente, alguien ha modificado .bashrc para cerrar tu sesión cuando entras con SSH.*
- **Comandos que puedes necesitar para resolver este nivel**

- *ssh, ls, cat*

## ***Explicación detallada del proceso de conexión y ejecución de comandos por SSH***

> [!NOTE]
> *Cuando te conectas a un servidor remoto mediante **SSH** (Secure Shell), el sistema carga automáticamente la configuración asociada al usuario que inicias sesión. Cada usuario tiene asignada una **shell** por defecto (en muchos casos, **bash**), y esta shell ejecuta un archivo de configuración específico, como `.bashrc` o `.bash_profile`, donde se definen alias, funciones y otros ajustes. Esta ejecución se realiza al iniciar sesión de manera interactiva o al abrir una nueva sesión de shell.*

### ***Flujo general de la conexión SSH:***

1. **Conexión y autenticación:**

   ```bash
   ssh bandit18@bandit.labs.overthewire.org -p 2220
   ```

   - *El comando establece una conexión SSH al servidor `bandit.labs.overthewire.org` en el puerto 2220.*
   - *Una vez ingresada la contraseña correcta, el servidor inicia la sesión y carga el entorno definido por el archivo `.bashrc`.*

2. **Ejecución de archivos de configuración:**
   *Al iniciar la sesión de shell, **bash** ejecuta el archivo `.bashrc`, que puede contener configuraciones como:*
   - **Alias.**
   - **Funciones personalizadas.**
   - **Variables de entorno.**

   - *Esto puede causar un **lapso de tiempo** entre el inicio de la sesión SSH y la finalización de la carga del entorno, lo que permite la inyección de comandos antes de que se complete la configuración.*

---

### ***Aprovechando el lapso de tiempo para ejecutar comandos:***

- *Puedes usar ciertos trucos para ejecutar comandos **inmediatamente** después de conectarte por SSH, evitando que el archivo `.bashrc` te limite o interfiera con tus acciones:*

1. **Ejecutar un comando diferente al shell por defecto:**

   ```bash
   ssh bandit18@bandit.labs.overthewire.org -p 2220 bash
   ```

   - *En este caso, estás forzando que **bash** se ejecute directamente, lo que evita que otros scripts o configuraciones iniciales interfieran.*

2. **Reemplazar la shell por un comando con `exec`:**

   ```bash
   ssh bandit18@bandit.labs.overthewire.org -p 2220 exec bash
   ```

   ```bash
   ssh bandit18@bandit.labs.overthewire.org -p 2220 exec bash
                    _                     _ _ _
                | |__   __ _ _ __   __| (_) |_
                | '_ \ / _` | '_ \ / _` | | __|
                | |_) | (_| | | | | (_| | | |_
                |_.__/ \__,_|_| |_|\__,_|_|\__|


                This is an OverTheWire game server.
    More information on http://www.overthewire.org/wargames

   bandit18@bandit.labs.overthewire.org's password:
   find .
   .
   ./readme
   ./.profile
   ./.bashrc
   ./.bash_logout
   pwd
   /home/bandit18
   cat readme
   cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8
   ```

   - *Esto reemplaza el proceso de shell inicial con uno nuevo, asegurando que **bash** se ejecute limpio.*

---

### ***Ejecución de comandos específicos tras la conexión:***

- **SSH permite ejecutar comandos remotos directamente en el servidor sin necesidad de iniciar una sesión interactiva:**

#### ***Ejemplo incorrecto (sin comillas)***

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 cat ~/readme
```

- **Salida**

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 "cat ~/readme"
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

bandit18@bandit.labs.overthewire.org's password:
cat: /home/d4nitrix13/readme: No such file or directory
```

> [!CAUTION]
> **Este comando falla porque `~` no se expande correctamente cuando se pasa sin comillas.**

#### ***Ejemplo correcto (con comillas)***

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 "cat ~/readme"
```

- **Salida**

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 "cat ~/readme"
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

bandit18@bandit.labs.overthewire.org's password:
cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8
```

> [!TIP]
> *En este caso, **`cat ~/readme`** se ejecuta correctamente porque las comillas aseguran que **`~`** se interprete en el contexto del usuario remoto, no del local.*

---

### ***Resumen:***

- ***SSH** inicia la conexión y ejecuta el entorno de usuario, incluyendo archivos como **`.bashrc`.***
- *Durante el tiempo de carga, puedes forzar la ejecución de un shell limpio usando **`bash`** o **`exec bash`.***
- *Para ejecutar comandos remotos directamente, siempre usa comillas para asegurar la correcta interpretación de rutas o variables.*
