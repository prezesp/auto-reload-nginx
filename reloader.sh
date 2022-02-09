#!/bin/bash

RESULT=$(ls -1 /etc/nginx/sites-enabled)
printf "Actual sites:\n$RESULT\n"

while true
do
  inotifywait --exclude .swp -e create -e modify -e delete -e move /etc/nginx/sites-enabled
  nginx -t
  if [ $? -eq 0 ]
  then
    echo "Detected Nginx Configuration Change"
    echo "Executing: nginx -s reload"
    
    nginx -s reload

    RESULT=$(ls -1 /etc/nginx/sites-enabled)
    printf "Actual sites:\n$RESULT\n"
  fi
done