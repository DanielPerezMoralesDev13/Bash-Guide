<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bandido Nivel 8 → Nivel 9***

- **Meta del nivel**

- *La contraseña del siguiente nivel se guarda en el archivo data.txt y es la única línea de texto que aparece una sola vez*
- **Comandos que puedes necesitar para resolver este nivel**

- *grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd*
- **Material de lectura útil**
- **Canalización y redirección**

## **Uso de `sort` y `uniq` para filtrar líneas únicas**

### **1. Problema inicial:**

```bash
cat data.txt | uniq -u
```

- **Descripción:** Este comando no funcionará correctamente porque `uniq` filtra solo las líneas **adyacentes repetidas**. Si el archivo no está ordenado, `uniq` no puede detectar líneas duplicadas que no sean consecutivas.
- **Solución:** Es necesario ordenar primero las líneas para garantizar que las duplicadas estén juntas.

---

#### **2. Comando corregido y explicación:**

```bash
cat data.txt | sort | uniq -u
```

- **Descripción:**
  - `sort`: Ordena todas las líneas de `data.txt` para agrupar las duplicadas.
  - `uniq -u`: Filtra y muestra solo las líneas **únicas** (no repetidas en el archivo).

- **Salida:**

  ```bash
  4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
  ```

---

#### **3. Uso directo de `sort` sin `cat`:**

```bash
sort data.txt | uniq -u
```

- **Descripción:** Realiza la misma operación que el comando anterior, pero elimina el uso redundante de `cat`.

---

### **Opciones importantes del comando `uniq`:**

- `uniq -c`: Muestra cada línea con un prefijo indicando la cantidad de repeticiones.
- `uniq -d`: Muestra solo las líneas repetidas.
- `uniq -u`: Muestra solo las líneas únicas (no repetidas).

#### **Ejemplo:**

```bash
cat data.txt | sort | uniq -c
```

- **Salida:** Muestra cuántas veces aparece cada línea en el archivo ordenado.

---

### **Nota clave sobre `uniq`:**

- `uniq` **no detecta líneas duplicadas a menos que estén juntas**. Por lo tanto, siempre es buena práctica usar `sort` antes de `uniq` cuando se trabaja con archivos no ordenados.

---

### **Resumen:**

1. **Detectar líneas únicas:**

    ```bash
   sort data.txt | uniq -u
   ```

   ```bash
   sort data.txt | uniq -u
   4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
   ```

