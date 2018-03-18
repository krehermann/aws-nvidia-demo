#!/bin/bash
export MINI_CONDA_HOME=$DATA_MOUNT/apps/conda/miniconda
echo "MINI_CONDA_HOME $MINI_CONDA_HOME"
export PATH=$MINI_CONDA_HOME/bin:$PATH
source activate mini-nvidia-demo
