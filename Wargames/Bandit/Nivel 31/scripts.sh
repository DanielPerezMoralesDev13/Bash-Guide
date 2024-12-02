#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL
ssh bandit30@bandit.labs.overthewire.org -p 2220

cd $(mktemp -d)
GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit30-git@localhost/home/bandit30-git/repo

cd repo

cat README.md

git tag

git show $(!!)

git show $(git tag)

git show secret

exit

# Password: fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy
ssh bandit31@bandit.labs.overthewire.org -p 2220