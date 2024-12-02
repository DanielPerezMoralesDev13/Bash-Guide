<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->
# ***En Bash, puedes declarar una variable de la siguiente manera:***

*En la consola o terminal:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

nombre="Daniel Perez"
echo $nombre
```

*En un fichero de script Bash:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

nombre="Daniel Perez"
echo $nombre
```

- *En el primer ejemplo, simplemente estás declarando una variable en la línea de comandos. En el segundo ejemplo, estás creando un script Bash. La primera línea `#!/usr/bin/env bash` es necesaria para indicar que el script debe ejecutarse utilizando Bash. Luego, declaras tu variable y la imprimes.*

- *En Bash, los espacios alrededor del operador `=` son significativos. Si pones un espacio antes o después del `=`, Bash interpretará la variable y el valor como dos comandos separados, lo que causará un error.*

*Por ejemplo, si intentas hacer esto:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

nombre = "Daniel Perez"
```

- *Bash interpretará `nombre` como un comando y `="Daniel Perez"` como un argumento para ese comando, lo que probablemente no es lo que quieres.*

- *Por lo tanto, siempre debes asegurarte de no tener espacios alrededor del `=` al asignar valores a las variables en Bash. Así es como debería verse:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

nombre="Daniel Perez"
```

*Para eliminar una variable en Bash, puedes usar el comando `unset`. Aquí te muestro cómo:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

unset nombre
echo $nombre
```

*Después de ejecutar el comando `unset`, la variable `nombre` ya no existirá, por lo que el comando `echo $nombre` no imprimirá nada.*

*Para sumar números en Bash, puedes hacerlo de la siguiente manera:*

*En la consola o terminal:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

num1=5
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

num2=10
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

suma=$((num1 + num2))
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo $suma
```

*En un fichero de script Bash:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

num1=5
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

num2=10
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

suma=$((num1 + num2))
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo $suma
```

> *En ambos casos, se declaran dos variables, `num1` y `num2`, y luego se suman utilizando la sintaxis `$((num1 + num2))`. El resultado se almacena en la variable `suma`, que luego se imprime con `echo`.*

*El comando `expr` en Linux es una abreviatura de la palabra inglesa "expression". Este comando se utiliza para evaluar expresiones y realizar operaciones como aritmética, comparaciones de cadenas y operaciones de bits.*

*En español, "expression" se traduce como "expresión". Por lo tanto, `expr` sería una abreviatura de "expresión" en inglés.*

*Aquí tienes algunos ejemplos de cómo usar el comando `expr` en Linux:*

- *Operaciones aritméticas:*

*En la consola o terminal:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# suma
expr 10 + 3
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Resta
expr 10 - 3
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Multiplicacion
expr 10 \* 5
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Division
expr 10 \/ 5
```

*En un fichero de script Bash:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Suma
echo $(expr 5 + 3)  # Imprime 8
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Resta
echo $(expr 10 - 3)  # Imprime 7
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Division
echo $(expr 10 \/ 2)  # Imprime 5
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Multiplicacion
echo $(expr 10 \* 3)  # Imprime 30
```

> *Recuerda que para la multiplicación y las operaciones de bits necesitas escapar los operadores con \ para evitar que sean interpretados por la shell.*

*En Linux y en otros sistemas de tipo Unix, múltiples barras inclinadas (`/`) seguidas se tratan como una sola. Esto es parte de la especificación POSIX para rutas de ficheros.*

*Por lo tanto, `~/Escritorio///////test` es equivalente a `~/Escritorio/test`. Ambos se refieren al mismo fichero o directorio.*

*Esto puede ser útil en situaciones donde estás construyendo rutas de ficheros de manera dinámica, y no tienes que preocuparte si ya hay una barra inclinada al final de una parte de la ruta antes de agregar la siguiente parte.*

*El comando `tr` en Unix y Linux se utiliza para traducir o eliminar caracteres. Es un comando muy útil para manipular cadenas de texto en la línea de comandos. Aquí tienes algunos ejemplos de cómo puedes usarlo:*

**Convertir minúsculas a mayúsculas:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo 'hola mundo' | tr 'a-z' 'A-Z'
```

*Este comando imprimirá 'HOLA MUNDO'.*

**Eliminar caracteres:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo 'hola mundo' | tr -d 'o'
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo 'hola mundo' | tr --delete 'o'
```

*Este comando imprimirá 'hla mund'. Ha eliminado todas las ocurrencias de 'o'.*

**Sustituir caracteres:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo 'hola mundo' | tr 'o' 'O'
```

*Este comando imprimirá 'hOla mundO'. Ha reemplazado todas las ocurrencias de 'o' por 'O'.*

*Traducir espacios en blanco a tabulaciones:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo "hola mundo" | tr ' ' '\t'
```

