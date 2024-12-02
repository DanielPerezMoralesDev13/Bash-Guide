# **1. Estructura `case` en Bash**

- *La estructura `case` evalúa una variable o expresión y ejecuta diferentes bloques de código dependiendo de su valor.*

```bash
case "$variable" in
  valor1)
    echo "Caso 1: valor1"
    ;;
  valor2 | valor3)
    echo "Caso 2: valor2 o valor3 (OR)"
    ;;
  *)
    echo "Caso por defecto"
    ;;
esac
```

- **`$variable`:** **La variable que se evalúa.**
- **`valor1)`:** **Coincidencia exacta con `valor1`.**
- **`valor2 | valor3)`:** **Coincidencia múltiple (*OR*) con `valor2` o `valor3`.**
- **`*)`:** **Caso por defecto (*wildcard*), se ejecuta si no hay coincidencias.**

---

```bash
#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

read -p "Introduce un valor: " input

case "$input" in
  start)
    echo "Iniciando el sistema..."
    ;;
  stop | quit)
    echo "Deteniendo el sistema..."
    ;;
  *)
    echo "Opción no válida."
    ;;
esac
```

---

## **2. Listas (Arrays) en Bash**

### **Crear una lista:**

```bash
myList=("manzana" "uva" "cereza")
```

### **Acceder a elementos:**

```bash
echo "${myList[0]}"  # Imprime el primer elemento: manzana
```

### **Añadir elementos:**

```bash
myList+=("naranja")
```

### **Eliminar un elemento:**

```bash
unset myList[1]  # Elimina el segundo elemento ("uva")
```

### **Actualizar un elemento:**

```bash
myList[0]="Pera"  # Cambia "manzana" por "Pera"
```

### **Recorrer la lista:**

```bash
for fruta in "${myList[@]}"; do
  echo "$fruta"
done
```

---

## **3. Diccionarios (Associative Arrays) en Bash**

- **Los diccionarios en Bash requieren que declares el array como *asociativo*.**

### **Crear y asignar valores:**

```bash
declare -A myDiccionario
myDiccionario=( 
    ["nombre"]="Daniel" 
    ["edad"]="25" 
)
```

### **Acceder a valores:**

```bash
echo "${myDiccionario[nombre]}"  # Imprime: Daniel
```

### **Añadir/Actualizar valores:**

```bash
myDiccionario["apellido"]="Perez"
```

### **Eliminar una clave:**

```bash
unset myDiccionario["edad"]
```

### **Recorrer el diccionario:**

```bash
for clave in "${!myDiccionario[@]}"; do
  echo "$clave: ${myDiccionario[$clave]}"
done
```

---

## **4. Condicionales (`if`) en Bash**

### **Sintaxis básica:**

```bash
if [ condición ]; then
  echo "Condición verdadera"
elif [ otra_condición ]; then
  echo "Otra condición verdadera"
else
  echo "Condición falsa"
fi
```

---

### **OPeradores comunes:**

| *OPerador* | *Descripción*               |
| ---------- | --------------------------- |
| `-eq`      | *Igual a*                   |
| `-ne`      | *No igual a*                |
| `-lt`      | *Menor que*                 |
| `-le`      | *Menor o igual que*         |
| `-gt`      | *Mayor que*                 |
| `-ge`      | *Mayor o igual que*         |
| `-z`       | *Cadena vacía*              |
| `-n`       | *Cadena no vacía*           |
| `-d`       | *Existe y es un directorio* |
| `-f`       | *Existe y es un archivo*    |

---

### **Ejemplo: Comparación numérica y de cadenas:**

```bash
#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

read -p "Introduce un número: " num

if [ "$num" -eq 10 ]; then
  echo "El número es 10"
elif [ "$num" -lt 10 ]; then
  echo "El número es menor que 10"
else
  echo "El número es mayor que 10"
fi
```

---

## **5. Ejemplo completo con todo lo aprendido:**

