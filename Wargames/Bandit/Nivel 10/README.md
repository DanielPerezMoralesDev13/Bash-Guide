<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 9 → Nivel 10***

- **Meta de nivel**

- *La contraseña para el siguiente nivel está almacenada en el archivo data.txt en una de las pocas cadenas legibles por humanos, precedida por varios caracteres '='.*
- **Comandos que puedes necesitar para resolver este nivel**

- *grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd*

## **Explicación de comandos y ejemplos**

---

### **Comando `reset`**

#### **Descripción**

*El comando `reset` se utiliza para restablecer el terminal a su estado predeterminado. Es útil cuando el terminal se "rompe" debido a caracteres no legibles o comportamientos inesperados.*

##### **Sintaxis**

```bash
reset
```

##### **Salida**

*No genera salida visible, pero el terminal vuelve a un estado funcional.*

##### **Análisis de la salida**

*Este comando limpia el entorno del terminal, eliminando problemas visuales o errores provocados por datos corruptos.*

##### **Resumen**

*`reset` es una herramienta esencial para resolver problemas visuales en la terminal después de manipular archivos binarios o datos mal formateados.*

---

#### **Comando `strings`**

##### **Descripción:**

*`strings` extrae cadenas imprimibles de un archivo. Es útil para analizar archivos binarios o datos no legibles, especialmente en el contexto de pentesting.*

##### **Ejemplo**

```bash
strings data.txt
```

##### **Salida:**

*Muestra todas las cadenas imprimibles del archivo `data.txt`.*

##### **Análisis de la salida:**

*Permite buscar información legible en archivos binarios.*

##### **Combinación práctica**

*Para encontrar la última línea que contiene un signo igual `=`:*

```bash
strings data.txt | grep -iEw "=" | tail -n 1 | awk 'NF{print $NF}'
```

**Salida esperada:**

```bash
FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
```

##### **Resumen de `strings`**

*`strings` es útil para analizar datos binarios y filtrar cadenas relevantes mediante combinaciones con herramientas como `grep`, `tail` y `awk`.*

---

#### **Uso de `while read line`**

##### **Descripción `while read line`**

*`while read line` permite procesar archivos línea por línea de forma eficiente.*

##### **Forma no práctica**

**Usar un *pipe* para leer el archivo:**

```bash
cat /etc/passwd | while read line; do
  echo "Estamos Aqui: $line"
done
```

**Problema:**
*El uso de `cat` puede generar un subshell que afecta el manejo de variables en el bucle.*

##### **Forma práctica**

- *Leer directamente el archivo:*

```bash
while read line; do
  echo "Estamos Aqui: $line"
done < /etc/passwd
```

##### **Salida Del Comando Anterior**

