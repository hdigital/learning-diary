#!/bin/bash
#
## Description: Initialize project in new codespace

# update Python package manager
python -m pip install --upgrade pip

# install nbdev in local user space to run in codespace
python -m pip uninstall nbdev --yes
python -m pip install --user nbdev

# install Quarto with nbdev
nbdev_install_quarto
