#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
ssh bandit14@bandit.labs.overthewire.org -p 2220

whoami

cat /etc/bandit_pass/bandit14 | nc localhost 30000

exit

# Password: 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
ssh bandit15@bandit.labs.overthewire.org -p 2220