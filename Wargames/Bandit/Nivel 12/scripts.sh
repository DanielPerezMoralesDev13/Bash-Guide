#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
ssh bandit11@bandit.labs.overthewire.org -p 2220

whoami

cat data.txt | tr '[G-ZA-Fg-za-f]' '[T-ZA-St-za-s]' | awk 'NF{print $NF}'

exit

# Password: 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
ssh bandit12@bandit.labs.overthewire.org -p 2220