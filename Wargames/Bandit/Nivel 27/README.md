<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me  -->

# ***Bandido Nivel 26 → Nivel 27***

- **Objetivo de nivel**

- *¡Buen trabajo consiguiendo un caparazón! ¡Ahora date prisa y consigue la contraseña de bandido27!*
- *Comandos que puedes necesitar para resolver este nivel*

- *ls*

## **Explicación paso a paso para resolver el nivel de Bandit26 a Bandit27**

---

### **Problema inicial: Restricción de la shell**  

- *Al intentar conectarte como **bandit26**, el sistema ejecuta un script (`/usr/bin/showtext`) que utiliza `more` para mostrar un archivo, bloqueando comandos interactivos. Esto se evidencia en el valor de la variable `$SHELL`:*

```bash
bandit26@bandit:~$ echo $SHELL
/usr/bin/showtext
```

- *Contenido del script **`showtext`**:*

```bash
#!/bin/sh
export TERM=linux
exec more ~/text.txt
exit 0
```

```bash
cat ~/text.txt
```

```bash
bandit26@bandit:~$ cat ~/text.txt
  _                     _ _ _   ___   __
 | |                   | (_) | |__ \ / /
 | |__   __ _ _ __   __| |_| |_   ) / /_
 | '_ \ / _` | '_ \ / _` | | __| / / '_ \
 | |_) | (_| | | | | (_| | | |_ / /| (_) |
 |_.__/ \__,_|_| |_|\__,_|_|\__|____\___/
```

---

### **Solución paso a paso:**

1. **Usar tmux para manejar la pantalla:**
   - *Al minimizar el panel con **tmux**, evitamos que `more` pagine el contenido, permitiendo ejecutar comandos manualmente.*

2. **Cambiar la shell dentro de `more`:**  
   *Una vez dentro de **`more`**:*

   - ***Presiona `v`** para entrar en el modo visual.*
   - *Escribe el siguiente comando para cambiar la shell predeterminada a **`bash`**:*

     ```bash
     :set shell=/bin/bash
     ```

   - Luego, ejecuta:

     ```bash
     :shell
     ```

3. **Por qué el cambio soluciona el problema:**  
   - *El comando `:shell` abre una nueva instancia de la shell especificada. Como ahora es **`bash`**, permite ejecutar comandos sin restricciones.*

---

### **Ejecución de comandos para escalar privilegios:**

#### **Verificación de permisos:**

```bash
bandit26@bandit:~$ ls -l
total 20
-rwsr-x--- 1 bandit27 bandit26 14880 Sep 19 07:08 bandit27-do
-rw-r----- 1 bandit26 bandit26   258 Sep 19 07:08 text.txt
```

- *El binario **`bandit27-do`** tiene el bit **SUID** activado, lo que permite ejecutarlo como **bandit27**.*

#### **Ejecutar comandos como bandit27:**

```bash
bandit26@bandit:~$ ./bandit27-do bash -p
bash-5.2$ whoami
bandit27
bash-5.2$ exit
```

#### **Obtener la contraseña del siguiente nivel:**

```bash
bandit26@bandit:~$ ./bandit27-do cat /etc/bandit_pass/bandit27
upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB
```

---

### **Resumen final:**

1. **El script `showtext` limita el acceso a comandos interactivos** *al usar `more`.*
2. **Cambiar la shell a `bash` y ejecutar `:shell`** *permite escapar de esta restricción.*
3. **Usar `bandit27-do`** *con el bit SUID permite ejecutar comandos como **bandit27** y acceder a la contraseña.*
