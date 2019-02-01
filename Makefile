default: build

IMAGE_NAME=vagnersx/frontend-vscode
CONTAINER_NAME=`echo $(IMAGE_NAME) | sed 's/\//_/'`

build: ./docker/Dockerfile
	docker build -t $(IMAGE_NAME) ./docker

run:
	docker run -itd --rm \
	--name=$(CONTAINER_NAME) \
	-h $(CONTAINER_NAME) \
	-e CODEPATH="${PWD}" \
	-e USERID=`id -u` \
	-e USERNAME=`id -un` \
	-e DISPLAY \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /usr/share/icons:/usr/share/icons:ro \
	-v $(CONTAINER_NAME):/home/developer/ \
	-v ${HOME}:${HOME} \
	$(IMAGE_NAME)