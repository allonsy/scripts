#!/bin/bash

set -e

# sudo pacman -Sy
readarray PACKAGE_LIST <<< $(sudo pacman -Su --print-format "%n %v")
for PACKAGE in "${PACKAGE_LIST[@]}"; do
    read -r -a PACKAGE_VALS <<< "$PACKAGE"
    echo "Name: ${PACKAGE_VALS[0]}"
    echo "Version: ${PACKAGE_VALS[1]}"
done
# echo -e "\n"
# echo -e "\e[34mThese packages are in need of and update:\n"
# echo -e "\e[0m"
# auracle sync
# echo -e "\n"
# echo -e "\e[31mOrphan packages: \e[0m"
# sudo pacman -Qdt
