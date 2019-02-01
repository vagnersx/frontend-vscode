#!/bin/bash

# remove "dbind-WARNING"
export NO_AT_BRIDGE=1 

# Cria usuario e mapeamento para host home
usermod -u $USERID $CONTAINER_USERNAME
ln -s /home/$USERNAME /home/developer/$USERNAME
chown $CONTAINER_USERNAME:$CONTAINER_USERNAME /home/$USERNAME

# Executa vscode
su $CONTAINER_USERNAME -c '/usr/share/code/code "$CODEPATH"'