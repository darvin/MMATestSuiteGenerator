#!/bin/bash

/usr/bin/Xvfb -ac :0 -screen 0 1024x768x24 > /dev/null 2>&1  &
sleep 2

echo "DOCKER > $@"
export DISPLAY=:0

exec "$@"