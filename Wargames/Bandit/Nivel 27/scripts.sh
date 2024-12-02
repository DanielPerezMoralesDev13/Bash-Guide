#!/usr/bin/env bash

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me 

# Password: s0773xxkk0MXfdqOfPRVr9L3jJBUOgCZ
ssh bandit26@bandit.labs.overthewire.org -p 2220

# Para este nivel, vamos a seguir el mismo procedimiento usando tmux. Minimizamos el panel para evitar que `more` interrumpa la visualización del contenido completo.
# Luego, dentro de `more`, presionamos `v` para entrar en el modo visual. A continuación, escribimos el siguiente comando para configurar la variable `shell` y cambiarla a bash:
# :set shell=/bin/bash

# Finalmente, presionamos Enter y ejecutamos el siguiente comando para abrir una sesión de shell interactiva:
# :shell

./bandit27-do bash -p

whoami

exit

./bandit27-do cat /etc/bandit_pass/bandit27

# Password: upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB
ssh bandit27@bandit.labs.overthewire.org -p 2220
