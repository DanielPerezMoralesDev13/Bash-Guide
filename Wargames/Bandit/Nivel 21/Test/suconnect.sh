#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

if [ -z "$1" ]; then
  echo "Usage: $0 <portnumber>"
  exit 1
fi

PASSWORD="0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO" # Contraseña esperada
PORT=$1

echo "Connecting to localhost on port $PORT..."

exec 3<>/dev/tcp/localhost/$PORT # Abre una conexión TCP

while true; do
  # Leer línea del servidor
  read -r INPUT <&3
  echo "Read: $INPUT"

  # Verificar la contraseña
  if [ "$INPUT" == "$PASSWORD" ]; then
    echo "Password matches, sending next password"
    echo "EeoULMCra2q0dSkYj561DX7s1CpBuOBt" >&3 # Envía la nueva contraseña
    break
  else
    echo "Password incorrect"
  fi
done

exec 3>&- # Cierra la conexión
