#!/bin/bash

cd /wcw
while true ; do echo "[$(date)] Running command now..." ; ./wcw ; sleep $(( 3600 + $(shuf -i 700-1000 -n 1) )) ; done

