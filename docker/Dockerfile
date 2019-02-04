FROM ubuntu:18.04
LABEL maintainer "Vagner dos Santos Xavier <vagner.xavier@serpro.gov.br>"

ARG VSCODE_VERSION="1.30.1-1545156774"
ARG CONTAINER_USERNAME="developer"

ENV CONTAINER_USERNAME $CONTAINER_USERNAME
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Instalando vscode e suas dependencias
RUN apt update -qq && apt install -y --no-install-recommends curl gnupg ca-certificates
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && rm -f microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt update -qq && apt install -y --no-install-recommends libcanberra-gtk-module \
    libcanberra-gtk3-module libxss1 libgconf-2.4 \
    libnss3-dev libxtst6 \
    code=$VSCODE_VERSION
# Customizacoes no vscode
RUN mkdir -p /custom/config /custom/extensions
RUN code --install-extension formulahendry.terminal      --user-data-dir /custom/config --extensions-dir /custom/extensions
RUN code --install-extension peterjausovec.vscode-docker --user-data-dir /custom/config --extensions-dir /custom/extensions
COPY ./custom/settings.json /custom/config/User/settings.json
RUN chmod -R 777 /custom

# Permite teclado digitar cedilha no terminal
RUN apt install -y locales && locale-gen en_US.UTF-8

# Instalação de outros softwares necessarios
RUN apt install -y git

# Cria usuario do container
RUN useradd -m -s /bin/bash ${CONTAINER_USERNAME}
RUN apt update -qq && apt install sudo
RUN echo "${CONTAINER_USERNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${CONTAINER_USERNAME}

# Comandos de inicializacao do container
COPY command.sh /usr/local/bin/
RUN  chmod   +x /usr/local/bin/command.sh
CMD ["command.sh"]
