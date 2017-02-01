#!/bin/bash

# we need pip to install setuptools but do not want to include it as a build
# requirement as that will pull in setuptools.  Instead use an bootstrap
# install of pip and include the directory in the python search path.
wget -q https://pypi.io/packages/source/p/pip/pip-9.0.1.tar.gz
tar xfz pip-9.0.1.tar.gz
PIP_DIR="$SRC_DIR/pip-9.0.1"

export SETUPTOOLS_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=0
export DISTRIBUTE_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=0

PYTHONPATH=$PIP_DIR $PYTHON bootstrap.py
$PYTHON setup.py install --single-version-externally-managed --record=record.txt
