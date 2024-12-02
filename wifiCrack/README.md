<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Comando `id -u`***

```bash
id -u
1000
```

- **`id -u`:** *Muestra el ID del usuario actual (UID).*
- **`1000`:** *Es el UID del usuario estándar en sistemas Linux. Normalmente, los primeros usuarios creados tienen un UID a partir de 1000.*

---

## **Cambio a usuario root con `su`**

```bash
su root
id -u
0
```

- **`su root`:** *Cambia al usuario `root`. Te pide la contraseña de root.*
- **`id -u` después del cambio:** *El resultado es `0`, lo que indica que ahora eres el superusuario (`root`), que siempre tiene el UID `0`.*

---

## **Modo monitor en tarjetas de red Wi-Fi**

### **Concepto:**

- *El modo monitor permite a una tarjeta de red capturar todos los paquetes que pasan por el aire, sin necesidad de estar asociada a una red específica. Esto es útil para auditorías de redes.*

---

### **Habilitar el modo monitor:**

```bash
sudo airmon-ng start wlp6s0
```

#### **Salida:**

```bash
Found 4 processes that could cause trouble.
Kill them using 'airmon-ng check kill' before putting
the card in monitor mode, they will interfere by changing channels
and sometimes putting the interface back in managed mode

    PID Name
    920 avahi-daemon
    967 NetworkManager
    968 avahi-daemon
    971 wpa_supplicant

PHY     Interface       Driver          Chipset

phy0    wlp6s0          iwlwifi         Intel Corporation Wireless 3160 (rev 83)
                (mac80211 monitor mode vif enabled for [phy0]wlp6s0 on [phy0]wlp6s0mon)
                (mac80211 station mode vif disabled for [phy0]wlp6s0)
```

- **`airmon-ng start wlp6s0`:** *Cambia la tarjeta de red `wlp6s0` al modo monitor.*
- **Problemas detectados:** *El comando detecta procesos (como `NetworkManager` y `wpa_supplicant`) que podrían interferir con el modo monitor.*
- **PHY:** *Identifica el adaptador físico (`phy0`).*
- **Driver:** *La tarjeta usa el controlador `iwlwifi` para un chip Intel.*

---

### **Apagar la interfaz monitor:**

```bash
sudo ifconfig wlp6s0mon down
```

- **`ifconfig wlp6s0mon down`:** *Desactiva temporalmente la interfaz en modo monitor para realizar cambios como el cambio de MAC.*

---

## **Cambio de dirección MAC con `macchanger`**

```bash
sudo macchanger -a wlp6s0mon
```

```bash
Current MAC:   e4:02:9b:1d:40:ac (unknown)
Permanent MAC: e4:02:9b:1d:40:ac (unknown)
New MAC:       00:50:6d:04:07:95 (VIDEOJET SYSTEMS)
```

- **`macchanger -a`:** *Cambia la dirección MAC aleatoriamente.*
- **Current MAC:** *La MAC actual antes del cambio.*
- **Permanent MAC:** *La MAC original de fábrica.*
- **New MAC:** *La nueva dirección MAC asignada aleatoriamente.*

---

### **Activar nuevamente la interfaz:**

```bash
sudo ifconfig wlp6s0mon up
```

- **`ifconfig wlp6s0mon up`:** *Reactiva la interfaz en modo monitor después del cambio de MAC.*

---

## **Verificación de la MAC actual:**

```bash
sudo macchanger -s wlp6s0mon
```

```bash
Current MAC:   00:50:6d:04:07:95 (VIDEOJET SYSTEMS)
Permanent MAC: e4:02:9b:1d:40:ac (unknown)
```

- **`macchanger -s`:** *Muestra la MAC actual y la permanente.*

---

## **Detener el modo monitor:**

```bash
sudo airmon-ng stop wlp6s0mon
```

```bash
PHY     Interface       Driver          Chipset

phy0    wlp6s0mon       iwlwifi         Intel Corporation Wireless 3160 (rev 83)
                (mac80211 station mode vif enabled on [phy0]wlp6s0)
                (mac80211 monitor mode vif disabled for [phy0]wlp6s0mon)
```

- **`airmon-ng stop`:** *Devuelve la tarjeta al modo normal (`managed`).*

---

### **Comando de lectura del output de MAC en un script:**

```bash
macchanger -s wlp6s0mon | rg -iw "Current" --color=always | xargs | cut -d ' ' -f '3-100'
```

