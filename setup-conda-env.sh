#!/bin/bash

if [ -z "$1" ]
then 
	echo Using default configuration.
	PACKAGE_FILE="python.yml"
	ENV_NAME="python"
else
	PACKAGE_FILE=$1.yml
fi

if [ -z "$2" ]
then 
	ENV_NAME=$1
else
	ENV_NAME=$2
fi

echo Using package list file: $PACKAGE_FILE
echo Installing to environment: $ENV_NAME

if [ -z "$CONDA_PREFIX_1" ]
then
	if [ -z "$CONDA_PREFIX" ]
	then
		echo "ERROR: couldn't find conda base."
		exit 1
	else
		CONDA_BASE=$CONDA_PREFIX
	fi
else
	CONDA_BASE=$CONDA_PREFIX_1
fi

echo Using conda base from $CONDA_BASE

source $CONDA_BASE/etc/profile.d/conda.sh

echo Deactivating conda environment
conda activate base

echo Removing conda environment
conda env remove -n $ENV_NAME

echo Creating new environment
conda env create -n $ENV_NAME --file $PACKAGE_FILE

ADDON_SCRIPT=$1.sh

if [ -f "$ADDON_SCRIPT" ]
then
	echo Running additional commands from $ADDON_SCRIPT in environment $EVN_NAME...
	conda activate $ENV_NAME
	source $ADDON_SCRIPT
fi