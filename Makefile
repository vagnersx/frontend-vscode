default: build

IMAGE_NAME=vagnersx/frontend-vscode
CONTAINER_NAME=`echo $(IMAGE_NAME) | sed 's/[/:]/_/g'`

build: ./docker/Dockerfile
	docker build -t $(IMAGE_NAME) ./docker

# Executa com HOME compartilhada
run:
	docker run -itd --rm \
	--name=$(CONTAINER_NAME) \
	-h $(CONTAINER_NAME) \
	-e CODEPATH="`pwd | sed "s,^/home/${USER},/home/developer,"`" \
	-e USERID=`id -u` \
	-e USERNAME=${USER} \
	-e DISPLAY \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /usr/share/icons:/usr/share/icons:ro \
	-v $(CONTAINER_NAME)_custom:/custom \
	-v ${HOME}:/home/developer \
	$(IMAGE_NAME)

# Executa com HOME isolada
run-dev:
	docker run -itd --rm \
	--name=$(CONTAINER_NAME) \
	-h $(CONTAINER_NAME) \
	-e CODEPATH="`pwd | sed "s,^/home/${USER},/home/developer/${USER},"`" \
	-e USERID=`id -u` \
	-e USERNAME=${USER} \
	-e DISPLAY \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /usr/share/icons:/usr/share/icons:ro \
	-v $(CONTAINER_NAME)_custom:/custom \
	-v $(CONTAINER_NAME)_home_developer:/home/developer/ \
	-v ${HOME}:/home/developer/${USER} \
	$(IMAGE_NAME)