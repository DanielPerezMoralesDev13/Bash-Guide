#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
ssh bandit4@bandit.labs.overthewire.org -p 2220

whoami

find ./inhere/ -type f -name *file* | xargs file | grep -iF "text" | awk '{print $1}' | tr -d ':' | xargs cat

exit

# Password: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
ssh bandit5@bandit.labs.overthewire.org -p 2220
