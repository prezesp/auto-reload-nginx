FROM nginx:1.20.2-alpine

RUN apk add --no-cache inotify-tools bash

WORKDIR /etc/reloader
COPY reloader.sh .
RUN chmod +x reloader.sh

WORKDIR /etc/nginx/conf.d

CMD ["/bin/sh",  "-c",  "/etc/reloader/reloader.sh & exec nginx -g 'daemon off;'"]
