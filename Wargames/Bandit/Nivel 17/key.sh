#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

list=($(nmap --open -T5 -vvv -n -p31000-32000 127.0.0.1 | grep -Eo '^[0-9]+/tcp' | cut -d'/' -f1))
password=$(cat /etc/bandit_pass/bandit16)
ok="False"

for port in "${list[@]}"; do
    echo -e "\n[*] Probing port: $port"
    result=$(echo "$password" | openssl s_client -connect 127.0.0.1:$port -ign_eof 2>/dev/null | awk '/-----BEGIN RSA PRIVATE KEY-----/,/-----END RSA PRIVATE KEY-----/')

    if [ -z "$result" ]; then
        echo "[x] Port Incorrect"
        continue
    fi

    echo "$result"
    ok="True"
    break

done

if [ "$ok" == "True" ]; then
    echo "[+] Key found. Exiting."
    exit 0
else
    echo "[x] No key found. Exiting."
    exit 1
fi