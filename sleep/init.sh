#!/bin/bash

set -e
cd `dirname $0`

sudo ln -svf `pwd`/lock.sh /usr/local/bin/lock_screen
