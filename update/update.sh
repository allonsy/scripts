#!/bin/bash

set -e
sudo pacman -Syu
echo -e "\n"
echo -e "\e[34mThese packages are in need of and update:\n"
echo -e "\e[0m"
auracle sync
echo -e "\n"
echo -e "\e[31mOrphan packages: \e[0m"
sudo pacman -Qdt
