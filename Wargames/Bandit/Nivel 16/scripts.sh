#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
ssh bandit15@bandit.labs.overthewire.org -p 2220

whoami

echo "8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo" | openssl s_client -connect localhost:30001 -ign_eof
openssl s_client -connect localhost:30001 -ign_eof </etc/bandit_pass/bandit15


exit

# Password: kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
ssh bandit16@bandit.labs.overthewire.org -p 2220
