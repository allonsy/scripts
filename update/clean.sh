#!/bin/bash

set -e

sudo pacman -Sc --noconfirm

rm -f "$HOME/.pacman.transaction"
