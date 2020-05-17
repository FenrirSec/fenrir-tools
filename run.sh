#!/bin/sh

if [ $# -eq 0 ];then
    docker run --rm -v /home/lp1/Tools/:/tools --name fenrir-tools -it fenrir-tools
else
    docker run --rm -v /home/lp1/Tools/:/tools -v $1:/shared --name fenrir-tools -it fenrir-toosl
fi
