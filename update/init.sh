#!/bin/bash

set -e
cd `dirname $0`

sudo ln -sfv `pwd`/update.sh /usr/local/bin/arch_update.sh
sudo ln -sfv `pwd`/rollback.sh /usr/local/bin/arch_rollback.sh
sudo ln -sfv `pwd`/clean.sh /usr/local/bin/arch_clean.sh

