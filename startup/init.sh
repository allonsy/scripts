#!/bin/bash

set -e
cd `dirname $0`

sudo ln -svf `pwd`/startup.sh /usr/local/bin/startup
