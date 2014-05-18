docker-kippo
============

Dockerfile building an image with kippo ready to go

Kippo will listen on port 2222



	
Running
-------

    docker run -d -p 2222:2222 tomdesinto/kippo



### with make

    make run
	
The container will map port 2222. Change this in the `Makefile`.

Use `docker logs` to read kippo log
	
	
	
	
Building
--------

    git clone https://github.com/thomasleveil/docker-kippo.git
	cd docker-kippo
	make build
	
	
	
Other
-----

    make shell
	
Will run the container and present you with a shell.
