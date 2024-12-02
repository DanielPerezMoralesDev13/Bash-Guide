#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
ssh bandit20@bandit.labs.overthewire.org -p 2220

file suconnect
./suconnect 5757
exit

# Nos Conectamos Nuevamente Por SSH
nc -nlvp 5757
# Colocar La Contraseña Del Usuario Actual
# Esta: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
# Salida: EeoULMCra2q0dSkYj561DX7s1CpBuOBt

exit

# Password: EeoULMCra2q0dSkYj561DX7s1CpBuOBt
ssh bandit21@bandit.labs.overthewire.org -p 2220