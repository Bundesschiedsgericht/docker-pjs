#!/bin/bash

docker stop piratejusticestatus
docker rm piratejusticestatus
docker run -d \
-v /srv/piratejusticestatus/config.xml:/etc/piratejusticestatus.xml \
-p 127.0.0.1:8086:8888 \
--name piratejusticestatus \
exception/piratejusticestatus $1