2. **Detectar líneas duplicadas:**

    ```bash
   sort data.txt | uniq -d
   ```

   ```bash
   sort data.txt | uniq -d
   0BKVRLEJQcpNx8wnSPxDLFnFKlQafKK6
   0eJPctF8gK96ykGBBaKydhJgxSpTlJtz
   0kJ7XHD4gVtNSZIpqyP1V45sfz9OBLFo
   0lPOvKhpHZebxji0gdjtGCd5GWiZnNBj
   0REUhKk0yMqQOwei6NK9ZqIpE5dVlWWM
   1jfUH1m4XCjr7eWAeleGdaNSxFXRtX0l
   1VKPEkd0bCtIRwMFVQfY7InulwOFyDsn
   2u8fvAzvnaFlvQG3iPt4Wc1TFhPcGxhH
   35l6mr3f6TvlJyDwU6aUgJX07cLhr6t9
   3FIgajXBiaQAiTMVGo1gxRDSiACNyvvJ
   3mNA2le0gfURQKNHVIhGkMNLqLwjyyLN
   4P8FsHcdr7d5WKnPtAaXY5SslKICd2gL
   5EmwMKZHwF6Lwq5jHUaDlfFJBeHbcX0b
   5hYz0028e1Q2TrtPVz5GZbpMzZNjebhh
   5I2jWpqjtVp576xXI2TLh1UCyXJtGQ78
   6Boy6esAjnIxCYn8uI6KZ7VD7zysDM8i
   7cP8ssLElERHXqOJc9T84bxsmJBjNXk2
   7qHmEo1FEbzthgyNpKc38YofXjYKZv18
   8FCtUQlFXsJnNeyiDY5KfE3vRy6sZFEJ
   8pePxslMzXqA2mi87wFjxd44qDRdrPiW
   9jfKbKGp40LjMuiiH9cce4bUo9y8nd0j
   9PqZLdu143n5djN9mL1MCamrmHERuV7k
   9Tar2wcD3Urge6s2yp18CAE8zX1poUwV
   A4MixXbxP5t0RE87qkmAdwwPJO3Aw6rO
   aFStfHbnQdPWqyRHEzhqe91Wch4O8xHJ
   aMKlTMrptUxxTypCHocCTrqYRkR2gT8h
   AOz67fZdaabu2QQyatGXK1dXNUIuyuOD
   BIAd2jxKMFmitEvp0WmsM0oDAwj4WSUa
   BmwX4bYhJXyImwt4AVHr7wFyLYCn4IIs
   BooZo7QXA1Tft7d6zbVkgJiGoJzuBTXS
   ByBO7V0FaYWN1cqIFbNss21xmjf9VNBP
   CgUjZiluCoMEvzNAge1Nbv3g9tpLQQj2
   CgvfWFmg5yxx12D2SZvjzaakG0JIyg7B
   cOk5XehQn4Uoz1z255BqS8y74pthqBeC
   dPk8jhZUckmUiDsn4fXE28LpV5VTvev7
   DShzsMw0ejGwWSFIlvAybLwBLKX6qVfF
   EgKFNgP4k1pMfGdrWRSiDIvSlAC0Tr42
   EtevhzigGTVT4NbybBWK5DNXnPt2D5AM
   fmt1Bzwt8Yw0t0cBVine7zuwyS76iJ7N
   fSbQqHX7C5Er4WmMSlQ9jkl05sXYQgJU
   ft7OpREehafXGOiX8EtyzEqXU8f3KRug
   GCaJbpW4K28ukFR84YhZFY6e7MvAOwpX
   GW8cRcKbnz53MAPYECx99O0T8POlPIFk
   hevU1VzF39ZyhyYkCBgmVrY6DbiRt2t5
   HloFLs5IpuFLuVJugBxKEipr5QaObJMk
   iGmmKP7APsDfPxrZjCL7eDpGEWR3ot3q
   IkJadTScIdBQY9a4KVjBEHyXKubCxSlx
   JaFwKSH0hiff1XRuxVYCzjjtibV9P3zF
   JQx6RCcNbAesB2lehrUl821WnJPI5gHW
   K8GxBwF1vxLQB5PaqlcCGfRniemRScj4
   kgf5CWCm26sycUzaAJRP7e6hYKVwu7Y4
   KhRNo5JlbDhxbBqCGIokXqBm54v7Wunm
   KqpxKPY3yIDdEVewIwuetpV0WvGIsN5U
   KZJOZECxhLxDhxDbGzdNy8m0uplzvP11
   L2iewY0lmIRR6arfrwWA3VhttgbJ0NIn
   mMD5Z4y1rRh07rmVRw2HfgcMegbKH0c0
   mUNISmDjtb3h6xAt3wGRVTY9U0r2u9bR
   noa4sUvodI8D733ugvy2OAlttHdjMPWJ
   o44oO4jbyPqoQQYX16586yC7Os2uz3ks
   omBfcRI91Zm06GI0RLngq05AMwe8Ndqo
   PHE4soLmy3nZfNOlX3jB8LYKYZRXuTah
   pij5cPffIOml4tkDCOwo7M2zyxImYJWm
   PLsGPuNgYzI8YNu2Y7h4D4vz1nHPSuNl
   pngaDVKjQWnWHOOUze15L3QpwqKme5M9
   PRerp5EfTVxJHKuCZDXfAfRyCQSdPjMi
   prq3SdTnv0vUMlcfcb4yvkl6GAXvtwWE
   q3dcRUh6vecqwa2ahKdvwWJDon3qA1Xe
   qEi18Iw0qI0fe3fGMr6tTPpL6SbPMjk3
   QPVchwY9MCJJ1W6kCWMncGWK2YfcUlFE
   QQozajTq9wdmrO8AMwcL1i4EG0DA3I3a
   QWumJVhaTjgcTVU6PILDgf5nPauD4VMm
   RAM7lFRXtvR3BlgtbRU3dz5UxZYQQ06I
   RAp5mFyjEBVSRTU203Y4Q1RDSlj7hN1v
   rENclsy8XIuTnTvJfXagTFpcd78FX8WM
   rhquEZ5rMuUSRIxtG9DQ6KVOyqPpL0MP
   RpRE5maDwMQTa8oJt7vVNqff7ElrjLTq
   s8SnoFuk0jR1CTdQ7pctd67nakJWN2Vc
   sapgezVFdEYdD3IkqFZGaXcKG4z5P4KR
   sBDaWzvCbXUiXcP9to4j8o716bXI0inx
   SCuPKgJN6pAfwgoCy2Ech2U0DTfriL9q
   Sd14OpeUCugURrfuu47xRwMGB1U6OSzB
   SeSKZp3f2Lo9JAKP17WmkD2Nnl6I5knE
   SnF0df244Nioa8VK7fAC8dfc9jQpAx4Y
   Su9w1lri9UACf53cL1evAMKXVgI0nfqe
   tgHSfEXcbYCejWXfsWDO4VXXbqtTVcqS
   tVm8L7CmsGG0cox6GpzlkbQYl0Yavx6i
   ULGqvJWOAtmPYINByDHwD0r9Mlf5niGK
   UuNP4xguSOjcTHAzdtHBgm2eNz1Z5133
   VPlmPWbTDtWppKumxNRUeeXklDk5GpRx
   w6x5XtaoRWDqMCsYxgZIWuOKVdiGByAu
   wcX8FCnaWngvBoYa5LrRlDsfRrr3C4kv
   Wr4hWlUhGCKJpGDCeio8C1pLVt7DZm3X
   WVQJq1JYFGgtR69JgWxUAKPb0RaKc90J
   xEkmXBLggW8r1alEgwNX6ZIM6GGCsfmF
   YbfaJNckJrgh9TvEBScUaEUCRhDJcgIL
   ylbAYB5vBiEAmViEQOBwITUwjSZkwC7Q
   ysKmfYcysVfnViisRBcXzgjjXMDgnKKv
   YZMapJFORxWg84gej4UzQvGYSqBmsPOo
   Z6SdYkOf5loRVj4uRk6cNiz10RfPnwNy
   zokSjnkcDj1hdGEBE4feukfCtFmv82ZZ
   ```

