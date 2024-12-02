#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: iCi86ttT4KSNe1armKiwbQNmB3YJP3q4
ssh bandit25@bandit.labs.overthewire.org -p 2220

# Consultamos las shells asignadas tanto a nuestro usuario como al usuario bandit26.
cat /etc/passwd | grep -iEw "^bandit26|^$(whoami)"

cat /etc/passwd | grep -iEw "^bandit26" | rev | cut -d ':' -f 1 | rev

cat $(!!)

cat $(cat /etc/passwd | grep -iEw "^bandit26" | rev | cut -d ':' -f 1 | rev)

# Con tmux, minimizamos el panel de la terminal para continuar con el proceso. 
# 1. Presiona la tecla `v` para entrar en el modo visual.  
# 2. Pulsa `:` para abrir la línea de comandos de `more` y luego escribe:  
:e /etc/bandit_pass/bandit26
# 3. Al ejecutar el comando, se mostrará el contenido del archivo, revelando la contraseña.

# Password: s0773xxkk0MXfdqOfPRVr9L3jJBUOgCZ
ssh bandit26@bandit.labs.overthewire.org -p 2220
