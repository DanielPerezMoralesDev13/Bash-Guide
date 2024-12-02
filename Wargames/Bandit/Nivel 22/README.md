<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 21 → Nivel 22***

- **Meta de nivel**

- *Un programa se está ejecutando automáticamente a intervalos regulares desde cron, el programador de trabajos basado en tiempo. Busca en /etc/cron.d/ la configuración y mira qué comando se está ejecutando.*
- *Comandos que puede necesitar para resolver este nivel*

## **Pasos para resolver el nivel:**

1. **Explorar el directorio `/etc/cron.d`**  
   *Los archivos en `/etc/cron.d` contienen configuraciones de trabajos programados por `cron`.*  

   ```bash
   cd /etc/cron.d
   ```

   ```bash
   bandit21@bandit:/etc/cron.d$ ls -lA
   total 28
   -rw-r--r-- 1 root root 120 Sep 19 07:08 cronjob_bandit22
   ```

2. **Revisar el contenido del archivo `cronjob_bandit22`:**  
   *Este archivo muestra el comando que se ejecuta periódicamente.*  

   ```bash
   bandit21@bandit:/etc/cron.d$ cat cronjob_bandit22
   @reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
   * * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
   ```

   - **Explicación:**
     - **`@reboot`:** *Ejecuta el script cuando el sistema se reinicia.*
     - **`* * * * *`:** *Ejecuta el script cada minuto.*
     - **`&> /dev/null`:** *Redirige la salida y errores a `/dev/null` para evitar mostrar mensajes.*
     - **Cada asterisco representa un campo de tiempo:**
        - *Minuto `(*)`: Cualquier minuto (0-59).*
        - *Hora `(*)`: Cualquier hora (0-23).*
        - *Día del mes `(*)`: Cualquier día (1-31).*
        - *Mes `(*)`: Cualquier mes (1-12).*
        - *Día de la semana `(*)`: Cualquier día (0-6, donde 0 es domingo).*
        - *La expresión `* * * * *` significa que el script se ejecuta cada minuto, ya que no hay restricciones en ninguno de los campos de tiempo.*

3. **Examinar el script `/usr/bin/cronjob_bandit22.sh`:**  
   *Este script es el que realiza acciones relevantes para obtener la contraseña.*  

   ```bash
   bandit21@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit22.sh
   #!/bin/bash
   chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
   cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
   ```

   - **Acciones del script:**
     - *Cambia los permisos del archivo en `/tmp` a modo de lectura para todos (`644`).*
     - *Copia la contraseña del nivel 22 desde `/etc/bandit_pass/bandit22` al archivo temporal en `/tmp`.*

4. **Leer el archivo temporal generado:**  

   ```bash
   bandit21@bandit:/etc/cron.d$ cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
   tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q
   ```

---

### **Conclusión:**  

- *La contraseña para el nivel 22 es:*

   ```bash
   tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q
   ```  

- *El script `cronjob_bandit22.sh` es ejecutado automáticamente por `cron` y genera este archivo con la contraseña en `/tmp`.*  

---

### **Comandos útiles para este nivel:**

- **`ls -lA`:** *Lista archivos, incluyendo ocultos.*
- **`cat`:** *Muestra el contenido de archivos.*
- **`chmod`:** *Cambia permisos de archivos.*