**Squeeze: reemplaza cada secuencia de entrada de caracteres repetidos que están en SET1 con una sola aparición de ese carácter:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo "hoooola mundo" | tr -s 'o'
```

```bash
echo "hoooola mundo" | tr --squeeze-repeats 'o'
```

*Este comando imprimirá 'hola mundo'. Ha reemplazado todas las secuencias de 'o' repetidas por una sola 'o'.*

**Complemento: `-c` o `-C` se usa para tomar el complemento de SET1:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo "hola mundo" | tr -c 'a-z' '*'
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo "hola mundo" | tr -C 'a-z' '*'
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo "HOLA MUNDO" | tr --complement 'a-z' '*'
```

*Este comando imprimirá `'***********'`. Ha reemplazado todos los caracteres que no son letras minúsculas por '*'._

*El comando `tr` en Unix y Linux es una utilidad de línea de comandos para traducir o eliminar caracteres. Sin embargo, `tr` no soporta expresiones regulares completas. En su lugar, `tr` opera en listas de caracteres.*

*Por ejemplo, puedes usar `tr` para cambiar todas las letras minúsculas a mayúsculas:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo 'hola mundo' | tr 'a-z' 'A-Z'
```

*O para eliminar todos los dígitos de una cadena:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo 'hola123' | tr -d '0-9'
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

echo 'hola123' | tr --delete '0-9'
```

> *Bash es principalmente un lenguaje de scripting de comando que sigue el paradigma de programación imperativa. En este paradigma, los comandos se ejecutan en secuencia, y el estado del programa se modifica a través de la asignación de variables y la ejecución de comandos.*

**Aquí están los paradigmas que Bash soporta:**

1. **Imperativo:** *Bash sigue un estilo de programación imperativo donde se da una serie de comandos para cambiar su estado.*

2. **Procedimental:** *Bash permite la definición de funciones, lo que permite la reutilización de código y la estructuración de scripts de manera más modular.*

3.**Comando:** *Bash es un lenguaje de comandos, lo que significa que su principal propósito es ejecutar comandos y manipular su salida.*

- *`#!/usr/bin/env bash` es una línea especial que se conoce como shebang o hashbang. Esta línea es la primera en los scripts de Bash y determina el intérprete que se utilizará para ejecutar el script.*

*En este caso, `#!/usr/bin/env bash` indica que el script debe ser ejecutado usando Bash, que es un shell de línea de comandos en sistemas Unix y Linux.*

- *Cuando un script con un shebang se ejecuta como un programa (por ejemplo, `./myscript.sh`), el sistema operativo utiliza la ruta especificada después del `#!` para encontrar el intérprete y lo ejecuta pasando el camino del script como argumento.*

- *`$1`: En Bash, `$1` se refiere al primer argumento que se pasa a tu script. Por ejemplo, si ejecutas tu script como `./script.sh miDirectorio`, entonces dentro de tu script, `$1` será `18`.*

*Se utiliza dentro de `[ ]` o `[[ ]]`.*

- *`-eq`: igual a*

- *`-ne`: no igual a*

- *`-gt`: mayor que*

- *`-ge`: mayor o igual a*

- *`-lt`: menor que*

- *`-le`: menor o igual a*

*Ejemplo de cada uno de estos operadores de comparación numérica en Bash:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -eq (igual a)
if [ "$1" -eq 10 ]; then
  echo "El primer argumento es igual a 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -eq (igual a)
if [ "$1" -eq 10 ]
then
  echo "El primer argumento es igual a 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -ne (no igual a)
if [ "$1" -ne 10 ]; then
  echo "El primer argumento no es igual a 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -ne (no igual a)
if [ "$1" -ne 10 ]
then
  echo "El primer argumento no es igual a 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -gt (mayor que)
if [ "$1" -gt 10 ]; then
  echo "El primer argumento es mayor que 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -gt (mayor que)
if [ "$1" -gt 10 ]
then
  echo "El primer argumento es mayor que 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -ge (mayor o igual a)
if [ "$1" -ge 10 ]; then
  echo "El primer argumento es mayor o igual a 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -ge (mayor o igual a)
if [ "$1" -ge 10 ]
then
  echo "El primer argumento es mayor o igual a 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -lt (menor que)
if [ "$1" -lt 10 ]; then
  echo "El primer argumento es menor que 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -lt (menor que)
if [ "$1" -lt 10 ]
then
  echo "El primer argumento es menor que 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -le (menor o igual a)
if [ "$1" -le 10 ]; then
  echo "El primer argumento es menor o igual a 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# -le (menor o igual a)
if [ "$1" -le 10 ]
then
  echo "El primer argumento es menor o igual a 10"
fi
```

*Estos scripts toman un argumento (`$1`) cuando se ejecutan y lo comparan con el número 10 utilizando diferentes operadores de comparación. Por ejemplo, puedes ejecutar uno de estos scripts con un argumento así: `./script.sh 15`.*

*Esto imprimirá "El primer argumento es igual a 10" si el primer argumento que pasas al script es 10.*

*Recuerda que estos operadores son para comparar números. Si estás comparando cadenas, debes usar `=`, `!=`, `<`, `>`, etc., en lugar de `-eq`, `-ne`, `-lt`, `-gt`, etc.*

*Por ejemplo, si tienes un script llamado `script.sh` con `#!/usr/bin/env bash` en la primera línea, cuando ejecutas `./script.sh`, el sistema operativo ejecuta algo como `/bin/bash ./script.sh` internamente.*

