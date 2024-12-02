#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
ssh bandit5@bandit.labs.overthewire.org -p 2220

whoami

find . -type f -readable ! -executable -size 1033c | xargs cat

exit

# Password: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
ssh bandit6@bandit.labs.overthewire.org -p 2220


