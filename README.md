# Kippo

[![](https://images.microbadger.com/badges/image/tomdesinto/kippo.svg)](https://microbadger.com/images/tomdesinto/kippo "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/tomdesinto/kippo.svg)](https://microbadger.com/images/tomdesinto/kippo "Get your own version badge on microbadger.com")

SSH Honeypot


Docker image running [Kippo](https://github.com/desaster/kippo) SSH honeypot.

By Default, Kippo will listen on port 2222



# Running

```bash
docker run -d -p 2222:2222 tomdesinto/kippo
```

Use `docker logs -f kippo` to read kippo log



## Building

```bash
docker build -t kippo https://github.com/thomasleveil/docker-kippo.git
```
