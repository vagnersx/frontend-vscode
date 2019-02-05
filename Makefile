default: build

IMAGE_NAME=vagnersx/frontend-vscode
CONTAINER_NAME=`echo $(IMAGE_NAME) | sed 's/[/:]/_/g'`

build: ./docker/Dockerfile
	docker build -t $(IMAGE_NAME) --build-arg CONTAINER_USERNAME=developer ./docker

run:
	docker run -itd --rm \
	--name=$(CONTAINER_NAME) \
	--ipc host \
	-h $(CONTAINER_NAME) \
	-e CODEPATH="`pwd | sed "s,^/home/${USER},/home/developer/${USER},"`" \
	-e USERID=`id -u` \
	-e DISPLAY \
	-v $(CONTAINER_NAME):/home/developer/ \
	-v ${HOME}:/home/developer/${USER} \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /usr/share/icons:/usr/share/icons:ro \
	$(IMAGE_NAME)