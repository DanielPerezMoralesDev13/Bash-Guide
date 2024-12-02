<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 15 → Nivel 16***

- **Meta de nivel**

- *La contraseña del siguiente nivel se puede recuperar enviando la contraseña del nivel actual al puerto 30001 en localhost usando encriptación SSL/TLS.*

- *Nota útil: ¿Recibes «TERMINADO», «RENEGOCIANDO» o «ACTUALIZACIÓN DE LA CLAVE»? Lee la sección «COMANDOS CONECTADOS» en la página de manual.*
- *Comandos que puede necesitar para resolver este nivel*

- *ssh, telnet, nc, ncat, socat, openssl, s_client, nmap, netstat, ss*
- *Material de lectura útil*
  - *Secure Socket Layer/Transport Layer Security en Wikipedia*
  - *OpenSSL Cookbook - Pruebas con OpenSSL*

# ***OpenSSL y Secure Socket Layer (SSL) / Transport Layer Security (TLS)***

## ***OpenSSL***

### ***Descripción:***

- ***OpenSSL** es una **biblioteca de software** de código abierto que proporciona herramientas y librerías para implementar protocolos criptográficos. Es muy utilizado para trabajar con **SSL/TLS**, que son los protocolos responsables de la **seguridad en las comunicaciones por internet**.*

**OpenSSL se utiliza principalmente para:**

- **Generar claves criptográficas**.
- **Crear certificados SSL/TLS**.
- **Encriptar y desencriptar datos**.
- **Firmar y verificar mensajes**.
- **Establecer conexiones seguras** a través de redes no seguras, como Internet.

### **Características principales:**

- **Implementación de SSL/TLS:** *OpenSSL es la implementación más popular de estos protocolos, que permiten la seguridad en la transmisión de datos a través de la red.*
- **Soporte de múltiples algoritmos criptográficos:** *Soporta algoritmos como AES, RSA, SHA, y muchos otros para asegurar la confidencialidad y la integridad de los datos.*
- **Herramientas de línea de comandos:** *OpenSSL proporciona una serie de herramientas para realizar tareas criptográficas como la creación de claves, certificados, y la prueba de conexiones seguras (por ejemplo, `openssl s_client`).*

## **Secure Socket Layer (SSL) / Transport Layer Security (TLS)**

### **Descripción:**

- ***SSL** y **TLS** son protocolos criptográficos que aseguran las **comunicaciones en una red**. El propósito de estos protocolos es garantizar que los datos transmitidos entre dos partes sean confidenciales e íntegros.*

- **SSL** *(Secure Socket Layer) fue el protocolo original desarrollado por **Netscape** en los años 90 para asegurar las comunicaciones en la web.*
- **TLS** *(Transport Layer Security) es la versión **más moderna** y **segura** del SSL, que fue desarrollado por el **IETF** (Internet Engineering Task Force) como una mejora de SSL. Aunque TLS es el estándar actual, muchas veces la gente sigue refiriéndose a ambos como SSL debido a su uso común en la web.*

### **Objetivos principales de SSL/TLS:**

1. **Confidencialidad:** *Asegura que los datos transmitidos no puedan ser leídos por un tercero no autorizado mediante cifrado.*
2. **Integridad de los datos:** *Garantiza que los datos no hayan sido alterados durante la transmisión.*
3. **Autenticación:** *Verifica la identidad de las partes involucradas en la comunicación, generalmente mediante el uso de certificados digitales.*
4. **No repudio:** *Impide que una parte niegue haber realizado una acción de comunicación, como el envío de un mensaje.*

### **Funcionamiento básico:**

1. **Handshake (Intercambio de claves):**
   *El cliente y el servidor inician una conexión TLS/SSL, intercambiando claves públicas, acordando un método de cifrado y verificando las identidades de las partes mediante certificados.*

2. **Cifrado de datos:**
   *Una vez que el **handshake** es exitoso, se establece un canal cifrado en el cual los datos son transmitidos de forma segura.*

### **Componentes clave de SSL/TLS:**

