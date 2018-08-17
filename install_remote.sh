#!/bin/bash

DIR=`pwd`

cd /tmp

rm -rf config*

git clone --recursive https://github.com/TomWoodward/config.git

cd config

./install.sh

cd $DIR
