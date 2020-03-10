#!/bin/bash

# note:
# ttyACM0 has to be owned by GID 20
# sudo groupadd -g 20 dialout
# sudo chgrp dialout /dev/ttyACM0
docker run \
    -e TZ=Europe/Berlin \
    -v /tmp/data:/home/node/.mozilla-iot \
    --network="host" \
    --name webthings-gateway \
    --device /dev/ttyACM0:/dev/ttyACM0 \
    mozillaiot/gateway:arm

