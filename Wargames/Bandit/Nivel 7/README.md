<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 6 → Nivel 7***

- **Meta de nivel**

- *La contraseña para el siguiente nivel se almacena en algún lugar del*
  - **servidor y tiene todas las propiedades siguientes:**
  - **propiedad del usuario bandit7**
  - **propiedad del grupo bandit6**
  - **33 bytes de tamaño**

- **Comandos que puede necesitar para resolver este nivel**

- *ls, cd, cat, archivo, du, encontrar, grep*

## ***1. Comando `find / -user bandit7 -group bandit6 -size 33c 2>/dev/null | xargs cat`***

```bash
find / -user bandit7 -group bandit6 -size 33c 2>/dev/null | xargs cat
```

- **Descripción:** *Este comando busca archivos en el sistema de archivos (`/`) que cumplan con los siguientes criterios:*
  - **`-user bandit7`:** *El archivo debe pertenecer al usuario `bandit7`.*
  - **`-group bandit6`:** *El archivo debe pertenecer al grupo `bandit6`.*
  - **`-size 33c`:** *El archivo debe tener un tamaño de exactamente 33 bytes (`c` significa "bytes").*
  
  *La redirección `2>/dev/null` se usa para redirigir los errores generados por `find` (como archivos a los que no se tiene acceso) al dispositivo especial `/dev/null`, que es un "agujero negro" para los datos, descartando cualquier salida de error. Esto permite ignorar los errores y evitar que se muestren en la terminal.*

  **Comando `xargs cat`:** **La salida de `find` (los nombres de los archivos que cumplen con los criterios) *se pasa como entrada a `xargs`, que luego ejecuta `cat` sobre esos archivos para mostrar su contenido.*

- **Salida:** *El contenido de los archivos encontrados se muestra, mientras que cualquier error se descarta.*

---

## ***2. Explicación de las redirecciones y el uso de `2>/dev/null`***

- **`2>/dev/null`**:
  - **`2`:** **Se refiere al descriptor de archivo estándar de errores (stderr).**
  - **`>/dev/null`:** **Redirige la salida de errores al dispositivo especial `/dev/null`, lo que descarta *cualquier dato enviado a él.*

  *Este mecanismo es útil cuando no te interesa ver los errores generados por un comando, como puede ocurrir con algunos procesos que intentan acceder a archivos o directorios restringidos.*

---

## ***3. Más ejemplos de redirección***

### ***Comando `code Directory --verbose 2>/dev/null`***

```bash
code Directory --verbose 2>/dev/null
```

- **Descripción:** *Ejecuta el comando `code` (Visual Studio Code) con la opción `--verbose`, que activa el modo detallado (verbose), mostrando más información, incluyendo mensajes de error e informativos. La redirección `2>/dev/null` descarta cualquier mensaje de error.*

---

### ***Comando `code Directory --verbose >/dev/null 2>/dev/null`***

```bash
code Directory --verbose >/dev/null 2>/dev/null
```

- **Descripción:** *Redirige tanto la salida estándar (informativa) como la salida de errores a `/dev/null`, lo que significa que no se mostrará ningún mensaje (ni informativo ni de error).*

---

### ***Comando `code Directory --verbose >/dev/null 2>&1`***

```bash
code Directory --verbose >/dev/null 2>&1
```

- **Descripción:** *Redirige tanto la salida estándar (stdout) como la salida de errores (stderr) a `/dev/null`. Esto es equivalente a redirigir ambos a un solo flujo de salida, que se descarta.*

---

### ***Comando `code Directory --verbose &>/dev/null`***

```bash
code Directory --verbose &>/dev/null
```

- **Descripción:** *Es equivalente a `>/dev/null 2>&1`, redirigiendo tanto stdout como stderr a `/dev/null`.*

---

## ***4. Ejecución en segundo plano y la redirección de salida***

### ***Comando `firefox &>/dev/null &`***

```bash
firefox &>/dev/null &
```

- **Descripción:** *Este comando ejecuta `firefox` en segundo plano, redirigiendo tanto la salida estándar (informativa) como los errores a `/dev/null` para que no se muestren en la terminal.*

- **Efecto en el sistema:**
  - *El proceso de Firefox se ejecuta en segundo plano y no bloquea la terminal, permitiendo que puedas ejecutar otros comandos mientras Firefox está en ejecución.*

---

### ***Comando `firefox &>/dev/null & disown`***

```bash
firefox &>/dev/null & disown
```

- **Descripción:** *Ejecuta `firefox` en segundo plano y luego desvincula el proceso de la terminal con el comando `disown`. Esto asegura que el proceso de Firefox siga funcionando incluso si cierras la terminal.*

- **Efecto en el sistema:**
  - *Firefox se ejecuta en segundo plano y permanece activo incluso después de cerrar la terminal, ya que se ha desvinculado de la terminal padre.*

---

## ***5. Explicación de los operadores `&`, `1`, `2`, `>`, y `&>`***

### ***Operador `&`***

- **Descripción:** *Cuando se coloca al final de un comando, ejecuta el proceso en segundo plano, liberando la terminal para que puedas continuar usando otros comandos sin que se bloquee.*

  **Ejemplo:**

  ```bash
  firefox &
  ```

---

### ***Operadores `1` y `2`***

- **`1`:** **Se refiere al descriptor de archivo para la salida estándar (stdout).**
- **`2`:** **Se refiere al descriptor de archivo para la salida de errores (stderr).**

---

### ***Operador `>`***

- **Descripción:** *Redirige la salida estándar de un comando a un archivo o dispositivo.*

  **Ejemplo:**

  ```bash
  ls > archivos.txt
  ```

  *Esto redirige la salida de `ls` al archivo `archivos.txt`.*

---

### ***Operador `&>`***

- **Descripción:** *Redirige tanto stdout como stderr a un archivo o dispositivo.*

  **Ejemplo:**

  ```bash
  command &> salida.log
  ```

  *Esto redirige tanto los mensajes informativos como los errores a `salida.log`.*

---

### ***Resumen***

1. **`2>/dev/null`:** **Redirige los errores (stderr) a `/dev/null` para descartarlos.**
2. **`&`:** **Ejecuta el comando en segundo plano, liberando la terminal.**
3. **`disown`:** **Desvincula un proceso de la terminal, permitiendo que siga ejecutándose incluso si la *terminal se cierra.*
4. **Redirección de salida:** ***`>`** redirige stdout, **`2>`** redirige stderr, y **`&>`** redirige ambos.*
5. **Uso de `/dev/null`:** **Es un dispositivo que descarta cualquier dato que se le envíe, útil para *ignorar salidas o errores.*
