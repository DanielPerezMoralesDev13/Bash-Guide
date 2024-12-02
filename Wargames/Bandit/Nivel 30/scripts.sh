#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: 4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7
ssh bandit29@bandit.labs.overthewire.org -p 2220

cd $(mktemp -d)
GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit29-git@localhost/home/bandit29-git/repo

cd repo/

ls

cat README.md

git branch -r

git log -p

git log --oneline --color=always --abbrev-commit --binary --all --stat

git checkout 081ac38

cat README.md

cat README.md | grep -iEw "password*" | rev | awk '{print $1}' | rev


# Password: qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL
ssh bandit30@bandit.labs.overthewire.org -p 2220
