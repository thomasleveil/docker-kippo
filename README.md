# docker-kippo


Dockerfile building an image with [kippo](https://github.com/desaster/kippo) ssh honeypot ready to go

By Default, Kippo will listen on port 2222

# Running

```bash
    docker run -d -p 2222:2222 tomdesinto/kippo
```
## with make

```bash
    make run
```

The container will map port 2222. Change this in the `Makefile`.

Use `docker logs` to read kippo log

## Building

```bash
  git clone https://github.com/thomasleveil/docker-kippo.git
	cd docker-kippo
	make build
```

# Other

```bash
    make shell
```

Will run the container and present you with a shell.
