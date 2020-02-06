#!/bin/bash

set -e
cd `dirname $0`

sudo ln -svf `pwd`/totp.sh /usr/local/bin/totp
sudo ln -svf `pwd`/_totp /usr/share/zsh/site-functions/_totp