- **Certificados digitales:** *Los certificados son emitidos por **Autoridades de Certificación (CA)** y contienen la clave pública del servidor, asegurando que el servidor con el que te estás comunicando es quien dice ser.*
- **Claves simétricas y asimétricas:**
  - **Asimétrica:** *Utiliza claves públicas y privadas durante el handshake.*
  - **Simétrica:** *Después del handshake, se utiliza una clave simétrica para cifrar la comunicación, lo que mejora la eficiencia.*

### **Ejemplo de uso de SSL/TLS**

- *Cuando accedes a un sitio web utilizando **HTTPS**, el protocolo TLS/SSL asegura la comunicación entre tu navegador y el servidor web. Esto se puede observar en la URL con el prefijo `https://`, en lugar de `http://`.*

---

### **Diferencias clave entre SSL y TLS**

- **SSL** *fue reemplazado por **TLS** debido a vulnerabilidades de seguridad que se descubrieron en versiones antiguas de SSL.*
- **TLS** *es más seguro, más eficiente y soporta métodos de cifrado más modernos y robustos.*
- *Aunque TLS es la versión más reciente, muchas veces se le sigue llamando **SSL** por conveniencia, pero es importante recordar que SSL está obsoleto y no debe usarse.*

---

### **Resumen:**

- **OpenSSL** *es una herramienta y librería que implementa algoritmos criptográficos y protocolos de seguridad, como **SSL** y **TLS**.*
- **SSL/TLS** *son protocolos criptográficos que aseguran la comunicación en redes, garantizando la confidencialidad, integridad, autenticación y no repudio de los datos transmitidos.*

- *La razón por la que el primer intento no funcionó con `nc` o `telnet` es porque la comunicación en el puerto **30001** requiere una conexión **segura**, específicamente **SSL/TLS**. Estas herramientas, como `nc` o `telnet`, no proporcionan cifrado y no pueden manejar correctamente el protocolo de seguridad SSL/TLS, que es necesario para la comunicación en este nivel.*

### ***Explicación***

- **`nc`** y **`telnet`** *son herramientas de red que funcionan para conexiones simples, sin cifrado. Estas herramientas son útiles para probar conexiones de red básicas, pero no están diseñadas para trabajar con **SSL/TLS**, que es el protocolo de seguridad necesario en este caso.*
  
- **`openssl s_client`** *es la herramienta adecuada para este tipo de conexión, ya que está diseñada específicamente para interactuar con servidores que utilizan **SSL/TLS**. Al usar `openssl s_client`, estás iniciando una conexión cifrada correctamente con el servidor en el puerto **30001**, permitiendo que la contraseña se transmita de manera segura.*

### ***Comando correcto***

```bash
openssl s_client -connect 127.0.0.1:30001
```

