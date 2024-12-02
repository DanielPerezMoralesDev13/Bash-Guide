<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 22 → Nivel 23***

- *Meta de nivel*

- *Un programa se está ejecutando automáticamente a intervalos regulares desde cron, el programador de trabajos basado en tiempo. Busca en /etc/cron.d/ la configuración y mira qué comando se está ejecutando.*

- *NOTA: Mirar scripts de shell escritos por otras personas es una habilidad muy útil. El script para este nivel está hecho intencionalmente fácil de leer. Si tienes problemas para entender lo que hace, intenta ejecutarlo para ver la información de depuración que imprime.*
- *Comandos que puedes necesitar para resolver este nivel*

- *cron, crontab, crontab(5) (usa «man 5 crontab» para acceder a esto)*

## ***Diferencias entre Base32, Base64 y MD5***

## **1. Base32 y Base64**

### **Definición y propósito:**

- ***Base32** y **Base64** son esquemas de codificación que convierten datos binarios en representaciones de texto legible. Se utilizan para transmitir datos en sistemas que solo permiten caracteres imprimibles, como correos electrónicos o URLs.*

### **Características:**

| *Característica*         | **Base32**                                                  | **Base64**                                 |
| ------------------------ | ----------------------------------------------------------- | ------------------------------------------ |
| **Alfabeto**             | *32 caracteres: A-Z, 2-7*                                   | *64 caracteres: A-Z, a-z, 0-9, +, /*       |
| **Padding**              | *Sí, con `=`*                                               | *Sí, con `=`*                              |
| **Eficiencia**           | *Menos eficiente en espacio*                                | *Más eficiente en espacio*                 |
| **Tolerancia a errores** | *Más robusto en sistemas sensibles a mayúsculas/minúsculas* | *Menos tolerante en esos casos*            |
| **Longitud**             | *Salida más larga (aprox. 20% más)*                         | *Salida más corta*                         |
| **Uso típico**           | *URLs, claves secretas*                                     | *Correos electrónicos, imágenes embebidas* |

### **Ejemplos de uso:**

- **Base32:** *Utilizado en sistemas como códigos QR, claves de autenticación (OTP).*
  
    ```bash
    echo "Daniel" | base32
    IRQW42LFNQFA====
    ```

- **Base64:** *Común para codificar datos en JSON, XML o enviar archivos adjuntos en correos.*

    ```bash
    echo "Daniel" | base64
    RGFuaWVsCg==
    ```

---

## **2. MD5**

- **MD5** *(Message Digest 5) es una **función hash criptográfica** que genera un resumen único (hash) de 128 bits para un conjunto de datos. Es utilizado para verificar la integridad de archivos, pero ya **no es seguro** para aplicaciones criptográficas debido a vulnerabilidades.*

| *Característica*      | **MD5**                                            |
| --------------------- | -------------------------------------------------- |
| **Tipo**              | *Función hash*                                     |
| **Longitud del hash** | *32 caracteres hexadecimales*                      |
| **Unidireccional**    | *Sí (no puede revertirse)*                         |
| **Colisiones**        | *Posibles (no es seguro)*                          |
| **Uso típico**        | *Verificación de archivos, sumas de comprobación.* |

### **Ejemplo de uso:**

```bash
echo "Daniel" | md5sum
8d200e368dd9477841cdf8905fb4de32  -
```

---

## **Comparación y utilidad:**

| Criterio            | **Base32**           | **Base64**           | **MD5**                |
| ------------------- | -------------------- | -------------------- | ---------------------- |
| **Propósito**       | *Codificación*       | *Codificación*       | *Verificación/Hashing* |
| **Reversible**      | *Sí*                 | *Sí*                 | *No*                   |
| **Seguridad**       | *No (solo codifica)* | *No (solo codifica)* | *Débil para seguridad* |
| **Uso recomendado** | *URLs, OTP*          | *Archivos adjuntos*  | *Verificar integridad* |

---

### **¿Cuál es mejor?**

- **Para transmitir datos:**
  - *Base64* *es mejor si el tamaño es crítico.*
  - *Base32* *es útil si se requiere insensibilidad a mayúsculas/minúsculas.*
  
- **Para integridad de archivos:**
  - *MD5* *es útil para verificar cambios en archivos, pero para seguridad se prefieren funciones más robustas como **SHA-256**.*

---

### ***Resumen:***

- **Base32/Base64:** *Codifican datos binarios en texto legible, usados para transmisión segura.*
- **MD5:** *Genera un hash único para verificar la integridad de datos, aunque ya no es seguro para criptografía.*

## **Análisis del problema:**

1. **Exploración del directorio `/etc/cron.d`:**
   *El cron utiliza archivos en este directorio para ejecutar tareas programadas. El archivo `cronjob_bandit23` contiene la tarea asociada al usuario `bandit23`.*

   ```bash
   bandit22@bandit:/etc/cron.d$ cat cronjob_bandit23
   @reboot bandit23 /usr/bin/cronjob_bandit23.sh &> /dev/null
   * * * * * bandit23 /usr/bin/cronjob_bandit23.sh &> /dev/null
   ```

   - **Significado de la línea:**
     - *`@reboot`: Ejecuta el script al iniciar el sistema.*
     - *`* * * * *`: Ejecuta el script cada minuto.*
     - ***Redirección `&> /dev/null`:** Descarta cualquier salida (stdout o stderr).*

2. **Contenido del script `/usr/bin/cronjob_bandit23.sh`:**

   ```bash
   #!/bin/bash
   myname=$(whoami)
   mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)
   echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"
   cat /etc/bandit_pass/$myname > /tmp/$mytarget
   ```

   - **Explicación:**
     - *`myname=$(whoami)`: Obtiene el nombre del usuario actual (`bandit23`).*
     - *`mytarget=$(...)`: Genera un hash MD5 basado en la cadena `I am user bandit23`.*
     - ***Acción del script:** Copia la contraseña del archivo `/etc/bandit_pass/bandit23` a un archivo en `/tmp/` cuyo nombre es el hash generado.*

---

## **Pasos para resolver el nivel:**

1. **Generar el hash esperado:**

   ```bash
   echo "I am user $(whoami)" | md5sum | cut -d ' ' -f 1
   8169b67bd894ddbb4412f91573b38db3
   ```

   ```bash
   echo "I am user bandit23" | md5sum | cut -d ' ' -f 1
   8ca319486bfbbc3663ea0fbe81326349
   ```

   - *Este comando devuelve el hash que se usa como nombre del archivo en `/tmp/`.*

2. **Verificar el archivo en `/tmp/`:**

   ```bash
   cat /tmp/$(!!)
   cat /tmp/$(echo "I am user bandit23" | md5sum | cut -d ' ' -f 1)
   0Zf11ioIjMVN551jX3CmStKLYqjk54Ga
   ```

   ```bash
   bandit22@bandit:/etc/cron.d$ cat /tmp/8ca319486bfbbc3663ea0fbe81326349
   0Zf11ioIjMVN551jX3CmStKLYqjk54Ga
   ```

   - *Aquí se encuentra la contraseña para el nivel 23.*

---

## **Explicación clave:**

- *El script automatizado usa el comando `md5sum` para generar un hash y almacena la contraseña en un archivo temporal.*
- *Analizando y reproduciendo el proceso, pudimos predecir el nombre del archivo y extraer la contraseña.*

---

## **Resumen:**

- **Concepto principal:** *Entender cómo funcionan los scripts de cron y analizar scripts de shell para encontrar vulnerabilidades o información útil.*
- **Comandos importantes:**
  - *`whoami`: Obtener el nombre de usuario actual.*
  - *`md5sum`: Generar un hash MD5.*
  - *`cat`: Leer el contenido de un archivo.*
