# auto-reload-nginx

Docker image for auto-reloading nginx. It is based on the 1.20.2 version of nginx.


Build:

```
👉 docker build -t prezesp/auto-reload-nginx .
```

Run:

```
👉 docker run -p 9999:80 -v ${PWD}/sites-enabled:/etc/nginx/sites-enabled prezesp/auto-reload-nginx
```