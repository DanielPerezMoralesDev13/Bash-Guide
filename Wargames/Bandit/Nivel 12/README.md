<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 11 → Nivel 12***

- **Meta de nivel**

- *La contraseña para el siguiente nivel se guarda en el archivo data.txt, donde todas las letras minúsculas (a-z) y mayúsculas (A-Z) se han rotado 13 posiciones*
- *Comandos que puedes necesitar para resolver este nivel*

- *grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd*
*Material de lectura útil*

- *Rot13 en Wikipedia*

## ***ROT13 y el Cifrado César***

---

### ***Qué es ROT13***

> [!NOTE]
> **ROT13** *es un tipo de cifrado simple basado en el algoritmo del **cifrado César**. Se caracteriza por "rotar" cada letra del alfabeto **13 posiciones hacia adelante**. Es un caso particular de cifrado César con un desplazamiento fijo de 13.*

**Por ejemplo:**

- *La letra **`A`** se convierte en **`N`**.*
- *La letra **`N`** se convierte en **`A`**.*
- *Funciona de manera simétrica: aplicar ROT13 dos veces devuelve el texto original.*

---

#### ***Qué es un Cifrado César***

- *Un **cifrado César** es una técnica de encriptación muy antigua que consiste en desplazar cada letra de un texto un número fijo de posiciones en el alfabeto. Fue utilizado por **Julio César** en sus comunicaciones militares.*

- **Por ejemplo:**

- *Si el desplazamiento es de 3:*
  - **`A`** → **`D`,**
  - **`B`** → **`E`,**
  - *y así sucesivamente.*

*Cuando se llega al final del alfabeto, se vuelve al inicio en un ciclo continuo. Por ejemplo:*

- **`X`** *→* **`A`,** *con un desplazamiento de 3.*

---

#### **Comando `tr` y cómo aplica ROT13**

```bash
bandit11@bandit:~$ cat data.txt
Gur cnffjbeq vf 7k16JArUVv5LxVuJfsSVdbbtaHGlw9D4
```

**En el comando:**

```bash
cat data.txt | tr '[G-ZA-Fg-za-f]' '[T-ZA-St-za-s]'
```

1. **`tr`:** *Es un comando que traduce o reemplaza caracteres según un patrón definido.*
2. **`[G-ZA-Fg-za-f]`:** *Define el rango de caracteres cifrados en el texto.*
   - *Este rango indica que las letras entre **`G` y `Z`** (en mayúsculas y minúsculas) deben ser reemplazadas.*
3. **`[T-ZA-St-za-s]`:** *Define cómo serán reemplazados los caracteres.*
   - *Las letras **`G` a `Z`** se mapean con un desplazamiento hacia atrás que corresponde a **ROT13**.*

---

#### **Extracción de la última palabra**

**El siguiente comando extrae únicamente la última palabra descifrada:**

```bash
cat data.txt | tr '[G-ZA-Fg-za-f]' '[T-ZA-St-za-s]' | awk 'NF{print $NF}'
```

- **`awk 'NF{print $NF}'`**:
  - **`NF`:** *Se asegura de que la línea no esté vacía.*
  - **`$NF`:** *Imprime el último campo (última palabra).*

**Salida esperada:**

```bash
7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
```

---

### ***Por qué se llama Cifrado César***

- *El nombre proviene de **Julio César**, el famoso líder romano que utilizó esta técnica para codificar mensajes confidenciales, asegurando que solo los destinatarios autorizados pudieran entenderlos.*

- *Este método era fácil de usar y efectivo para su época, aunque es muy vulnerable frente a métodos modernos de descifrado.*
