#!/bin/bash

XSOCK=/tmp/.X11-unix
XAUTH=/root/.Xauthority

docker run --rm -it \
    --gpus all \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -e XAUTHORITY=$XAUTH \
    -v $XSOCK:$XSOCK \
    -v $HOME/.Xauthority:$XAUTH \
    --shm-size="20g" \
    --volume="$PWD:/root/PCL" \
    --network=host \
    -w /root/PCL \
    kakalin/pcl:1.8.0