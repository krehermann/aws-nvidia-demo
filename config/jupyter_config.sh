#!/bin/bash
. aws_env.sh
. project_env.sh
. conda_env.sh
force=$1
for package in ipython jupyter libsodium; do
    echo "checking for package"
    conda list $package
    ret=$?
    echo "ret = $ret"
    if [[ $ret != 0 ]] || [[ ! -z $force ]]; then
	conda install --yes -c anaconda $package
    fi
done  

# Create a key
JUPYTER_DATA_DIR=$DATA_MOUNT/data/jupyter
echo "JUPYTER_DATA_DIR $JUPYTER_DATA_DIR"

# if [ ! -d ${JUPYTER_DATA_DIR}/ssl/cert.key ]; then
#     if [ ! -d $JUPYTER_DATA_DIR/ssl ]; then
# 	mkdir -p $JUPYTER_DATA_DIR/ssl
#     fi

#     cd $JUPYTER_DATA_DIR/ssl
#     sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout "cert.key" -out "cert.pem" -batch
#     sed -s "|__JUPYTER_DATA__|$JUPYTER_DATA|" ~/.jupyter/jupyter_notebook_config.py.template > ~/.jupyter/jupyter_notebook_config.py

# fi

JUPYTER_NOTEBOOK_ROOT=$PROJECT_ROOT/notebook
echo "Launching jupyter in $JUPYTER_NOTEBOOK_ROOT" 
cd ${JUPYTER_NOTEBOOK_ROOT}/demo
echo $pwd
jupyter notebook &