- *`[]`: En Bash, `[]` se usa para pruebas condicionales. Por ejemplo, `-d $1` comprueba si `$1` es un directorio, y `-f $name` comprueba si `$name` es un fichero regular.*

- *En Bash, tanto `[]` como `[[]]` se pueden usar para pruebas condicionales con números y cadenas. La diferencia principal entre los dos es que `[[]]` es una característica más nueva que proporciona más funcionalidades y es menos propensa a errores de sintaxis.*

*Para las pruebas numéricas, puedes usar operadores como `-eq`, `-ne`, `-lt`, `-le`, `-gt`, `-ge` dentro de `[]` o `[[]]`.*

*Para las pruebas de cadenas, puedes usar operadores como `=`, `!=`, `<`, `>`, `-n` (cadena no vacía), `-z` (cadena vacía) dentro de `[]` o `[[]]`.*

*El operador `-a` se usa para la conjunción lógica (AND) y `-o` para la disyunción lógica (OR) dentro de `[]`. Por ejemplo:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

if [ $1 -gt 10 -a $1 -lt 20 ]; then
  echo "El número está entre 10 y 20"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

if [ $1 -gt 10 -a $1 -lt 20 ]
then
  echo "El número está entre 10 y 20"
fi
```

*Sin embargo, dentro de `[[]]`, debes usar `&&` para AND y `||` para OR:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

if [[ $1 -gt 10 && $1 -lt 20 ]]; then
  echo "El número está entre 10 y 20"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

if [[ $1 -gt 10 && $1 -lt 20 ]]
then
  echo "El número está entre 10 y 20"
fi
```

*En general, es recomendable usar `[[]]` en lugar de `[]` en los scripts de Bash debido a su mayor flexibilidad y seguridad.*

*Ejemplos de `if`, `elif`, `else`, `for`, `foreach` (que en Bash se hace con `for`) y `while` en Bash, junto con comentarios explicativos*

- **Ejemplo de if, elif, else**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

if [ "$1" -gt 10 ]; then
  echo "El argumento es mayor que 10"
elif [ "$1" -eq 10 ]; then
  echo "El argumento es igual a 10"
else
  echo "El argumento es menor que 10"
fi
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

if [ "$1" -gt 10 ]
then
  echo "El argumento es mayor que 10"
elif [ "$1" -eq 10 ]
then
  echo "El argumento es igual a 10"
else
  echo "El argumento es menor que 10"
fi
```

*Este script toma un argumento (`$1`) y verifica si es mayor que, igual a, o menor que 10.*

- **Ejemplo de for**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

for i in 1 2 3 4 5; do
  echo "Número: $i"
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

for i in 1 2 3 4 5
do
  echo "Número: $i"
done
```

*Este script imprime los números del 1 al 5. `for` itera sobre los elementos de la lista (1 2 3 4 5), y para cada iteración, la variable `i` toma el valor del elemento actual.*

- **Ejemplo de foreach (usando for en Bash)**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

for i in $(ls); do
  echo "fichero: $i"
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

for i in $(ls) 
do
  echo "fichero: $i"
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

for i in `ls`; do
  echo "fichero: $i"
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

for i in `ls`
do
  echo "fichero: $i"
done
```

*Este script imprime los nombres de todos los ficheros en el directorio actual. `for` itera sobre la salida del comando `ls`, y para cada iteración, la variable `i` toma el valor del nombre del fichero actual.*

- **Ejemplo de while**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

i=1
while [ $i -le 5 ]; do
  echo "Número: $i"
  ((i++))
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

i=1
while [ $i -le 5 ]
do
  echo "Número: $i"
  ((i++))
done
```

*Este script imprime los números del 1 al 5. El bucle `while` continúa mientras la condición `[ $i -le 5 ]` sea verdadera. Dentro del bucle, se incrementa el valor de `i` en cada iteración con `((i++))`.*

- *`then` y `fi`: Estos son parte de la sintaxis de la declaración `if` en Bash. `then` indica el comienzo del bloque de código que se ejecutará si la condición de la declaración `if` es verdadera, y `fi` indica el final de este bloque.*

- *`do` y `done`: Estos son parte de la sintaxis del bucle `for` en Bash. `do` indica el comienzo del bloque de código que se ejecutará para cada iteración del bucle, y `done` indica el final de este bloque.*

- *`-f`: Cuando se usa con `[ ]` o `[[ ]]`, `-f` comprueba si un fichero existe y es un fichero regular.*

- *`-n` y `-e`: Estas son opciones para el comando `echo`. `-n` evita que `echo` imprima una nueva línea al final de la salida, y `-e` permite la interpretación de caracteres de escape como `\n` para una nueva línea.*

- *`(( ))`: En Bash, `(( ))` se usa para la aritmética de enteros. Por ejemplo, `(( total += $bytes ))` suma el valor de `$bytes` a `total`.*

- *`` `ls $1` ``: Esto ejecuta el comando `ls $1` y sustituye `` `ls $1` `` en el script por su salida. Esto se llama sustitución de comandos. En tu script, `ls $1` lista los ficheros en el directorio especificado por `$1`.*

