<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Explicación de ROT13:**

- *[`https://rot13.com/`](https://rot13.com/ "https://rot13.com/")*
- *[`https://cryptii.com/`](https://cryptii.com/ "https://cryptii.com/")*

**ROT13** *es un cifrado simple basado en el alfabeto que rota cada letra 13 posiciones. Es una variante del cifrado César y se usa comúnmente para ofuscar texto, especialmente en foros o situaciones donde se quiere evitar revelar spoilers o palabras ofensivas sin un cifrado complejo.*

## **Funcionamiento del comando:**

```bash
echo "Yberz vcfhz qbybe fvg nzrg, pbafrpgrghe nqvcvfpvat ryvg. Frq qb rvhfzbq grzcbe vapvqvqhag hg ynober rg qbyber zntan nyvdhn. Hg ravz nq zvavz iravnz, dhvf abfgehq rkrepvgngvba hyynzpb ynobevf avfv hg nyvdhvc rk rn pbzzbqb pbafrdhng. Qhvf nhgr veher qbybe va erceruraqrevg va ibyhcgngr iryvg rffr pvyyhz qbyber rh shtvng ahyyn cnevnghe. Rkprcgrhe fvag bppnrpng phcvqngng aba cebvqrag, fhag va phycn dhv bssvpvn qrfrehag zbyyvg navz vq rfg ynobehz." | tr '[Y-ZA-Xy-za-x]' '[L-ZA-Kl-za-k]'
```

## **Desglose:**

1. **`echo "Yberz vcfhz qbybe fvg nzrg, pbafrpgrghe nqvcvfpvat ryvg. Frq qb rvhfzbq grzcbe vapvqvqhag hg ynober rg qbyber zntan nyvdhn. Hg ravz nq zvavz iravnz, dhvf abfgehq rkrepvgngvba hyynzpb ynobevf avfv hg nyvdhvc rk rn pbzzbqb pbafrdhng. Qhvf nhgr veher qbybe va erceruraqrevg va ibyhcgngr iryvg rffr pvyyhz qbyber rh shtvng ahyyn cnevnghe. Rkprcgrhe fvag bppnrpng phcvqngng aba cebvqrag, fhag va phycn dhv bssvpvn qrfrehag zbyyvg navz vq rfg ynobehz."`:**  
   - *Imprime el texto cifrado en ROT13.*

2. **`tr '[Y-ZA-Xy-za-x]' '[L-ZA-Kl-za-k]'`:**  
   - *Usa el comando `tr` (translate) para transformar las letras según el patrón especificado:*
   - **`[Y-ZA-Xy-za-x]`:** *Representa las letras cifradas en ROT13.*
   - **`[L-ZA-Kl-za-k]`:** *Rota las letras nuevamente 13 posiciones para obtener el texto original.*

- **Salida**

```bash
echo "Yberz vcfhz qbybe fvg nzrg, pbafrpgrghe nqvcvfpvat ryvg. Frq qb rvhfzbq grzcbe vapvqvqhag hg ynober rg qbyber zntan nyvdhn. Hg ravz nq zvavz iravnz, dhvf abfgehq rkrepvgngvba hyynzpb ynobevf avfv hg nyvdhvc rk rn pbzzbqb pbafrdhng. Qhvf nhgr veher qbybe va erceruraqrevg va ibyhcgngr iryvg rffr pvyyhz qbyber rh shtvng ahyyn cnevnghe. Rkprcgrhe fvag bppnrpng phcvqngng aba cebvqrag, fhag va phycn dhv bssvpvn qrfrehag zbyyvg navz vq rfg ynobehz." | tr '[Y-ZA-Xy-za-x]' '[L-ZA-Kl-za-k]'
```

```bash
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
```

### **Ejemplo:**

```bash
echo "Guvf vf n grfg zrffntr." | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'
```

**Resultado:**

```text
This is a test message.
```

### **Aplicaciones del ROT13:**

- *Ofuscar texto en correos electrónicos y foros.*
- *Codificar contenido para evitar spoilers.*
- *Ejercicios de práctica para cifrado y decodificación básicos.*
