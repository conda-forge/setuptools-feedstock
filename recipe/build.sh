#!/bin/bash

# the bootstrap.py script requires pip to install dependencies. conda is
# providing these dependencies and therefore pip is not needed. Copy a mock
# version of the pip module so that the bootstrap.py script can be run.
cp $RECIPE_DIR/mock_pip.py pip.py

export SETUPTOOLS_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=0
export DISTRIBUTE_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=0

$PYTHON bootstrap.py
$PYTHON setup.py install --single-version-externally-managed --record=record.txt
