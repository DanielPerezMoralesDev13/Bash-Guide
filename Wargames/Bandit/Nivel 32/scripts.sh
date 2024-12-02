#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy
ssh bandit31@bandit.labs.overthewire.org -p 2220

cat .gitconfig

cd $(mktemp -d)

GIT_SSH_COMMAND="ssh -p 2220" git clone ssh://bandit31-git@localhost/home/bandit31-git/repo

cd repo

cat README.md

touch key.txt

echo "May I come in?" > key.txt

git branch -r

git add key.txt --verbose --all .

git add key.txt --force || git add key.txt -f

git status

git commit --message="Añadiendo file key.txt" --verbose --verify --all

GIT_SSH_COMMAND="ssh -p 2220" git push --set-upstream origin master --verbose --verify

# Password: 3O9RfhqyAlVBEZpVb6LYStshZoqoSx5K
ssh bandit32@bandit.labs.overthewire.org -p 2220