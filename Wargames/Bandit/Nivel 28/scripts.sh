#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB
ssh bandit27@bandit.labs.overthewire.org -p 2220

cd $(mktemp -d)
GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit27-git@localhost/home/bandit27-git/repo

ls repo/

cat repo/README

cat repo/README | awk 'NF{print $NF}'

# Password: Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN
ssh bandit28@bandit.labs.overthewire.org -p 2220
