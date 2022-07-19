#!/bin/bash

VERSIONS=(3.8 3.9 3.10)

for VERSION in ${VERSIONS[@]}
do
	echo $VERSION
	./create-conda-env.sh $VERSION
done
