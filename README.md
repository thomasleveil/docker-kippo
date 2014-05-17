docker-kippo
============

Dockerfile building an image with kippo ready to go

Kippo will listen on port 2222



Building
--------

    git clone https://github.com/thomasleveil/docker-kippo.git
	cd docker-kippo
	make build
	
	
	
Running
-------

    make run
	
The container will map port 2222. Change this in the `Makefile`.

Use `docker logs` to read kippo log
	
	
Other
-----

    make shell
	
Will run the container and present you with a shell.