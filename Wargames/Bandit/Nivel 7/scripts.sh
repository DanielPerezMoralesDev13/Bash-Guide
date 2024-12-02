#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
ssh bandit6@bandit.labs.overthewire.org -p 2220

whoami

find / -user bandit7 -group bandit6 -size 33c 2>/dev/null | xargs cat

exit

# Password: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
ssh bandit7@bandit.labs.overthewire.org -p 2220

