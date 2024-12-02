#!/usr/bin/env python3

"""
Redireccion Del Stdin A Un Archivo Y Ejecutar El Script
"""

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

from sys import exit, stdout

def main(name: str) -> str:
    """
    Esta función recibe un nombre y lo devuelve en un mensaje
    """
    return "My name is {nombre}".format(nombre=name)


if __name__ == "__main__":
    print(main(name=input("Ingresa tu nombre: ")), end="\n", file=stdout)
    exit(0)
