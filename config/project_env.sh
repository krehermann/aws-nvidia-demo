#!/bin/bash
if [ -z $DATA_MOUNT ]; then
    >2 echo "Error. DATA_MOUNT not defined"
    exit 1
fi
export PROJECT_ROOT=$DATA_MOUNT/apps/aws-nvidia-demo
