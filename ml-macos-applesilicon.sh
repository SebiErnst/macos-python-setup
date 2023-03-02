#!/bin/bash
conda install -y -c apple tensorflow-deps
python -m pip install tensorflow-macos
python -m pip install tensorflow-metal
