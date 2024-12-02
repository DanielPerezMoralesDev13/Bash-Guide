<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Cómo simular el ejercicio Bandit Nivel 20 → Nivel 21 en tu host local***

- *Puedes replicar este ejercicio en tu máquina utilizando herramientas como **Netcat (nc)** para el servidor y un script simple que simule el comportamiento de `suconnect`.*

---

## ***Paso 1: Crear el script simulado de `suconnect`***

- *Este script se conectará a un puerto local, leerá una contraseña y enviará una respuesta si la contraseña es correcta.*

### **Crear el script:**

```bash
#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: $0 <portnumber>"
    exit 1
fi

PASSWORD="0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO"  # Contraseña esperada
PORT=$1

echo "Connecting to localhost on port $PORT..."

exec 3<>/dev/tcp/localhost/$PORT  # Abre una conexión TCP

# Leer línea del servidor
read -r INPUT <&3
echo "Read: $INPUT"

# Verificar la contraseña
if [ "$INPUT" == "$PASSWORD" ]; then
    echo "Password matches, sending next password"
    echo "EeoULMCra2q0dSkYj561DX7s1CpBuOBt" >&3  # Envía la nueva contraseña
else
    echo "Password incorrect"
fi

exec 3>&-  # Cierra la conexión
```

1. **Guardar el archivo como `suconnect.sh`**.
2. **Dar permisos de ejecución**:

   ```bash
   chmod +x suconnect.sh
   ```

---

## **Paso 2: Iniciar el servidor con Netcat**

- *Abre una terminal y ejecuta el siguiente comando para iniciar el servidor en el puerto **5757**:*

```bash
nc -nlvp 5757
```

- **`-n`:** *No realiza resolución de DNS.*
- **`-l`:** *Escucha conexiones entrantes.*
- **`-v`:** *Modo detallado.*
- **`-p 5757`:** *Especifica el puerto.*

---

## **Paso 3: Ejecutar el script de conexión**

- *Abre una segunda terminal y ejecuta el script simulando el binario `suconnect`:*

```bash
./suconnect.sh 5757
```

---

## **Paso 4: Interacción entre el servidor y el cliente**

1. *En la terminal del servidor, introduce la contraseña:*

   ```bash
   0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
   ```

2. *Si la contraseña es correcta, el servidor mostrará:*

   ```bash
   Connection received on 127.0.0.1 36682
   EeoULMCra2q0dSkYj561DX7s1CpBuOBt
   ```

3. *En la terminal del cliente (script), verás:*

   ```bash
   Read: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
   Password matches, sending next password
   ```

---

## **Explicación del flujo:**

- **Cliente (`suconnect.sh`):** *Se conecta al puerto especificado, espera recibir una contraseña y envía la respuesta si es correcta.*
- **Servidor (`nc`):** *Escucha en el puerto especificado y simula el envío y recepción de datos.*

### **1. ¿Por qué crear un nuevo descriptor de archivo (`3<>`)?**

- *En Bash, puedes usar descriptores de archivo para gestionar entradas y salidas de manera más flexible. Cuando usas `exec 3<>`, estás **asignando un nuevo descriptor de archivo** (el número `3` en este caso) para controlar específicamente la entrada y salida de una conexión o archivo.*

- *Esto es importante porque **te permite gestionar múltiples flujos de entrada y salida simultáneamente**. En este caso, la conexión TCP tiene tanto entrada como salida, y puedes querer mantenerla separada de la entrada/salida estándar del programa.*

#### ***Ventajas de usar un nuevo descriptor***

1. **Control explícito:** *Usar `3<>` hace que el código sea más claro y explícito. Estás diciendo **"quiero manejar esta conexión TCP con el descriptor `3`"**, lo que hace que el código sea más organizado y legible.*

2. **Multiples flujos:** *Si en el futuro quieres agregar más conexiones o manipular múltiples entradas/salidas de diferentes fuentes (por ejemplo, si tu script maneja más de una conexión TCP), necesitarás diferentes descriptores para no interferir con los flujos estándar (`stdin`, `stdout`, `stderr`).*

3. **No interferir con `stdin`, `stdout` o `stderr`:** *Al usar un nuevo descriptor (como `3`), no necesitas preocuparte por **sobrescribir** las entradas o salidas estándar del script. Puedes seguir usando `stdin`, `stdout` y `stderr` para interactuar con el terminal mientras gestionas la conexión TCP por separado.*

### ***2. ¿No se podría usar `<>` directamente?***

- *Sí, **se podría usar `<>` directamente**, pero esto afectaría a la entrada/salida estándar. Es decir, redirigirías **todo el flujo de entrada y salida del script** hacia la conexión TCP. Esto no es lo que queremos si solo necesitamos **interactuar con la conexión TCP** y seguir usando las funcionalidades estándar de entrada y salida.*

#### ***¿Qué pasaría si usáramos `<>` directamente?***

**Supongamos que ejecutamos algo como esto:**

```bash
<> /dev/tcp/localhost/$PORT
```

- *Lo que harías es redirigir tanto la **entrada como la salida** del script a esa conexión TCP.*
- *Es decir, **todo lo que leas de la entrada estándar (`stdin`) o escribas en la salida estándar (`stdout`) iría directamente a la conexión TCP**.*
- *Esto no es lo ideal, ya que interferiría con la comunicación estándar del script.*

### 3. **Diferencia entre usar un nuevo descriptor de archivo y usar `<>` directamente**

- **La diferencia clave está en cómo gestionas el flujo de datos:**

- **Usando `3<>`:** *Abres un descriptor de archivo específico para la conexión TCP, lo que te permite **mantener la entrada/salida estándar separada** de la conexión. Así, puedes seguir usando `stdin`, `stdout`, `stderr` normalmente en el script y manejar la comunicación TCP a través de un canal separado (el descriptor `3`).*
  
- **Usando `<>` directamente:** *Redirigirías toda la entrada y salida del script a la conexión TCP, lo que **bloquearía la interacción estándar con el usuario** y podría ser confuso si estás intentando hacer otras operaciones en el script que requieran acceso a `stdin` o `stdout`.*

### **4. Ejemplo práctico de por qué usar un descriptor***

- *Imagina que en el futuro tu script necesita interactuar con dos servicios a través de conexiones TCP diferentes. Si usas un solo descriptor de archivo para ambas conexiones, se interrumpirían entre sí. Pero si usas dos descriptores (por ejemplo, `3` y `4`), puedes **mantener las dos conexiones separadas** y manejarlas independientemente.*

```bash
# Conexión 1
exec 3<> /dev/tcp/localhost/5000

# Conexión 2
exec 4<> /dev/tcp/localhost/3000

# Leer de la primera conexión
read -r input1 <&3

# Leer de la segunda conexión
read -r input2 <&4
```

- *Usar `exec 3<>` nos da **control total** sobre el descriptor de archivo, lo que permite manejar la conexión TCP sin afectar la entrada o salida estándar.*
- *Si usáramos `<>` directamente, redirigiríamos toda la entrada y salida estándar del script hacia la conexión TCP, lo cual no es conveniente si necesitamos interactuar con el usuario o realizar otras operaciones.*

*Este enfoque de **múltiples descriptores de archivo** hace que el código sea más flexible, modular y fácil de mantener.*
