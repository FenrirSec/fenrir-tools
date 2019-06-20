#!/bin/sh
docker run --rm -v /home/lp1/Tools/:/tools -v $1:/shared --name fenrir-tools -it fenrir-tools