```bash
Estamos Aqui: root:x:0:0:root:/root:/bin/bash
Estamos Aqui: daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
Estamos Aqui: bin:x:2:2:bin:/bin:/usr/sbin/nologin
Estamos Aqui: sys:x:3:3:sys:/dev:/usr/sbin/nologin
Estamos Aqui: sync:x:4:65534:sync:/bin:/bin/sync
Estamos Aqui: games:x:5:60:games:/usr/games:/usr/sbin/nologin
Estamos Aqui: man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
Estamos Aqui: lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
Estamos Aqui: mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
Estamos Aqui: news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
Estamos Aqui: uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
Estamos Aqui: proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
Estamos Aqui: www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
Estamos Aqui: backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
Estamos Aqui: list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
Estamos Aqui: irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
Estamos Aqui: _apt:x:42:65534::/nonexistent:/usr/sbin/nologin
Estamos Aqui: nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
Estamos Aqui: systemd-network:x:998:998:systemd Network Management:/:/usr/sbin/nologin
Estamos Aqui: systemd-timesync:x:996:996:systemd Time Synchronization:/:/usr/sbin/nologin
Estamos Aqui: dhcpcd:x:100:65534:DHCP Client Daemon,,,:/usr/lib/dhcpcd:/bin/false
Estamos Aqui: messagebus:x:101:101::/nonexistent:/usr/sbin/nologin
Estamos Aqui: syslog:x:102:102::/nonexistent:/usr/sbin/nologin
Estamos Aqui: systemd-resolve:x:991:991:systemd Resolver:/:/usr/sbin/nologin
Estamos Aqui: uuidd:x:103:103::/run/uuidd:/usr/sbin/nologin
Estamos Aqui: usbmux:x:104:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
Estamos Aqui: tss:x:105:104:TPM software stack,,,:/var/lib/tpm:/bin/false
Estamos Aqui: kernoops:x:106:65534:Kernel Oops Tracking Daemon,,,:/:/usr/sbin/nologin
Estamos Aqui: dnsmasq:x:999:65534:dnsmasq:/var/lib/misc:/usr/sbin/nologin
Estamos Aqui: avahi:x:107:110:Avahi mDNS daemon,,,:/run/avahi-daemon:/usr/sbin/nologin
Estamos Aqui: lightdm:x:108:111:Light Display Manager:/var/lib/lightdm:/bin/false
Estamos Aqui: tcpdump:x:109:113::/nonexistent:/usr/sbin/nologin
Estamos Aqui: fwupd-refresh:x:990:990:Firmware update daemon:/var/lib/fwupd:/usr/sbin/nologin
Estamos Aqui: saned:x:110:116::/var/lib/saned:/usr/sbin/nologin
Estamos Aqui: pulse:x:111:117:PulseAudio daemon,,,:/run/pulse:/usr/sbin/nologin
Estamos Aqui: cups-browsed:x:112:114::/nonexistent:/usr/sbin/nologin
Estamos Aqui: hplip:x:113:7:HPLIP system user,,,:/run/hplip:/bin/false
Estamos Aqui: polkitd:x:989:989:User for polkitd:/:/usr/sbin/nologin
Estamos Aqui: rtkit:x:114:120:RealtimeKit,,,:/proc:/usr/sbin/nologin
Estamos Aqui: colord:x:115:121:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
Estamos Aqui: cups-pk-helper:x:116:114:user for cups-pk-helper service,,,:/nonexistent:/usr/sbin/nologin
Estamos Aqui: whoopsie:x:117:123::/nonexistent:/bin/false
Estamos Aqui: speech-dispatcher:x:118:29:Speech Dispatcher,,,:/run/speech-dispatcher:/bin/false
Estamos Aqui: d4nitrix13:x:1000:1000:d4nitrix13:/home/d4nitrix13:/bin/bash
```

##### **Análisis de la salida del comando anterior**

*Cada línea del archivo se procesa y muestra con el prefijo "Estamos Aqui:".*

##### **Resumen Del Comando Anterior**

- *`while read line` es una forma eficiente de procesar archivos línea por línea.*

---

#### **Comando `uniq` y `sort`**

##### **Descripción Comando `uniq` y `sort`**

*`uniq` filtra líneas duplicadas en un archivo, pero **solo funciona con líneas adyacentes**, lo que requiere que el archivo esté previamente ordenado.*

##### **Forma incorrecta**

```bash
cat data.txt | uniq -u
```

*No funcionará porque `uniq` necesita que las líneas duplicadas sean consecutivas.*

##### **Forma correcta**

```bash
sort data.txt | uniq -u
```

##### **Salida `sort data.txt | uniq -u`**

```bash
4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
```

##### **Análisis de la salida `sort data.txt | uniq -u`**

1. *`sort` ordena las líneas.*
2. *`uniq -u` muestra solo las líneas que no tienen duplicados.*

##### **Resumen `sort data.txt | uniq -u`**

*Combinar `sort` con `uniq` asegura una identificación precisa de líneas únicas.*

---

#### **Atajo en Bash con `!$`**

##### **Descripción `!$`**

- *`!$` expande el último argumento del comando anterior, ahorrando tiempo al trabajar con nombres de archivos largos o complejos.*

##### **Ejemplo `!$`**

