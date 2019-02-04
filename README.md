# make run
docker run -itd --rm \
	--name=frontend-vscode) \
	-h frontend-vscode \
	-e CODEPATH="`pwd | sed "s,^/home/${USER},/home/developer,"`" \
	-e USERID=`id -u` \
	-e USERNAME=${USER} \
	-e DISPLAY \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /usr/share/icons:/usr/share/icons:ro \
	-v frontend-vscode_custom:/custom \
	-v ${HOME}:/home/developer \
	vagnersx/frontend-vscode

# make run-dev
docker run -itd --rm \
	--name=vagnersx_frontend-vscode \
	-h vagnersx_frontend-vscode \
	-e CODEPATH="`pwd | sed "s,^/home/${USER},/home/developer/${USER},"`" \
	-e USERID=`id -u` \
	-e USERNAME=${USER} \
	-e DISPLAY \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /usr/share/icons:/usr/share/icons:ro \
	-v vagnersx_frontend-vscode_custom:/custom \
	-v vagnersx_frontend-vscode_home_developer:/home/developer/ \
	-v ${HOME}:/home/developer/${USER} \
	vagnersx/frontend-vscode