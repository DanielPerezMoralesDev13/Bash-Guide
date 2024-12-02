#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
ssh bandit7@bandit.labs.overthewire.org -p 2220

whoami

grep -iF "millionth" data.txt | awk 'NF{print $NF}'

exit

# Password: dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
ssh bandit8@bandit.labs.overthewire.org -p 2220
