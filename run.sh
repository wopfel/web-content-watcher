#!/bin/bash

cd /wcw
while true ; do echo "[$(date)] Running command now..." ; ./wcw ; sleep 1h ; sleep $(shuf -i 700-1000 -n 1) ; done

