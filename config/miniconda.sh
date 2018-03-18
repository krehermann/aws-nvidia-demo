#!/bin/bash
MINI_CONDA_HOME=/disk1/apps/conda/miniconda
echo "MINI_CONDA_HOME $MINI_CONDA_HOME"
 if [ -d $MINI_CONDA_HOME ]; then
     rm -rf $MINI_CONDA_HOME
 fi
wget https://repo.continuum.io/miniconda/Miniconda3-4.3.31-Linux-x86_64.sh -O /tmp/miniconda.sh
#wget http://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh -O ~/miniconda.sh
bash /tmp/miniconda.sh -b -p ${MINI_CONDA_HOME}
export PATH=${MINI_CONDA_HOME}/bin:$PATH
which conda
# tensorflow doesn't like 3.6 [03-15-2018]
conda create --yes -n mini-nvidia-demo python=3.5

source ${MINI_CONDA_HOME}/bin/activate mini-nvidia-demo
conda install --yes -c conda-forge tensorflow
conda install --yes -c conda-forge opencv
conda install --yes -c conda-forge boto3
conda update pip
conda install --yes -c anaconda scikit-image
# tensorflow panda clash [03-15-2018]
# https://github.com/tflearn/tflearn/issues/766
conda update --yes -c conda-forge dask

pip install imutils

# horovod
sudo apt install -y openmpi-bin openmpi-common libopenmpi-dev openssh-client openssh-server libopenmpi1.10
pip install horovod