```bash
#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

declare -A usuarios

usuarios=( ["admin"]="1234" ["guest"]="abcd" )

echo "Lista de usuarios:"
for usuario in "${!usuarios[@]}"; do
  echo "- $usuario"
done

read -p "Introduce tu nombre de usuario: " nombre

if [ -n "${usuarios[$nombre]}" ]; then
  read -sp "Introduce tu contraseña: " pass
  echo
  if [ "${usuarios[$nombre]}" == "$pass" ]; then
    echo "Acceso concedido."
  else
    echo "Contraseña incorrecta."
  fi
else
  echo "Usuario no encontrado."
fi
```

---

### ***Manejo de listas y diccionarios en Bash***

- *Bash no tiene soporte directo para listas y diccionarios como otros lenguajes, pero puedes usar **arrays** y **associative arrays** para simularlos.*

---

## **1. Manejo de Listas (Arrays):**

### Operaciones básicas

- **Crear** *una lista.*
- **Añadir** *elementos.*
- **Actualizar** *elementos.*
- **Eliminar** *elementos.*
- **Imprimir** *elementos individuales y toda la lista.*

```bash
#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

# Crear una lista
myList=("elemento1" "elemento2" "elemento3")

# Añadir un elemento
myList+=("elemento4")

# Actualizar un elemento (índice 1)
myList[1]="nuevo_elemento2"

# Eliminar un elemento (índice 2)
unset myList[2]

# Imprimir un elemento específico (índice 0)
echo "Elemento en índice 0: ${myList[0]}"

# Imprimir toda la lista
echo "Lista completa: ${myList[@]}"

# Imprimir índices de la lista
echo "Índices: ${!myList[@]}"

# Imprimir longitud de la lista
echo "Longitud de la lista: ${#myList[@]}"
```

---

## **2. Manejo de Diccionarios (Associative Arrays):**

- *Los diccionarios requieren Bash 4 o superior.*

- **Crear** *un diccionario.*
- **Añadir** *pares clave-valor.*
- **Actualizar** *un valor.*
- **Eliminar** *una clave.*
- **Imprimir** *valores específicos y todo el diccionario.*

```bash
#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

# Declarar un diccionario
declare -A myDiccionario

# Añadir elementos (clave:valor)
myDiccionario=(
  ["clave1"]="valor1"
  ["clave2"]="valor2"
)

# Añadir un nuevo par clave-valor
myDiccionario["clave3"]="valor3"

# Actualizar un valor (clave2)
myDiccionario["clave2"]="nuevo_valor2"

# Eliminar una clave
unset myDiccionario["clave1"]

# Imprimir un valor específico (clave2)
echo "Valor de clave2: ${myDiccionario["clave2"]}"

# Imprimir todas las claves
echo "Claves: ${!myDiccionario[@]}"

# Imprimir todos los valores
echo "Valores: ${myDiccionario[@]}"

# Imprimir todo el diccionario
for clave in "${!myDiccionario[@]}"; do
  echo "$clave: ${myDiccionario[$clave]}"
done
```

---

### **Explicación:**

- **Listas:** *Los arrays en Bash son indexados numéricamente, comenzando desde `0`.*
- **Diccionarios:** *Los associative arrays permiten asignar valores a claves personalizadas.*

### **Notas:**

- *Usa `unset` para eliminar elementos en ambos casos.*
- *Para imprimir claves y valores, el bucle `for` es útil en diccionarios.*

### ***Iteración sobre un diccionario (Associative Array):***

- **Código:**

```bash
#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

# Declarar un diccionario

declare -A myDiccionario

## Añadir elementos al diccionario

myDiccionario["clave1"]="valor1"
myDiccionario["clave2"]="valor2"
myDiccionario["clave3"]="valor3"
```

## ***Iterar sobre el diccionario (clave y valor)***

```bash
for clave in "${!myDiccionario[@]}"; do
  valor=${myDiccionario[$clave]}
  echo "Clave: $clave, Valor: $valor"
done
```

- *Explicación:*
  - *`${!myDiccionario[@]}`: Itera sobre todas las claves del diccionario.*
  - *`${myDiccionario[$clave]}`: Accede al valor correspondiente a cada clave.*

- **Notas adicionales:**

  - *Listas: El bucle for recorre los elementos o índices según cómo uses la lista.*
  - *Diccionarios: Debes declarar el diccionario con declare -A y luego usar un bucle para obtener clave y valor.*