- **`rg -iw "Current"`:** *Busca la palabra `Current` (ignora mayúsculas).*
- **`xargs`:** *Convierte el output en una sola línea.*
- **`cut -d ' ' -f '3-100'`:** *Extrae la MAC desde el tercer campo en adelante.*

---

## **`timeout` y redirección de errores (`stderr`):**

```bash
timeout 5 bash -c "airodump-ng wlp6s0mon"
```

- **`timeout 5`:** *Ejecuta el comando por 5 segundos.*
- **`stderr`:** *Si el comando produce errores, se redirigen al flujo de error estándar, no al normal (`stdout`).*

### **Continuación: Explicación detallada de los conceptos y comandos restantes**

---

## **Proceso `airodump-ng` y verificación con `ps`**

### **Comando:**

```bash
ps -faux | grep airodump
```

- **`ps -faux`:** *Muestra una lista de todos los procesos en ejecución, con detalles completos (`f`), en formato jerárquico (`a`), e incluyendo procesos del sistema (`u` y `x`).*
- **`grep airodump`:** *Filtra la salida para mostrar solo las líneas que contienen la palabra `airodump`.*

- *Esto es útil para verificar si el proceso `airodump-ng` sigue ejecutándose después de lanzarlo.*

---

## **Ejecutar comandos en una nueva terminal con `xterm`**

```bash
xterm -hold -e "airodump-ng ${networkCard}mon" &
```

- **`xterm`:** *Abre una nueva ventana de terminal.*
- **`-hold`:** *Mantiene la ventana abierta después de que el comando termine.*
- **`-e`:** *Especifica el comando a ejecutar en la nueva terminal.*
- **`&`:** *Envía el proceso al fondo, permitiendo seguir usando la terminal actual.*

- *El comando abre una nueva ventana para ejecutar `airodump-ng` en la interfaz en modo monitor.*

---

### **Ejemplo adicional con `whoami`:**

```bash
xterm -hold -e "whoami" &
```

- *Este comando abriría una ventana nueva que muestra el nombre del usuario actual y se mantendría abierta.*

---

## **Verificar propiedades de la ventana con `xprop`**

```bash
xprop WM_CLASS
```

```bash
WM_CLASS(STRING) = "xterm", "XTerm"
```

### **Explicación:**

- **`xprop`:** *Muestra las propiedades de una ventana gráfica en X11.*
- **`WM_CLASS`:** *Identifica la clase de la ventana, útil para configurar reglas en administradores de ventanas.*

- *En este caso, la clase es `"xterm"`, lo que permite identificarla como una ventana del terminal `xterm`.*

---

## **Significado de `$!` en Bash**

```bash
xterm -hold -e "whoami" &
echo $!
```

- **`$!`:** *Contiene el PID (Process ID) del último proceso ejecutado en segundo plano (`&`).*
  
- *En el ejemplo, el PID de `xterm` se almacenaría en `$!`, lo que permite interactuar con ese proceso, como terminarlo con `kill`.*

---

## **Finalizar procesos en segundo plano:**

```bash
kill %%
```

- **`%%`:** *Se refiere al último proceso ejecutado en segundo plano en la sesión actual.*
- **`kill`:** *Envía una señal para detener el proceso. Por defecto, envía la señal `SIGTERM`.*

- *Esto detiene el último proceso enviado al fondo.*

---

## **Ataques de deautenticación Wi-Fi:**

- *[Enlace ataques de deauthentication en redes Wi-Fi:](https://en.wikipedia.org/wiki/Wi-Fi_deauthentication_attack "https://en.wikipedia.org/wiki/Wi-Fi_deauthentication_attack")*

- **Deauthentication attack:** *Es un ataque en el que se envían paquetes falsos de desautenticación a los clientes de una red Wi-Fi, forzándolos a desconectarse.*

- *Esto puede usarse para interrumpir el servicio o capturar el **handshake** para ataques de fuerza bruta.*

---

## **Canales y salto de canales (Channel Hopping):**

- *El **channel hopping** permite a herramientas como `airodump-ng` moverse entre diferentes canales para monitorear todas las frecuencias disponibles en una red Wi-Fi.*

---

## **Análisis de captura con `pyrit`:**

```bash
pyrit -r Captura-01.cap analyze
```

- **`pyrit -r Captura-01.cap analyze`:** *Analiza el archivo de captura (`.cap`) para identificar posibles redes y handshakes que puedan ser utilizados en ataques posteriores.*
