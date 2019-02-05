# make run
<pre>
Docker version 18.06.1-ce
--ipc host:  evita erro 'BadShmSeg (invalid shared segment parameter)'

docker run -itd --rm \
	--name=vagnersx_frontend-vscode \
	--ipc host \
	-h vagnersx_frontend-vscode \
	-e CODEPATH="`pwd | sed "s,^/home/${USER},/home/developer/${USER},"`" \
	-e USERID=`id -u` \
	-e DISPLAY \
	-v vagnersx_frontend-vscode:/home/developer/ \
	-v ${HOME}:/home/developer/${USER} \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /usr/share/icons:/usr/share/icons:ro \
	vagnersx/frontend-vscode
</pre>

# clean
<pre>
docker run -it --rm \
	--name=vagnersx_frontend-vscode \
	--ipc host \
	-h vagnersx_frontend-vscode \
	-e CODEPATH="/home/developer" \
	-e USERID=`id -u` \
	-e DISPLAY \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	vagnersx/frontend-vscode
</pre>