```bash
openssl s_client 127.0.0.1:30001
CONNECTED(00000003)
Can't use SSL_get_servername
depth=0 CN = SnakeOil
verify error:num=18:self-signed certificate
verify return:1
depth=0 CN = SnakeOil
verify return:1
---
Certificate chain
 0 s:CN = SnakeOil
   i:CN = SnakeOil
   a:PKEY: rsaEncryption, 4096 (bit); sigalg: RSA-SHA256
   v:NotBefore: Jun 10 03:59:50 2024 GMT; NotAfter: Jun  8 03:59:50 2034 GMT
---
Server certificate
-----BEGIN CERTIFICATE-----
MIIFBzCCAu+gAwIBAgIUBLz7DBxA0IfojaL/WaJzE6Sbz7cwDQYJKoZIhvcNAQEL
BQAwEzERMA8GA1UEAwwIU25ha2VPaWwwHhcNMjQwNjEwMDM1OTUwWhcNMzQwNjA4
MDM1OTUwWjATMREwDwYDVQQDDAhTbmFrZU9pbDCCAiIwDQYJKoZIhvcNAQEBBQAD
ggIPADCCAgoCggIBANI+P5QXm9Bj21FIPsQqbqZRb5XmSZZJYaam7EIJ16Fxedf+
jXAv4d/FVqiEM4BuSNsNMeBMx2Gq0lAfN33h+RMTjRoMb8yBsZsC063MLfXCk4p+
09gtGP7BS6Iy5XdmfY/fPHvA3JDEScdlDDmd6Lsbdwhv93Q8M6POVO9sv4HuS4t/
jEjr+NhE+Bjr/wDbyg7GL71BP1WPZpQnRE4OzoSrt5+bZVLvODWUFwinB0fLaGRk
GmI0r5EUOUd7HpYyoIQbiNlePGfPpHRKnmdXTTEZEoxeWWAaM1VhPGqfrB/Pnca+
vAJX7iBOb3kHinmfVOScsG/YAUR94wSELeY+UlEWJaELVUntrJ5HeRDiTChiVQ++
wnnjNbepaW6shopybUF3XXfhIb4NvwLWpvoKFXVtcVjlOujF0snVvpE+MRT0wacy
tHtjZs7Ao7GYxDz6H8AdBLKJW67uQon37a4MI260ADFMS+2vEAbNSFP+f6ii5mrB
18cY64ZaF6oU8bjGK7BArDx56bRc3WFyuBIGWAFHEuB948BcshXY7baf5jjzPmgz
mq1zdRthQB31MOM2ii6vuTkheAvKfFf+llH4M9SnES4NSF2hj9NnHga9V08wfhYc
x0W6qu+S8HUdVF+V23yTvUNgz4Q+UoGs4sHSDEsIBFqNvInnpUmtNgcR2L5PAgMB
AAGjUzBRMB0GA1UdDgQWBBTPo8kfze4P9EgxNuyk7+xDGFtAYzAfBgNVHSMEGDAW
gBTPo8kfze4P9EgxNuyk7+xDGFtAYzAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3
DQEBCwUAA4ICAQAKHomtmcGqyiLnhziLe97Mq2+Sul5QgYVwfx/KYOXxv2T8ZmcR
Ae9XFhZT4jsAOUDK1OXx9aZgDGJHJLNEVTe9zWv1ONFfNxEBxQgP7hhmDBWdtj6d
taqEW/Jp06X+08BtnYK9NZsvDg2YRcvOHConeMjwvEL7tQK0m+GVyQfLYg6jnrhx
egH+abucTKxabFcWSE+Vk0uJYMqcbXvB4WNKz9vj4V5Hn7/DN4xIjFko+nREw6Oa
/AUFjNnO/FPjap+d68H1LdzMH3PSs+yjGid+6Zx9FCnt9qZydW13Miqg3nDnODXw
+Z682mQFjVlGPCA5ZOQbyMKY4tNazG2n8qy2famQT3+jF8Lb6a4NGbnpeWnLMkIu
jWLWIkA9MlbdNXuajiPNVyYIK9gdoBzbfaKwoOfSsLxEqlf8rio1GGcEV5Hlz5S2
txwI0xdW9MWeGWoiLbZSbRJH4TIBFFtoBG0LoEJi0C+UPwS8CDngJB4TyrZqEld3
rH87W+Et1t/Nepoc/Eoaux9PFp5VPXP+qwQGmhir/hv7OsgBhrkYuhkjxZ8+1uk7
tUWC/XM0mpLoxsq6vVl3AJaJe1ivdA9xLytsuG4iv02Juc593HXYR8yOpow0Eq2T
U5EyeuFg5RXYwAPi7ykw1PW7zAPL4MlonEVz+QXOSx6eyhimp1VZC11SCg==
-----END CERTIFICATE-----
subject=CN = SnakeOil
issuer=CN = SnakeOil
---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: RSA-PSS
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 2103 bytes and written 373 bytes
Verification error: self-signed certificate
---
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Server public key is 4096 bit
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 18 (self-signed certificate)
---
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: 25F346D1576D87017FD988E2C6AA97E007D13CAACFA21E3E5434522541784DF7
    Session-ID-ctx:
    Resumption PSK: F2EE4CC4C0B963F60E4F92326F2F6E8D18DC2BCEC67E107B474D2B9455C774BE1DF99E1DE53AD9D4857EF4067AF741CE
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 300 (seconds)
    TLS session ticket:
    0000 - bf 3f 8a a0 79 ae 50 18-07 9d e0 da 81 56 b3 fb   .?..y.P......V..
    0010 - f9 a4 15 74 7e 9b 23 89-84 4f c3 31 85 85 14 29   ...t~.#..O.1...)
    0020 - f9 8f 38 22 93 49 93 1b-23 fd dd 69 59 f5 25 bb   ..8".I..#..iY.%.
    0030 - ef af dc 8a e2 ae 2f 9c-6c 4b 6f b2 7d 9d f5 22   ....../.lKo.}.."
    0040 - 2e 23 f4 c0 60 7f 14 0e-39 42 19 c5 74 9f 8e 7a   .#..`...9B..t..z
    0050 - ae a2 bd 30 63 46 17 03-e4 36 78 7b 02 df 43 81   ...0cF...6x{..C.
    0060 - 56 99 42 91 82 3b b8 b0-08 e6 3b d1 0e ae 23 d9   V.B..;....;...#.
    0070 - dc 30 8a 37 41 61 b4 86-14 a2 44 86 56 be 31 e7   .0.7Aa....D.V.1.
    0080 - a8 e1 86 62 8e 9e bf 06-54 b4 10 8a 54 68 e9 d5   ...b....T...Th..
    0090 - 5c ba 7e d4 b7 4a c0 3e-18 fc 5f 67 67 f5 93 e5   \.~..J.>.._gg...
    00a0 - 50 90 d5 09 20 58 f3 3d-b0 d5 a7 73 77 46 fd 4d   P... X.=...swF.M
    00b0 - df 71 55 95 be ff c7 a1-00 c7 2e 12 79 b6 b5 27   .qU.........y..'
    00c0 - 36 09 8f 1b 6e d1 36 dc-a2 3a 1b 89 26 11 68 1a   6...n.6..:..&.h.
    00d0 - b5 95 20 c1 6f 2f f5 b6-07 5b 73 12 52 84 a0 bf   .. .o/...[s.R...

    Start Time: 1732664576
    Timeout   : 7200 (sec)
    Verify return code: 18 (self-signed certificate)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: 14BB3777FA452D3967D5696D7E2C41D3F40A90CA9F04008651DB086B55BBAA2B
    Session-ID-ctx:
    Resumption PSK: F8417B1B30530665C4328F4B0193091386AC4BC198E44EA04DE480F71A61C4BB37F92C59314ECE13C7C688425F1BBD9D
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 300 (seconds)
    TLS session ticket:
    0000 - bf 3f 8a a0 79 ae 50 18-07 9d e0 da 81 56 b3 fb   .?..y.P......V..
    0010 - dd 92 ec 06 f4 ad 95 3c-07 d1 90 33 50 40 63 45   .......<...3P@cE
    0020 - 58 17 81 a8 83 fe 7b 6d-e4 f0 dd 9a 52 9c 1c 8f   X.....{m....R...
    0030 - 84 e3 6c d0 85 b1 95 92-dc b7 be f6 cf 23 23 3d   ..l..........##=
    0040 - 16 8d 54 7f 8e 78 63 5c-12 a7 8d 77 03 e5 e4 48   ..T..xc\...w...H
    0050 - 2d 5c 58 a1 04 8e 16 66-81 63 dd 5f 40 a6 b8 f2   -\X....f.c._@...
    0060 - 20 1c c2 3d d4 65 a8 f7-e5 33 21 d9 98 b0 67 8d    ..=.e...3!...g.
    0070 - 85 06 7f dd 32 ee 14 fe-d6 6e 12 1b c5 47 b8 1a   ....2....n...G..
    0080 - c1 8f c7 25 d3 41 20 d5-99 d1 d3 3d 92 92 d2 4d   ...%.A ....=...M
    0090 - 67 38 39 1d ff 98 cf d8-53 a4 6d a4 f8 23 a7 22   g89.....S.m..#."
    00a0 - 54 24 bc c0 bb ec a9 19-87 76 4c 95 fb 21 e0 7e   T$.......vL..!.~
    00b0 - 70 7f f8 de c3 c5 61 29-0d 49 43 64 07 2a 8c 99   p.....a).ICd.*..
    00c0 - da b4 4f b5 ee e1 e1 53-76 86 ca ac d9 91 c7 7a   ..O....Sv......z
    00d0 - 43 e0 2c b9 bf c5 3e 0e-43 67 57 43 e1 4e f8 91   C.,...>.CgWC.N..

    Start Time: 1732664576
    Timeout   : 7200 (sec)
    Verify return code: 18 (self-signed certificate)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
Correct!
kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx

closed
```

- *Este comando establece una conexión SSL/TLS al servidor en **localhost** en el puerto **30001**, lo que permite que la contraseña se envíe y reciba de forma segura.*

### **1. Comando con `echo` y `openssl s_client`:**

```bash
echo "8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo" | openssl s_client -connect localhost:30001 -ign_eof
```

#### **Desglosando cada parte:**

- **`echo "8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo"`:**
  - *El comando `echo` simplemente imprime la cadena `"8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo"` en la salida estándar (normalmente, la pantalla).*

- **`|` (pipe):**
  - *El operador `|` toma la salida del comando anterior (en este caso, la cadena generada por `echo`) y la pasa como entrada al siguiente comando (`openssl` en este caso).*
  
- **`openssl s_client`:**
  - *`openssl s_client` es una herramienta para probar conexiones SSL/TLS. Crea una conexión segura (SSL/TLS) con un servidor y puede ser útil para depurar comunicaciones seguras.*
  - *Esta herramienta establece una conexión a través de SSL/TLS y permite ver información detallada sobre el handshake SSL, el certificado del servidor, los ciphers utilizados, etc.*

- **`-connect localhost:30001`:**
  - *Esta opción especifica la dirección del servidor al que te vas a conectar, en este caso, `localhost` en el puerto `30001`.*
  - *Esto significa que `openssl` se conectará a `localhost` (la máquina local) en el puerto `30001`.*

- **`-ign_eof`:**
  - *Esta opción le dice a `openssl s_client` que ignore el "End of File" (EOF) del servidor y no cierre la conexión inmediatamente después de recibirlo.*
  - *Sin esta opción, la conexión se cerraría al recibir una señal EOF. Con `-ign_eof`, el comando sigue abierto para continuar interactuando con el servidor.*

### ***Resumen del primer comando***

- *Este comando envía la contraseña `"8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo"` al servidor SSL/TLS en `localhost` puerto `30001`, usando `openssl` para establecer la conexión. La opción `-ign_eof` asegura que la conexión no se cierre automáticamente después de recibir la señal EOF, lo que podría ser útil si el servidor necesita más interacciones.*

---

### **2. Comando con `openssl s_client` y redirección desde un archivo:**

```bash
openssl s_client -connect localhost:30001 -ign_eof </etc/bandit_pass/bandit15
```

#### ***Desglosando cada parte***

- **`openssl s_client -connect localhost:30001 -ign_eof`:**
  - *Esencialmente es lo mismo que en el comando anterior, pero con las siguientes diferencias:*
    - **`-connect localhost:30001`:** *Se conecta a `localhost` en el puerto `30001` como en el primer comando.*
    - *`-ign_eof`:** *Ignora el EOF para mantener la conexión abierta.*

- **`</etc/bandit_pass/bandit15`:**
  - *El operador `<` redirige la entrada desde un archivo. En este caso, el archivo `/etc/bandit_pass/bandit15` contiene la contraseña del nivel 15 en el ejercicio de Bandit.*
  - *Al redirigir la entrada desde el archivo, la contraseña almacenada en el archivo se envía automáticamente a `openssl s_client` como si fuera entrada desde el teclado.*
  - *Este es un método más automatizado para enviar la contraseña sin necesidad de escribirla manualmente.*

### ***Resumen del segundo comando***

- *Este comando usa `openssl s_client` para establecer una conexión SSL/TLS con el servidor en `localhost` en el puerto `30001`. La diferencia con el primer comando es que en lugar de enviar la contraseña a través de `echo`, la lee directamente desde el archivo `/etc/bandit_pass/bandit15` mediante redirección de entrada.*

---

### ***Resumen general de la diferencia entre los dos comandos***

- **Primer comando (`echo ... | openssl s_client`):** *Envía la contraseña directamente como texto desde el comando `echo` a través de un pipe a `openssl s_client`.*
- **Segundo comando (`openssl s_client ... </etc/bandit_pass/bandit15`):** *Redirige la entrada desde el archivo que contiene la contraseña, enviándola automáticamente sin necesidad de escribirla manualmente.*

- *Ambos métodos sirven para enviar la contraseña al servidor a través de una conexión SSL/TLS, pero el segundo comando es más adecuado cuando la contraseña está almacenada en un archivo, lo que hace el proceso más automatizado.*
