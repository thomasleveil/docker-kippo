# docker-kippo


Dockerfile building an image with [kippo](https://github.com/desaster/kippo) ssh honeypot ready to go.

By Default, Kippo will listen on port 2222

# Running

```bash
docker run -d -p 2222:2222 --name kippo tomdesinto/kippo
```

Use `docker logs -f kippo` to read kippo log

## Building

```bash
docker build -t kippo https://github.com/thomasleveil/docker-kippo.git
```
