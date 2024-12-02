#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN
ssh bandit28@bandit.labs.overthewire.org -p 2220

cd $(mktemp -d)
GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit28-git@localhost/home/bandit28-git/repo

ls -l

cd repo/

git log --oneline --all --color=auto --summary --binary --abbrev-commit

git checkout 3621de8

cat README.md | tail -n 2 | head -n 1 | awk 'NF{print $NF}'

exit

# Password: 4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7
ssh bandit29@bandit.labs.overthewire.org -p 2220
