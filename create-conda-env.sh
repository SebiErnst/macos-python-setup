#!/bin/bash

if [ -z "$1" ]
then 
	PYTHON_PACKAGE="python"
	ENV_NAME="python"
else
	PYTHON_PACKAGE="python=$1"
	NAME_SUFFIX=`echo $1 | sed 's/\.//g'`
	ENV_NAME="py$NAME_SUFFIX"
fi
echo $PYTHON_PACKAGE
echo $ENV_NAME

source /opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh

conda env remove -n $ENV_NAME
conda create -y -n $ENV_NAME $PYTHON_PACKAGE $(<packages.txt)
conda activate $ENV_NAME
conda install -y -c apple -n ml tensorflow-deps
python -m pip install tensorflow-macos
python -m pip install tensorflow-metal
