#!/bin/bash

# remove "dbind-WARNING"
export NO_AT_BRIDGE=1 

# Altera usuario e cria mapeamento para host home
usermod -u $USERID $CONTAINER_USERNAME 

# Executa vscode
su $CONTAINER_USERNAME -c '/usr/share/code/code "$CODEPATH"'