- *En Bash, `$#` es una variable especial que contiene el número de argumentos que se pasaron al script o a la función.*

  - *Por ejemplo, si ejecutas tu script como `./script.sh arg1 arg2 arg3`, entonces dentro de tu script, `$#` será `3` porque pasaste tres argumentos al script.*

  - *Esto puede ser útil si necesitas realizar diferentes acciones dependiendo del número de argumentos, o si necesitas verificar que se ha proporcionado el número correcto de argumentos.*

> [!IMPORTANT]
> *Bash no tiene un tipado fuerte como otros lenguajes de programación como Python, y no soporta estructuras de datos complejas como listas, diccionarios o tuplas de la misma manera. Sin embargo, Bash tiene arrays y puedes iterar sobre un rango de números usando un bucle `for`. Aquí te dejo algunos ejemplos:*

**Rango en un bucle for:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

for i in {1..5}; do
  echo "Número: $i"
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

for i in {1..5} 
do
  echo "Número: $i"
done
```

*Esto imprimirá los números del 1 al 5.*

**Array:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
for i in "${array[@]}"; do
  echo "Elemento: $i"
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
for i in "${array[@]}"
do
  echo "Elemento: $i"
done
```

- *En bash, la sintaxis `${array[@]}` se utiliza para referirse a todos los elementos de un array. Aquí hay una explicación detallada:*

- **`array`:** *es el nombre del array.*
- **`[@]`:** *indica que se deben tomar todos los elementos del array.*

- *Cuando escribes `${array[@]}`, estás expandiendo el array completo a una lista de todos sus elementos. Esto es particularmente útil en bucles, como en tu ejemplo, donde deseas iterar sobre todos los elementos del array.*

**Vamos a desglosar tu script paso a paso:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
```

*Aquí defines un array llamado `array` que contiene tres elementos: `"elemento1"`, `"elemento2"`, y `"elemento3"`.*

```bash
for i in "${array[@]}"; do
```

- *Este bucle `for` recorre cada elemento del array. La expresión `${array[@]}` se expande a `"elemento1" "elemento2" "elemento3"`, y el bucle asigna cada uno de estos valores a la variable `i` en cada iteración.*

```bash
  echo "Elemento: $i"
done
```

- *Dentro del bucle, se imprime el valor actual de `i`, precedido por el texto `"Elemento: "`.*

*Entonces, el script completo imprimirá:*

```txt
Elemento: elemento1
Elemento: elemento2
Elemento: elemento3
```

- *En resumen, `${array[@]}` es una forma de acceder a todos los elementos del array, permitiéndote realizar operaciones en cada uno de ellos en un bucle u otra estructura de control.*

*En Bash, puedes acceder a un elemento específico de un array utilizando su índice. Los índices en Bash comienzan en 0. Aquí te dejo un ejemplo de cómo puedes hacerlo:*

```bash
array=("elemento1" "elemento2" "elemento3")
```

```bash
# Acceder al primer elemento (índice 0)
echo "Primer elemento: ${array[0]}"
```

```bash
# Acceder al segundo elemento (índice 1)
echo "Segundo elemento: ${array[1]}"
```

```bash
# Acceder al tercer elemento (índice 2)
echo "Tercer elemento: ${array[2]}"
```

*Si quieres iterar sobre los elementos del array junto con sus índices, puedes hacerlo de la siguiente manera:*

```bash
array=("elemento1" "elemento2" "elemento3")
for index in "${!array[@]}"; do
  echo "Elemento en el índice $index: ${array[$index]}"
done
```

*En Bash, puedes crear una lista (array) de números o cadenas de la siguiente manera:*

**Array de números:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

numeros=(1 2 3 4 5)
for num in "${numeros[@]}"; do
  echo "Número: $num"
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

numeros=(1 2 3 4 5)
for num in "${numeros[@]}"
do
  echo "Número: $num"
done
```

*Esto creará un array con los números del 1 al 5 y luego imprimirá cada número.*

*Si quieres crear un array que contenga tanto números como cadenas, puedes hacerlo de la siguiente manera:*

**Array de números y cadenas:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

mezcla=(1 "dos" 3 "cuatro" 5)
for elem in "${mezcla[@]}"; do
  echo "Elemento: $elem"
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

mezcla=(1 "dos" 3 "cuatro" 5)
for elem in "${mezcla[@]}"
do
  echo "Elemento: $elem"
done
```

*Esto creará un array con una mezcla de números y cadenas y luego imprimirá cada elemento.*

- *En Bash, `@` y `!` tienen significados especiales cuando se usan con arrays:*

- *`${array[@]}`: Esto se usa para acceder a todos los elementos de un array. Por ejemplo, si tienes un array llamado `array`, puedes usar `${array[@]}` para obtener todos sus elementos.*

- *`${!array[@]}`: Esto se usa para obtener todos los índices de un array. Por ejemplo, si tienes un array llamado `array`, puedes usar `${!array[@]}` para obtener todos sus índices.*

*Aquí tienes un ejemplo de cómo puedes usar ambos en un bucle `for` para imprimir los índices y los elementos de un array:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
for index in "${!array[@]}"; do
  echo "Índice: $index"
  echo "Elemento: ${array[$index]}"
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
for index in "${!array[@]}"
do
  echo "Índice: $index"
  echo "Elemento: ${array[$index]}"
done
```

