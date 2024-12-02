<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandit Nivel 0***

- **Objetivo del nivel**
- *El objetivo de este nivel es que te conectes al juego usando SSH. El host al que necesitas conectarte es bandit.labs.overthewire.org, en el puerto 2220. El nombre de usuario es bandit0 y la contraseña es bandit0. Una vez conectado, ve a la página del Nivel 1 para averiguar cómo superar el Nivel 1.*

- **Comandos que puedes necesitar para resolver este nivel**
- *`ssh`*

- **Material de lectura útil**

- **[Secure Shell (SSH) en Wikipedia](https://en.wikipedia.org/wiki/Secure_Shell "https://en.wikipedia.org/wiki/Secure_Shell")**
- **[Cómo usar SSH en wikiHow](https://www.wikihow.com/Use-SSH "https://www.wikihow.com/Use-SSH")**

## ***Comandos***

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

```bash
cat readme
```

```bash
cat readme
Congratulations on your first steps into the bandit game!!
Please make sure you have read the rules at https://overthewire.org/rules/
If you are following a course, workshop, walkthrough or other educational activity,
please inform the instructor about the rules as well and encourage them to
contribute to the OverTheWire community so we can keep these games free!

The password you are looking for is: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
```

```bash
hostname -I
```

- *Muestra la(s) dirección(es) IP asignada(s) a las interfaces de red del sistema local. En este caso, la salida es:*

```bash
10.0.1.252
```

### ***Detalles***

- **`hostname -I`**:
  - *Muestra **todas las direcciones IP** asignadas al host.*
  - *A diferencia de `hostname`, que muestra solo el nombre del host, el parámetro `-I` (i mayúscula) indica que se desean las direcciones IP.*
  - *No muestra la dirección de loopback (por ejemplo, `127.0.0.1`) ni información adicional como nombres de interfaces o máscaras de red.*

### Significado de la salida

- **`10.0.1.252`**:
  - *Es una dirección IP local asignada a tu dispositivo. Forma parte del rango **10.0.0.0/8**, que es una red privada reservada.*
  - *Puede ser asignada estáticamente o por un servidor DHCP en tu red.*

### ***Ejemplo de uso***

- **Esto es útil si necesitas saber la dirección IP de tu máquina en la red local, por ejemplo, para:**

1. *Configurar conexiones SSH.*
2. *Verificar la conectividad de red.*
3. *Identificar la IP que puedes usar para servicios locales, como servidores web.*

- **Salida**

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
The authenticity of host '[bandit.labs.overthewire.org]:2220 ([16.16.163.126]:2220)' can't be established.
ED25519 key fingerprint is SHA256:C2ihUBV7ihnV1wUXRb4RrEcLfXC5CXlhmAAM/urerLY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[bandit.labs.overthewire.org]:2220' (ED25519) to the list of known hosts.
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

bandit0@bandit.labs.overthewire.org's password:

      ,----..            ,----,          .---.
     /   /   \         ,/   .`|         /. ./|
    /   .     :      ,`   .'  :     .--'.  ' ;
   .   /   ;.  \   ;    ;     /    /__./ \ : |
  .   ;   /  ` ; .'___,/    ,' .--'.  '   \' .
  ;   |  ; \ ; | |    :     | /___/ \ |    ' '
  |   :  | ; | ' ;    |.';  ; ;   \  \;      :
  .   |  ' ' ' : `----'  |  |  \   ;  `      |
  '   ;  \; /  |     '   :  ;   .   \    .\  ;
   \   \  ',  /      |   |  '    \   \   ' \ |
    ;   :    /       '   :  |     :   '  |--"
     \   \ .'        ;   |.'       \   \ ;
  www. `---` ver     '---' he       '---" ire.org


Welcome to OverTheWire!

If you find any problems, please report them to the #wargames channel on
discord or IRC.

--[ Playing the games ]--

  This machine might hold several wargames.
  If you are playing "somegame", then:

    * USERNAMES are somegame0, somegame1, ...
    * Most LEVELS are stored in /somegame/.
    * PASSWORDS for each level are stored in /etc/somegame_pass/.

  Write-access to homedirectories is disabled. It is advised to create a
  working directory with a hard-to-guess name in /tmp/.  You can use the
  command "mktemp -d" in order to generate a random and hard to guess
  directory in /tmp/.  Read-access to both /tmp/ is disabled and to /proc
  restricted so that users cannot snoop on eachother. Files and directories
  with easily guessable or short names will be periodically deleted! The /tmp
  directory is regularly wiped.
  Please play nice:

    * don't leave orphan processes running
    * don't leave exploit-files laying around
    * don't annoy other players
    * don't post passwords or spoilers
    * again, DONT POST SPOILERS!
      This includes writeups of your solution on your blog or website!

--[ Tips ]--

  This machine has a 64bit processor and many security-features enabled
  by default, although ASLR has been switched off.  The following
  compiler flags might be interesting:

    -m32                    compile for 32bit
    -fno-stack-protector    disable ProPolice
    -Wl,-z,norelro          disable relro

  In addition, the execstack tool can be used to flag the stack as
  executable on ELF binaries.

  Finally, network-access is limited for most levels by a local
  firewall.

--[ Tools ]--

 For your convenience we have installed a few useful tools which you can find
 in the following locations:

    * gef (https://github.com/hugsy/gef) in /opt/gef/
    * pwndbg (https://github.com/pwndbg/pwndbg) in /opt/pwndbg/
    * gdbinit (https://github.com/gdbinit/Gdbinit) in /opt/gdbinit/
    * pwntools (https://github.com/Gallopsled/pwntools)
    * radare2 (http://www.radare.org/)

--[ More information ]--

  For more information regarding individual wargames, visit
  http://www.overthewire.org/wargames/

  For support, questions or comments, contact us on discord or IRC.

  Enjoy your stay!

bandit0@bandit:~$
```

- *Ese comando es utilizado para conectarse a un servidor remoto mediante **SSH** (Secure Shell), específicamente al servidor del juego de hacking educativo **Bandit**, que forma parte de los retos de OverTheWire. Cada elemento del comando tiene un propósito específico. Vamos a desglosarlo:*

### ***Explicación de cada parte***

1. **`ssh`**:  
   *Es el comando para iniciar una sesión SSH. SSH es un protocolo que permite acceder de manera segura a otro sistema de forma remota a través de una red.*

2. **`bandit0@`**:  
   *Especifica el **usuario** con el que deseas iniciar sesión en el servidor remoto. En este caso, el usuario es `bandit0`.*

3. **`bandit.labs.overthewire.org`**:  
   *Es el **nombre de dominio** o **dirección** del servidor al que deseas conectarte. Aquí se conecta al servidor del reto de Bandit.*

4. **`-p 2220`**:  
   *Indica el **puerto** a utilizar para la conexión SSH. Por defecto, SSH usa el puerto 22, pero en este caso el servidor utiliza el puerto 2220.*

---

### ***¿Qué sucede al ejecutar el comando?***

1. *Se inicia una conexión SSH al servidor `bandit.labs.overthewire.org` usando el usuario `bandit0` y el puerto `2220`.*
2. *El servidor solicita la **contraseña** del usuario `bandit0`. En este caso, la contraseña es `bandit0`.*
3. *Si la contraseña es correcta, obtendrás acceso al servidor con los permisos del usuario `bandit0`.*

---

### ***Contexto específico del reto Bandit***

- *Bandit es un juego de hacking educativo que enseña conceptos básicos de Linux, seguridad y shell scripting.*
- *Cada nivel requiere que resuelvas un desafío para obtener la contraseña del siguiente nivel.*
- *En el **Nivel 0**, solo necesitas conectarte al servidor como `bandit0` usando la contraseña inicial (`bandit0`). Esto sirve como introducción.*
