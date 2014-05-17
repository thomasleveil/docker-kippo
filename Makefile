.PHONY: build shell run

SSH_PORT := 2222
DOCKER_IMAGE := kippo

build:
	docker build --rm --tag "$(DOCKER_IMAGE)" .
	
shell:
	docker run --rm --tty --interactive --publish $(SSH_PORT):2222 "$(DOCKER_IMAGE)" /bin/bash -l
	
run:
	docker run --detach --publish $(SSH_PORT):2222 "$(DOCKER_IMAGE)"