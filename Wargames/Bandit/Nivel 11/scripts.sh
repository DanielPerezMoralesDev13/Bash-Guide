#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
ssh bandit10@bandit.labs.overthewire.org -p 2220

whoami

base64 -d data.txt | tr ' ' '\n' | tail -n 1

exit

# Password: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
ssh bandit11@bandit.labs.overthewire.org -p 2220
