#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q
ssh bandit22@bandit.labs.overthewire.org -p 2220

cat /tmp/$(echo "I am user bandit23" | md5sum | cut -d ' ' -f 1)

exit

# Password: 0Zf11ioIjMVN551jX3CmStKLYqjk54Ga
ssh bandit23@bandit.labs.overthewire.org -p 2220