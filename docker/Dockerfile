FROM ubuntu:18.04
LABEL maintainer "Vagner dos Santos Xavier <vagner.xavier@serpro.gov.br>"

ARG VSCODE_VERSION="1.30.1-1545156774"

ENV CONTAINER_USERNAME developer
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Cria usuario do container
RUN useradd -m -s /bin/bash ${CONTAINER_USERNAME}
RUN apt update -qq && apt install sudo
RUN echo "${CONTAINER_USERNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${CONTAINER_USERNAME}

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
RUN su ${CONTAINER_USERNAME} -c "code --install-extension formulahendry.terminal"
RUN su ${CONTAINER_USERNAME} -c "code --install-extension peterjausovec.vscode-docker"
COPY ./custom/settings.json /home/${CONTAINER_USERNAME}/.config/Code/User/settings.json
RUN  chown ${CONTAINER_USERNAME}:${CONTAINER_USERNAME} /home/${CONTAINER_USERNAME}/.config/Code/User/settings.json

# Comandos de inicializacao do container
COPY command.sh /usr/local/bin/
RUN  chmod   +x /usr/local/bin/command.sh
CMD ["command.sh"]
