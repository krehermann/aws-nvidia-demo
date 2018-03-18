
sudo apt install awscli emacs gcc git unzip

# ================
# Docker:
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository
# ================
sudo apt-get remove -y docker docker-engine docker.io 
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
         software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-get update
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce=17.12.1~ce-0~ubuntu
sudo docker run hello-world


# ===============
# Nvidia Docker
# https://github.com/NVIDIA/nvidia-docker
# ===============
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
    sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
    sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

sudo apt install -y nvidia-docker2
sudo pkill -SIGHUP dockerd
# Test nvidia-smi with the latest official CUDA image
docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi


wget http://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh -O ~/miniconda.sh
MINI_CONDA_HOME=/disk1/apps/minicoda
bash ~/miniconda.sh -b -p ${MINI_CONDA_HOME}
export PATH="${MINI_CONDA_HOME}/bin:$PATH"
conda-env-create demo
source ${MINI_CONDA_HOME}/bin/activate demo
conda install -c conda-forge tensorflow
conda install -c conda-forge opencv
conda install -c conda-forge boto3

pip install imutils
pip install horovod