*Esto imprimirá el índice y el elemento correspondiente para cada elemento en el array.*

*Si intentas imprimir un array en Bash utilizando `echo $array` o `echo ${array}`, sólo obtendrás el primer elemento del array. Esto se debe a que, en Bash, referirse a un array sin un índice es equivalente a referirse al elemento en el índice 0.*

*Aquí tienes un ejemplo:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
echo $array  # Imprime: elemento1
```

*Si quieres imprimir todos los elementos de un array, debes usar `${array[@]}` o `${array[*]}`:*

```bash
array=("elemento1" "elemento2" "elemento3")
echo ${array[@]}  # Imprime: elemento1 elemento2 elemento3
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
echo ${array[*]}  # Imprime: elemento1 elemento2 elemento3
```

*Si quieres imprimir los elementos de un array cada uno en una línea separada, puedes usar un bucle `for`:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
for elem in "${array[@]}"; do
  echo $elem
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
for elem in "${array[@]}"
do
  echo $elem
done
```

*Esto imprimirá cada elemento del array en su propia línea.*

*En Bash puedes usar `-1` para acceder al último elemento de un array, pero esto sólo funciona en Bash 4.3 y versiones posteriores. Aquí tienes un ejemplo:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
echo ${array[-1]}  # Imprime: elemento3
```

*Si estás utilizando una versión de Bash anterior a la 4.3, puedes obtener el último elemento de un array utilizando la longitud del array:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=("elemento1" "elemento2" "elemento3")
last_index=$(( ${#array[@]} - 1 ))
echo ${array[$last_index]}  # Imprime: elemento3
```

*La línea `last_index=$(( ${#array[@]} - 1 ))` en Bash está calculando el índice del último elemento de un array. Aquí está lo que hace cada parte:*

- *`last_index=`: Esto asigna el valor de la expresión a la derecha a la variable `last_index`.*

- *`$(( ... ))`: Esto es una construcción de Bash que permite la evaluación de una expresión aritmética. Todo lo que está dentro de `$(( ... ))` se evalúa como una expresión aritmética.*

- *`${#array[@]}`: Esto es una construcción de Bash que obtiene la longitud de un array. `array` es el nombre del array, `@` significa "todos los elementos del array", y `#` antes de un nombre de variable significa "la longitud de". Entonces, `${#array[@]}` significa "la longitud del array".*

- *`- 1`: Esto es una operación aritmética que resta 1 del valor a su izquierda. En este caso, está restando 1 de la longitud del array.*

*Por lo tanto, `last_index=$(( ${#array[@]} - 1 ))` calcula el índice del último elemento del array y asigna ese valor a la variable `last_index`.*

> [!NOTE]
> *Bash no soporta diccionarios hasta la versión 4. Si estás usando Bash 4 o superior, puedes crear y usar diccionarios de la siguiente manera:*

## ***Arrays Dinamicos***

- *En bash, los arrays pueden ser manipulados dinámicamente para agregar, borrar y modificar elementos. Aquí tienes ejemplos de cómo hacer cada una de estas operaciones:*

### ***Agregar Elementos a un Array***

#### ***Al final del array***

*Para agregar un elemento al final del array, puedes usar la sintaxis:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array+=("nuevo_elemento")
```

#### ***En una posición específica***

*Para insertar un elemento en una posición específica, necesitas usar una combinación de comandos `array` y `slice`:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=( "${array[@]:0:2}" "nuevo_elemento" "${array[@]:2}" )
# Esto inserta "nuevo_elemento" en la posición 2 (tercer elemento).
```

### ***Borrar Elementos de un Array***

#### ***Por índice***

*Para eliminar un elemento en una posición específica, puedes usar `unset`:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

unset array[1]
# Esto elimina el segundo elemento del array.
```

> [!NOTE]
> ***Nota:** Esto dejará un "hueco" en el array. Para compactar el array después de eliminar un elemento, puedes usar:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array=( "${array[@]}" )
```

#### ***Por valor (primera ocurrencia)***

**Para eliminar un elemento por su valor, debes recorrer el array:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

valor_a_borrar="elemento2"
for i in "${!array[@]}"; do
  if [[ "${array[i]}" == "$valor_a_borrar" ]]; then
    unset 'array[i]'
    break
  fi
done
#!/usr/bin/env bash
# Opcional: para compactar el array
array=( "${array[@]}" )
```

### ***Modificar Elementos de un Array***

*Para modificar un elemento en una posición específica, simplemente asigna un nuevo valor al índice deseado:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

array[1]="nuevo_valor"
# Esto cambia el segundo elemento a "nuevo_valor".
```

### ***Ejemplo Completo***

*Aquí tienes un script completo que demuestra todas estas operaciones:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 


# Inicializar el array
array=("elemento1" "elemento2" "elemento3")