3. **Contar repeticiones de cada línea:**

    ```bash
   sort data.txt | uniq -c
   ```

   ```bash
   sort data.txt | uniq -c
   10 0BKVRLEJQcpNx8wnSPxDLFnFKlQafKK6
   10 0eJPctF8gK96ykGBBaKydhJgxSpTlJtz
   10 0kJ7XHD4gVtNSZIpqyP1V45sfz9OBLFo
   10 0lPOvKhpHZebxji0gdjtGCd5GWiZnNBj
   10 0REUhKk0yMqQOwei6NK9ZqIpE5dVlWWM
   10 1jfUH1m4XCjr7eWAeleGdaNSxFXRtX0l
   10 1VKPEkd0bCtIRwMFVQfY7InulwOFyDsn
   10 2u8fvAzvnaFlvQG3iPt4Wc1TFhPcGxhH
   10 35l6mr3f6TvlJyDwU6aUgJX07cLhr6t9
   10 3FIgajXBiaQAiTMVGo1gxRDSiACNyvvJ
   10 3mNA2le0gfURQKNHVIhGkMNLqLwjyyLN
   1 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
   10 4P8FsHcdr7d5WKnPtAaXY5SslKICd2gL
   10 5EmwMKZHwF6Lwq5jHUaDlfFJBeHbcX0b
   10 5hYz0028e1Q2TrtPVz5GZbpMzZNjebhh
   10 5I2jWpqjtVp576xXI2TLh1UCyXJtGQ78
   10 6Boy6esAjnIxCYn8uI6KZ7VD7zysDM8i
   10 7cP8ssLElERHXqOJc9T84bxsmJBjNXk2
   10 7qHmEo1FEbzthgyNpKc38YofXjYKZv18
   10 8FCtUQlFXsJnNeyiDY5KfE3vRy6sZFEJ
   10 8pePxslMzXqA2mi87wFjxd44qDRdrPiW
   10 9jfKbKGp40LjMuiiH9cce4bUo9y8nd0j
   10 9PqZLdu143n5djN9mL1MCamrmHERuV7k
   10 9Tar2wcD3Urge6s2yp18CAE8zX1poUwV
   10 A4MixXbxP5t0RE87qkmAdwwPJO3Aw6rO
   10 aFStfHbnQdPWqyRHEzhqe91Wch4O8xHJ
   10 aMKlTMrptUxxTypCHocCTrqYRkR2gT8h
   10 AOz67fZdaabu2QQyatGXK1dXNUIuyuOD
   10 BIAd2jxKMFmitEvp0WmsM0oDAwj4WSUa
   10 BmwX4bYhJXyImwt4AVHr7wFyLYCn4IIs
   10 BooZo7QXA1Tft7d6zbVkgJiGoJzuBTXS
   10 ByBO7V0FaYWN1cqIFbNss21xmjf9VNBP
   10 CgUjZiluCoMEvzNAge1Nbv3g9tpLQQj2
   10 CgvfWFmg5yxx12D2SZvjzaakG0JIyg7B
   10 cOk5XehQn4Uoz1z255BqS8y74pthqBeC
   10 dPk8jhZUckmUiDsn4fXE28LpV5VTvev7
   10 DShzsMw0ejGwWSFIlvAybLwBLKX6qVfF
   10 EgKFNgP4k1pMfGdrWRSiDIvSlAC0Tr42
   10 EtevhzigGTVT4NbybBWK5DNXnPt2D5AM
   10 fmt1Bzwt8Yw0t0cBVine7zuwyS76iJ7N
   10 fSbQqHX7C5Er4WmMSlQ9jkl05sXYQgJU
   10 ft7OpREehafXGOiX8EtyzEqXU8f3KRug
   10 GCaJbpW4K28ukFR84YhZFY6e7MvAOwpX
   10 GW8cRcKbnz53MAPYECx99O0T8POlPIFk
   10 hevU1VzF39ZyhyYkCBgmVrY6DbiRt2t5
   10 HloFLs5IpuFLuVJugBxKEipr5QaObJMk
   10 iGmmKP7APsDfPxrZjCL7eDpGEWR3ot3q
   10 IkJadTScIdBQY9a4KVjBEHyXKubCxSlx
   10 JaFwKSH0hiff1XRuxVYCzjjtibV9P3zF
   10 JQx6RCcNbAesB2lehrUl821WnJPI5gHW
   10 K8GxBwF1vxLQB5PaqlcCGfRniemRScj4
   10 kgf5CWCm26sycUzaAJRP7e6hYKVwu7Y4
   10 KhRNo5JlbDhxbBqCGIokXqBm54v7Wunm
   10 KqpxKPY3yIDdEVewIwuetpV0WvGIsN5U
   10 KZJOZECxhLxDhxDbGzdNy8m0uplzvP11
   10 L2iewY0lmIRR6arfrwWA3VhttgbJ0NIn
   10 mMD5Z4y1rRh07rmVRw2HfgcMegbKH0c0
   10 mUNISmDjtb3h6xAt3wGRVTY9U0r2u9bR
   10 noa4sUvodI8D733ugvy2OAlttHdjMPWJ
   10 o44oO4jbyPqoQQYX16586yC7Os2uz3ks
   10 omBfcRI91Zm06GI0RLngq05AMwe8Ndqo
   10 PHE4soLmy3nZfNOlX3jB8LYKYZRXuTah
   10 pij5cPffIOml4tkDCOwo7M2zyxImYJWm
   10 PLsGPuNgYzI8YNu2Y7h4D4vz1nHPSuNl
   10 pngaDVKjQWnWHOOUze15L3QpwqKme5M9
   10 PRerp5EfTVxJHKuCZDXfAfRyCQSdPjMi
   10 prq3SdTnv0vUMlcfcb4yvkl6GAXvtwWE
   10 q3dcRUh6vecqwa2ahKdvwWJDon3qA1Xe
   10 qEi18Iw0qI0fe3fGMr6tTPpL6SbPMjk3
   10 QPVchwY9MCJJ1W6kCWMncGWK2YfcUlFE
   10 QQozajTq9wdmrO8AMwcL1i4EG0DA3I3a
   10 QWumJVhaTjgcTVU6PILDgf5nPauD4VMm
   10 RAM7lFRXtvR3BlgtbRU3dz5UxZYQQ06I
   10 RAp5mFyjEBVSRTU203Y4Q1RDSlj7hN1v
   10 rENclsy8XIuTnTvJfXagTFpcd78FX8WM
   10 rhquEZ5rMuUSRIxtG9DQ6KVOyqPpL0MP
   10 RpRE5maDwMQTa8oJt7vVNqff7ElrjLTq
   10 s8SnoFuk0jR1CTdQ7pctd67nakJWN2Vc
   10 sapgezVFdEYdD3IkqFZGaXcKG4z5P4KR
   10 sBDaWzvCbXUiXcP9to4j8o716bXI0inx
   10 SCuPKgJN6pAfwgoCy2Ech2U0DTfriL9q
   10 Sd14OpeUCugURrfuu47xRwMGB1U6OSzB
   10 SeSKZp3f2Lo9JAKP17WmkD2Nnl6I5knE
   10 SnF0df244Nioa8VK7fAC8dfc9jQpAx4Y
   10 Su9w1lri9UACf53cL1evAMKXVgI0nfqe
   10 tgHSfEXcbYCejWXfsWDO4VXXbqtTVcqS
   10 tVm8L7CmsGG0cox6GpzlkbQYl0Yavx6i
   10 ULGqvJWOAtmPYINByDHwD0r9Mlf5niGK
   10 UuNP4xguSOjcTHAzdtHBgm2eNz1Z5133
   10 VPlmPWbTDtWppKumxNRUeeXklDk5GpRx
   10 w6x5XtaoRWDqMCsYxgZIWuOKVdiGByAu
   10 wcX8FCnaWngvBoYa5LrRlDsfRrr3C4kv
   10 Wr4hWlUhGCKJpGDCeio8C1pLVt7DZm3X
   10 WVQJq1JYFGgtR69JgWxUAKPb0RaKc90J
   10 xEkmXBLggW8r1alEgwNX6ZIM6GGCsfmF
   10 YbfaJNckJrgh9TvEBScUaEUCRhDJcgIL
   10 ylbAYB5vBiEAmViEQOBwITUwjSZkwC7Q
   10 ysKmfYcysVfnViisRBcXzgjjXMDgnKKv
   10 YZMapJFORxWg84gej4UzQvGYSqBmsPOo
   10 Z6SdYkOf5loRVj4uRk6cNiz10RfPnwNy
   10 zokSjnkcDj1hdGEBE4feukfCtFmv82ZZ
   ```

