#!/bin/bash

git submodule init
git submodule update

pushd cloudos
./first_time_dev_setup.sh
popd