# Agregar un elemento al final
array+=("elemento4")

# Insertar un elemento en una posición específica
array=( "${array[@]:0:2}" "elemento_insertado" "${array[@]:2}" )

# Modificar un elemento
array[1]="elemento_modificado"

# Borrar un elemento por índice
unset array[3]

# Eliminar por valor (primera ocurrencia)
valor_a_borrar="elemento2"
for i in "${!array[@]}"; do
  if [[ "${array[i]}" == "$valor_a_borrar" ]]; then
    unset 'array[i]'
    break
  fi
done

# Compactar el array (opcional)
array=( "${array[@]}" )

# Imprimir el array resultante
for i in "${array[@]}"; do
  echo "Elemento: $i"
done
```

### ***Explicación de las operaciones***

1. **Agregar al final:** *`array+=("elemento4")` añade `"elemento4"` al final del array.*

2. **Insertar en una posición específica:** *`array=( "${array[@]:0:2}" "elemento_insertado" "${array[@]:2}" )` inserta `"elemento_insertado"` en la posición 2 (tercer lugar).*

3. **Modificar un elemento:** *`array[1]="elemento_modificado"` cambia el segundo elemento a `"elemento_modificado"`.*

4. **Borrar por índice:** *`unset array[3]` elimina el cuarto elemento.*

5. **Borrar por valor:** *Un bucle recorre el array para encontrar y eliminar `"elemento2"`.*

6. **Compactar el array:** *`array=( "${array[@]}" )` reindexa el array para eliminar huecos.*

*Estos ejemplos muestran cómo manejar dinámicamente arrays en bash, permitiendo agregar, eliminar y modificar elementos según sea necesario.*

**Diccionario:**

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

declare -A diccionario
diccionario=([clave1]="valor1" [clave2]="valor2")
for clave in "${!diccionario[@]}"; do
  echo "Clave: $clave"
  echo "Valor: ${diccionario[$clave]}"
done
```

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

declare -A diccionario
diccionario=([clave1]="valor1" [clave2]="valor2")
for clave in "${!diccionario[@]}"
do
  echo "Clave: $clave"
  echo "Valor: ${diccionario[$clave]}"
done
```

*Esto creará un diccionario con dos pares clave-valor y luego imprimirá cada clave y su valor correspondiente.*

- *`declare -A` en Bash se utiliza para declarar una variable como un array asociativo (también conocido como diccionario o mapa hash). Los arrays asociativos son arrays que utilizan cadenas como índices en lugar de números.*

*Aquí tienes un ejemplo de cómo puedes declarar y utilizar un array asociativo en Bash:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

declare -A animales
animales=(["gato"]="miau" ["perro"]="guau" ["vaca"]="muu")

echo "El gato dice ${animales[gato]}"
echo "El perro dice ${animales[perro]}"
echo "La vaca dice ${animales[vaca]}"
```

*En este ejemplo, `animales` es un array asociativo que mapea nombres de animales a los sonidos que hacen. Puedes acceder a los valores en el array utilizando las claves entre corchetes, como `${animales[gato]}`.*

> *Recuerda que Bash es un lenguaje de scripting orientado a la manipulación de texto y la ejecución de comandos, por lo que no tiene muchas de las características de los lenguajes de programación de propósito general. Si necesitas trabajar con estructuras de datos más complejas, podrías considerar usar un lenguaje como Python en su lugar.*

*En bash, los diccionarios (también conocidos como arrays asociativos) te permiten almacenar pares clave-valor. Puedes agregar, modificar y eliminar elementos en un diccionario de la siguiente manera:*

### ***Agregar Elementos a un Diccionario***

*Para agregar un nuevo par clave-valor, simplemente asigna un valor a una nueva clave:*

```bash
animales["pato"]="cuac"
```

### ***Modificar Elementos en un Diccionario***

*Para modificar el valor asociado a una clave existente, asigna un nuevo valor a esa clave:*

```bash
animales["gato"]="miau miau"
```

### ***Eliminar Elementos de un Diccionario***

*Para eliminar un par clave-valor, usa el comando `unset`:*

```bash
unset animales["vaca"]
```

### ***Ejemplo Completo Diccionarios***

*Aquí tienes un script completo que demuestra cómo agregar, modificar y eliminar elementos en un diccionario:*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

declare -A animales
animales=(["gato"]="miau" ["perro"]="guau" ["vaca"]="muu")

# Mostrar los valores actuales
echo "El gato dice ${animales[gato]}"
echo "El perro dice ${animales[perro]}"
echo "La vaca dice ${animales[vaca]}"

# Agregar un nuevo elemento
animales["pato"]="cuac"

# Modificar un elemento existente
animales["gato"]="miau miau"

# Eliminar un elemento
unset animales["vaca"]

# Mostrar los valores después de las modificaciones
echo "Después de las modificaciones:"
echo "El gato dice ${animales[gato]}"
echo "El perro dice ${animales[perro]}"
echo "El pato dice ${animales[pato]}"

# Intentar mostrar la vaca (debería no existir)
if [[ -v animales["vaca"] ]]; then
  echo "La vaca dice ${animales[vaca]}"
