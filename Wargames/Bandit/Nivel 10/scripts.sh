#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
ssh bandit9@bandit.labs.overthewire.org -p 2220

whoami

file data.txt

declare -i contador=1; strings data.txt | grep -iEw "=" --color=always | while read line; do echo "Linea $contador: $line"; let contador+=1; done | awk 'NR==6' | awk 'NF{print $NF}'

exit

# Password: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
ssh bandit10@bandit.labs.overthewire.org -p 2220
