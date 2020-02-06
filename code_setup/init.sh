#!/bin/bash

set -e
cd `dirname $0`

echo "Creating symlinks"

sudo ln -sfv `pwd`/code_setup /usr/local/bin/code_setup
