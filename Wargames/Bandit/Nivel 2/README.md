<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandit Nivel 1***

- *La contraseña para el siguiente nivel se almacena en un archivo llamado readme ubicado en el directorio home. Usa esta contraseña para entrar en bandit1 usando SSH. Siempre que encuentres una contraseña para un nivel, usa SSH (en el puerto 2220) para entrar en ese nivel y continuar el juego.*

- **Comandos que puedes necesitar para resolver este nivel**

- *[`ls`](https://manpages.ubuntu.com/manpages/noble/man1/ls.1.html "https://manpages.ubuntu.com/manpages/noble/man1/ls.1.html"), [`cd`](https://manpages.ubuntu.com/manpages/noble/man1/cd.1posix.html "https://manpages.ubuntu.com/manpages/noble/man1/cd.1posix.html"), [`cat`](https://manpages.ubuntu.com/manpages/noble/man1/cat.1.html "https://manpages.ubuntu.com/manpages/noble/man1/cat.1.html"), [`file`](https://manpages.ubuntu.com/manpages/noble/man1/file.1.html "https://manpages.ubuntu.com/manpages/noble/man1/file.1.html"), [`du`](https://manpages.ubuntu.com/manpages/noble/man1/du.1.html "https://manpages.ubuntu.com/manpages/noble/man1/du.1.html"), [`find`](https://manpages.ubuntu.com/manpages/noble/man1/find.1.html "https://manpages.ubuntu.com/manpages/noble/man1/find.1.html")*

- *CONSEJO: ¡Crea un archivo para notas y contraseñas en tu máquina local!*

- *Las contraseñas de los niveles no se guardan automáticamente. Si no las guarda usted mismo, tendrá que empezar de nuevo desde bandit0.*

- *Las contraseñas también cambian ocasionalmente. Se recomienda tomar notas sobre cómo resolver cada desafío. A medida que los niveles se vuelven más desafiantes, las notas detalladas son útiles para volver a donde lo dejaste, como referencia para problemas posteriores, o para ayudar a otros después de haber completado el desafío.*

- **Bandido Nivel 1 → Nivel 2**

- **Meta de nivel**
- *La contraseña para el siguiente nivel se almacena en un archivo llamado - ubicado en el directorio home*

## ***Pasos para resolverlo***

1. **Conéctate al servidor en el Nivel 1**:
   - *Usa el comando que ya aprendiste, pero ahora inicia sesión como el usuario `bandit1` con la contraseña que obtuviste en el **Nivel 0**.*

   ```bash
   ssh bandit1@bandit.labs.overthewire.org -p 2220
   ```

   - *Ingresa la contraseña de `bandit1` cuando te lo pida.*

2. **Encuentra el archivo**:
   *Una vez dentro, lista los archivos en el directorio home (`/home/bandit1`):*

   ```bash
   ls
   ```

   *Esto mostrará algo como:*

   ```bash
   -
   ```

   *Aquí puedes ver que el archivo se llama `-`.*

3. **Leer un archivo llamado `-`**:
   *Un archivo con el nombre `-` puede causar problemas porque el guion (`-`) se interpreta como una opción en la mayoría de los comandos. Para evitar esto, necesitas usar una técnica especial.*

   *Utiliza `cat` para leer el archivo, indicando explícitamente su nombre con una ruta relativa (`./`) o absoluta:*

   ```bash
   cat ./-
   ```

   - *`./-`: El prefijo `./` le dice al sistema que el guion es un archivo en el directorio actual.*

   - *Esto debería mostrar el contenido del archivo, que es la contraseña para el siguiente nivel.*

4. **Avanza al Nivel 2**:
   **Usa la contraseña que obtuviste para conectarte al usuario `bandit2`:**

   ```bash
   ssh bandit2@bandit.labs.overthewire.org -p 2220
   ```

*[Recursos](https://stackoverflow.com/questions/42187323/how-to-open-a-dashed-filename-using-terminal "https://stackoverflow.com/questions/42187323/how-to-open-a-dashed-filename-using-terminal")*
*[Recursos](https://linux.die.net/abs-guide/special-chars.html "https://linux.die.net/abs-guide/special-chars.html")*