```bash
uniq --help
Usage: uniq [OPTION]... [INPUT [OUTPUT]]
Filter adjacent matching lines from INPUT (or standard input),
writing to OUTPUT (or standard output).

With no options, matching lines are merged to the first occurrence.

Mandatory arguments to long options are mandatory for short options too.
  -c, --count           prefix lines by the number of occurrences
  -d, --repeated        only print duplicate lines, one for each group
  -D                    print all duplicate lines
      --all-repeated[=METHOD]  like -D, but allow separating groups
                                 with an empty line;
                                 METHOD={none(default),prepend,separate}
  -f, --skip-fields=N   avoid comparing the first N fields
      --group[=METHOD]  show all items, separating groups with an empty line;
                          METHOD={separate(default),prepend,append,both}
  -i, --ignore-case     ignore differences in case when comparing
  -s, --skip-chars=N    avoid comparing the first N characters
  -u, --unique          only print unique lines
  -z, --zero-terminated     line delimiter is NUL, not newline
  -w, --check-chars=N   compare no more than N characters in lines
      --help        display this help and exit
      --version     output version information and exit

A field is a run of blanks (usually spaces and/or TABs), then non-blank
characters.  Fields are skipped before chars.

Note: 'uniq' does not detect repeated lines unless they are adjacent.
You may want to sort the input first, or use 'sort -u' without 'uniq'.

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation <https://www.gnu.org/software/coreutils/uniq>
or available locally via: info '(coreutils) uniq invocation'
```