```bash
touch while.sh
chmod u+x !$
nvim !$
```

##### **Salida Usando `!$`**

```bash
chmod u+x while.sh
nvim while.sh
```

##### **Análisis de la salida Usando `!$`**

*`!$` se reemplaza automáticamente por `while.sh`, permitiendo reusar el último argumento de comandos previos.*

##### **Resumen De Comandos Usados Por `!$`**

*`!$` es un atajo práctico para reutilizar argumentos en comandos consecutivos.*

### **Explicación de comandos y Ejemplos**

---

#### **Declaración de Variables Enteras**

##### **Descripción De Declaración de Variables Enteras**

- *En Bash, puedes declarar variables que solo acepten valores enteros usando el comando `declare` con la opción `-i`. Si intentas asignar un valor no numérico, la variable se convierte automáticamente a `0`.*

#### **Ejemplo De Declaración de Variables Enteras**

```bash
declare -i numero=17
echo $numero  # 17

numero="text"
echo $numero  # 0 (porque "text" no es un número válido)
```

##### **Análisis de la salida Del Ejemplo**

1. *La variable `numero` se inicializa con el valor `17` y se imprime correctamente.*
2. *Cuando se intenta asignar un valor no numérico (`"text"`), Bash lo interpreta como `0`.*

##### **Resumen:**

- *Las variables enteras en Bash permiten manejar números de forma estricta, garantizando que las operaciones aritméticas sean consistentes.*

---

#### **Uso de Variables Enteras en un Script con `while read`**

##### **Descripción De Variables Enteras en un Script con `while read`**

*Puedes usar variables enteras declaradas con `declare -i` para contar líneas o realizar operaciones aritméticas dentro de bucles `while`.*

##### **Ejemplo de Script**

```bash
#!/usr/bin/env bash

declare -i contador=1
while read line; do
  echo "Line $contador: $line"
  let contador+=1
done </etc/passwd
```

##### **Salida Del Script:**

```bash
Line 1: root:x:0:0:root:/root:/bin/bash
Line 2: daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
...
Line 44: d4nitrix13:x:1000:1000:d4nitrix13:/home/d4nitrix13:/bin/bash
```

##### **Análisis de la salida Del Script**

1. *Cada línea del archivo `/etc/passwd` se procesa con el prefijo `Line` y el número de línea correspondiente.*
2. *El contador se incrementa en cada iteración con `let contador+=1`.*

##### **Resumen Del Scritp**

*El uso de `declare -i` asegura que las operaciones numéricas en los scripts sean precisas y eficientes.*

---

#### **One-liner para procesar datos**

##### **Descripción De One-liner para procesar datos**

- *Se puede combinar el procesamiento de datos con herramientas como `strings`, `grep`, y bucles `while`.*

##### **Ejemplo De One-liner para procesar datos**

```bash
declare -i contador=1
strings data.txt | grep -iEw "=" --color=always | while read line; do
  echo "Linea $contador: $line"
  let contador+=1
done
```

##### **Salida De One-liner para procesar datos**

```bash
Linea 1: }========== the
Linea 2: 3JprD========== passwordi
Linea 3: qC(=
Linea 4: ~fDV3========== is
Linea 5: 69}=
Linea 6: D9========== FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
```

##### **One-liner filtrado**

*Para obtener solo la sexta línea y el último campo:*

```bash
declare -i contador=1
strings data.txt | grep -iEw "=" --color=always | while read line; do
  echo "Linea $contador: $line"
  let contador+=1
done | awk 'NR==6' | awk 'NF{print $NF}'
```

**Salida:**

```bash
FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
```

##### **Análisis de la Salida**

1. *`grep` filtra las líneas con el símbolo `=`.*
2. *El bucle `while` enumera cada línea.*
3. *`awk 'NR==6'` selecciona la sexta línea, y el segundo `awk` extrae el último campo.*

##### **Resumen De One-liner para procesar datos**

*Los one-liners en Bash son ideales para combinar herramientas y extraer información específica de forma eficiente.*
