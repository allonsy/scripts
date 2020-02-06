#!/bin/bash

set -e
cd `dirname $0`

echo "Creating symlinks"

sudo ln -sfv `pwd`/toggle_layout /usr/local/bin/toggle_layout