else
  echo "La vaca ha sido eliminada"
fi
```

*En bash, la opción `-v` se usa con la condición [[ ]] para verificar si una variable (o clave en un array asociativo) está establecida. Esto es útil para comprobar la existencia de una variable o de una clave en un diccionario (array asociativo).*

**Uso de `-v` en Arrays Asociativos**

*Cuando se usa con arrays asociativos, `-v` permite verificar si una clave específica está definida en el diccionario.*

**¿Por Qué Usar `-v`?**

*Usar `-v` es importante porque:*

- **Evita errores:** *Intentar acceder a una clave inexistente sin comprobar su existencia primero puede llevar a resultados inesperados o errores en el script.*
  
- **Control de flujo:** *Permite tomar decisiones basadas en la presencia o ausencia de claves específicas en un diccionario.*

*En resumen, -v es una opción útil para verificar la existencia de variables y claves en arrays asociativos en bash, mejorando la robustez y el control del flujo en tus scripts.*

### ***Explicación de las Operaciones***

1. **Agregar un nuevo elemento:** *`animales["pato"]="cuac"` añade una nueva clave `"pato"` con el valor `"cuac"`.*

2. **Modificar un elemento existente:** *`animales["gato"]="miau miau"` cambia el valor de la clave `"gato"` a `"miau miau"`.*

3. **Eliminar un elemento:** *`unset animales["vaca"]` elimina la clave `"vaca"` y su valor asociado del diccionario.*

4. **Verificar la existencia de una clave:** *`if [[ -v animales["vaca"] ]]; then ...` comprueba si la clave `"vaca"` todavía existe en el diccionario.*

*Con estas operaciones, puedes gestionar dinámicamente los elementos de un diccionario en bash.*

- **Bash, siendo un lenguaje de scripting de propósito general y no orientado a objetos, no soporta programación orientada a objetos (POO) o excepciones de la misma manera que los lenguajes como Python, Java, o C++. Sin embargo, hay formas de manejar errores y simular conceptos similares a las excepciones en bash.**

- *El comando `until` en bash se utiliza para ejecutar un bloque de código repetidamente hasta que una condición especificada sea verdadera. Funciona de manera inversa al comando `while`, que ejecuta un bloque de código mientras una condición sea verdadera.*

### Sintaxis del bucle `until`

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

until [ condición ]; do
  # Bloque de código a ejecutar
done
```

- *El bloque de código dentro del `until` se ejecutará repetidamente hasta que la condición sea verdadera (es decir, retorne un valor de salida cero).*

### ***Ejemplos de Uso del Bucle `until`***

#### ***Ejemplo 1: Contador Simple***

*En este ejemplo, un contador incrementa desde 1 hasta 5, y el bucle se ejecuta hasta que el contador sea mayor que 5.*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 


contador=1

until [ $contador -gt 5 ]; do
  echo "Contador: $contador"
  ((contador++))  # Incrementa el contador
done

echo "Bucle terminado. Contador final: $contador"
```

**Explicación:**

- *`contador=1`: Inicializa el contador en 1.*

- *`until [ $contador -gt 5 ]`: El bucle se ejecuta mientras `contador` sea menor o igual a 5.*

- *`echo "Contador: $contador"`: Imprime el valor actual del contador.*

- *`((contador++))`: Incrementa el valor del contador en 1.*

- *Cuando `contador` es mayor que 5, el bucle se termina y se imprime el mensaje final.*

#### ***Ejemplo 2: Esperar a que un archivo exista***

*En este ejemplo, el script espera hasta que un archivo específico aparezca en el sistema de archivos.*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 


archivo="archivo.txt"

echo "Esperando a que el archivo $archivo aparezca..."

until [ -f "$archivo" ]; do
  echo "El archivo $archivo no existe todavía."
  sleep 1  # Espera 1 segundo antes de verificar nuevamente
done

echo "El archivo $archivo ha aparecido."
```

**Explicación:**

- *`archivo="archivo.txt"`: Define el nombre del archivo a verificar.*

- *`until [ -f "$archivo" ]`: El bucle se ejecuta mientras el archivo no exista.*

- *`echo "El archivo $archivo no existe todavía."`: Informa que el archivo no se encuentra.*

- *`sleep 1`: Espera 1 segundo antes de volver a verificar.*

- *Cuando el archivo aparece, el bucle termina y se imprime el mensaje final.*

#### ***Ejemplo 3: Leer Entrada del Usuario***

*En este ejemplo, el script pide al usuario que ingrese la contraseña correcta. El bucle se ejecuta hasta que el usuario ingrese la contraseña correcta.*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 


contraseña_correcta="secreto"
entrada=""

until [ "$entrada" == "$contraseña_correcta" ]; do
  read -sp "Ingrese la contraseña: " entrada
  echo
  if [ "$entrada" != "$contraseña_correcta" ]; then
    echo "Contraseña incorrecta. Inténtelo de nuevo."
  fi
done

