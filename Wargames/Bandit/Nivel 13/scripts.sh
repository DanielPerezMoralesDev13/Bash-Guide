#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
ssh bandit12@bandit.labs.overthewire.org -p 2220

whoami

pathDirectory="/tmp/tmp.t6au34Dj2j"
pathComprimido="$pathDirectory/data.gzip"

while true; do
  nextComprimido=$(7z l $pathComprimido 2>/dev/null | grep -iFwA 2 "Name" | tail -n1 | awk 'NF{print $NF}')
  if ! [ -z $nextComprimido ]; then
    7z x $pathComprimido >/dev/null 2>&1 && pathComprimido="$pathDirectory/$nextComprimido"
    continue
  fi

  awk 'NF{print $NF}' $pathComprimido | xclip -selection clipboard
  echo "[] Ya no hay mas ficheros que descomprimir"
  exit 1

done

exit

# Password: FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn
ssh bandit13@bandit.labs.overthewire.org -p 2220
