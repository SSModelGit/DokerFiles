#!/bin/bash

alias ca-start='docker run -it --network=host --privileged -e DISPLAY=$DISPLAY -e QT_GRAPHICSSYSTEM=native -e HOME=/home/comparch --workdir=/home/comparch/volumes -v caV:/home/comparch/volumes -v "/home/$USER/:/home/comparch/host/:rw" -v "/media/$USER/:/media/$USER/:rw" -v "/dev/:/dev/:rw" -v "/tmp/.X11-unix:/tmp/.X11-unix" -v "/etc/timezone:/etc/timezone" --name=ca-work-20 sswaminathan235/olin:comparch'

alias ca-run='docker start -ai ca-work-20'
alias ca-join='docker exec -it ca-work-20 bash'