echo "Contraseña correcta. Acceso concedido."
```

**Explicación:**

- *`contraseña_correcta="secreto"`: Define la contraseña correcta.*

- *`entrada=""`: Inicializa la variable de entrada.*

- *`until [ "$entrada" == "$contraseña_correcta" ]`: El bucle se ejecuta hasta que la entrada coincida con la contraseña correcta.*

- *`read -sp "Ingrese la contraseña: " entrada`: Solicita al usuario que ingrese la contraseña (sin mostrarla en la pantalla).*

- *`echo`: Añade una nueva línea después de la entrada.*

- *`if [ "$entrada" != "$contraseña_correcta" ]; then ...`: Verifica si la entrada es incorrecta y proporciona retroalimentación.*

- *Cuando la entrada es correcta, el bucle termina y se imprime el mensaje final.*

### ***Resumen***

*El bucle `until` en bash es útil para ejecutar un bloque de código repetidamente hasta que una condición específica sea verdadera. Es particularmente útil cuando se espera un evento o condición específica, como la aparición de un archivo, la entrada correcta del usuario, o cualquier otra condición que puede no ser verdadera en el momento inicial de la ejecución del script.*

### ***Manejo de Errores en Bash***

- *En bash, el manejo de errores generalmente se realiza mediante el control de códigos de retorno y la redirección de errores. A continuación, se presentan algunas técnicas para manejar errores en bash.*

#### ***Uso de `set -e`***

- *El comando `set -e` hace que el script termine si un comando devuelve un código de error (no cero). Esto puede ser útil para detener la ejecución cuando ocurre un error.*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 


set -e

echo "Este es un script con manejo básico de errores."

# Comando que podría fallar
comandoQuePodriaFallar() {
  return 1
}

comandoQuePodriaFallar
echo "Este mensaje no se mostrará porque el comando anterior falló."
```

- *La opción `-e` en bash es una opción de ejecución que se usa con el comando set para cambiar el comportamiento del script respecto al manejo de errores. Cuando`-e` está activada, el script se detendrá inmediatamente si cualquier comando devuelve un código de salida distinto de cero, lo cual generalmente indica un error.*

**Uso de set `-e`**

- *Cuando se usa set `-e`, cualquier comando que falle hará que el script termine inmediatamente, a menos que el comando fallido sea parte de un condicional `if`, un bucle `while` o `until`, o un comando después de `||` o `&&`.*

#### Uso de `trap`

*El comando `trap` puede atrapar señales y ejecutar una función específica cuando ocurre un error.*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 


trap 'echo "Ocurrió un error en la línea $LINENO"; exit 1' ERR

echo "Este es un script con manejo de errores utilizando trap."

# Comando que falla
comandoQuefalla() {
  return 1
}

comandoQuefalla
echo "Este mensaje no se mostrará porque el comando anterior falló."
```

#### ***Comprobación de Códigos de Retorno***

- *Puedes comprobar explícitamente el código de retorno de los comandos y manejar los errores según sea necesario.*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 


echo "Este es un script con manejo manual de errores."

comandoQuePodriaFallar() {
  return 1
}

comandoQuePodriaFallar
if [ $? -ne 0 ]; then
  echo "El comando falló."
  # Manejo del error
fi

echo "Este mensaje se mostrará porque el error fue manejado manualmente."
```

### ***Simulación de POO en Bash***

- *Aunque bash no es un lenguaje orientado a objetos, puedes simular algunos conceptos de POO utilizando funciones y estructuras de datos como arrays asociativos.*

#### ***Definición de "Clases" y "Métodos"***

- *Puedes utilizar arrays asociativos para simular objetos y funciones para métodos.*

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 


# "Clase" Animal
declare -A Animal

# "Método" para crear un nuevo animal
Animal.new() {
  local name=$1
  local sound=$2
  Animal["name"]=$name
  Animal["sound"]=$sound
}

# "Método" para hacer sonido
Animal.sound() {
  echo "${Animal["name"]} dice ${Animal["sound"]}"
}

# Crear una instancia de "Animal"
Animal.new "gato" "miau"

# Llamar a un "método"
Animal.sound
```

### ***Ejemplo Completo de Simulación de POO***

```bash
#!/usr/bin/env bash
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 


# "Clase" Animal
declare -A Animal

# "Método" para crear un nuevo animal
Animal.new() {
  local name=$1
  local sound=$2
  Animal["name"]=$name
  Animal["sound"]=$sound
}

# "Método" para hacer sonido
Animal.sound() {
  echo "${Animal["name"]} dice ${Animal["sound"]}"
}

# Crear una instancia de "Animal"
Animal.new "gato" "miau"
# Llamar a un "método"
Animal.sound

# Crear otra instancia de "Animal"
Animal.new "perro" "guau"
Animal.sound
```

### ***Conclusión***

- *Aunque bash no soporta POO y manejo de excepciones como los lenguajes de programación más avanzados, puedes utilizar técnicas como `set -e`, `trap`, y la comprobación de códigos de retorno para manejar errores. Para simular POO, puedes usar arrays asociativos y funciones para crear estructuras que se comporten de manera similar a clases y métodos. Esto permite una mayor organización y reutilización del código en tus scripts de bash.*
