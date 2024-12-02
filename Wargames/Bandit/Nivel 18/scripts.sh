#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: EReVavePLFHtFlFsjn3hyzMlvSuSAcRD
ssh bandit17@bandit.labs.overthewire.org -p 2220

whoami

diff passwords.old passwords.new | tail -n 1 | awk 'NF{print $2}'

exit

# Password: x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
ssh bandit18@bandit.labs.overthewire.org -p 2220