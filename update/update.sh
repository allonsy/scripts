#!/bin/bash

set -e

TRANSACTION_FILE="$HOME/.pacman.transaction"
rm -f $TRANSACTION_FILE

declare -a TO_UPDATE

sudo pacman -Sy

readarray PACKAGE_LIST <<< $(sudo pacman -Su --print-format "%n %v")
for PACKAGE in "${PACKAGE_LIST[@]}"; do
    read -r -a PACKAGE_VALS <<< "$PACKAGE"
    PACKAGE_NAME=${PACKAGE_VALS[0]}
    PACKAGE_VERSION_NEW=${PACKAGE_VALS[1]}
    
    OLD_PACKAGE_LIST="$(sudo pacman -Q $PACKAGE_NAME)"
    read -r -a OLD_PACKAGE_VALS <<< "$OLD_PACKAGE_LIST"
    PACKAGE_VERSION_OLD=${OLD_PACKAGE_VALS[1]}

    echo "$PACKAGE_NAME $PACKAGE_VERSION_OLD $PACKAGE_VERSION_NEW" >> $TRANSACTION_FILE
    TO_UPDATE+=("$PACKAGE_NAME")
done

sudo pacman -S ${TO_UPDATE[@]}

echo ""
echo "These AUR packages need updating:"
auracle sync || true

echo ""
echo "Orphan packages: "
echo -en '\e[0;31m'
sudo pacman -Qdt || true
echo -en '\e[0m'
