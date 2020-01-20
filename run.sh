#!/bin/bash

# This file is used by a Docker container
# It calls wcw in an endless loop

cd /data
while true ; do echo "[$(date)] Running command now..." ; /wcw ; sleep $(( 3600 + $(shuf -i 700-1000 -n 1) )) ; done

