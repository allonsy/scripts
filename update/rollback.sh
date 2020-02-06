#!/bin/bash

set =e

TRANSACTION_FILE="$HOME/.pacman.transaction"

function color_red() {
    echo -en '\e[0;31m'
}

function reset_color() {
    echo -en '\e[0m'
}


declare -a TO_ROLLBACK

readarray PACKAGE_LIST <<< $(cat "$TRANSACTION_FILE")
for PACKAGE_LINE in "${PACKAGE_LIST[@]}"; do
    read -r -a PACKAGE_VALS <<< "$PACKAGE_LINE"
    PACKAGE_NAME="${PACKAGE_VALS[0]}"
    PACKAGE_VERSION_OLD="${PACKAGE_VALS[1]}"
    if (ls /var/cache/pacman/pkg/$PACKAGE_NAME-$PACKAGE_VERSION_OLD-* > /dev/null 2> /dev/null); then
        PACKAGE_TARBALL=$(ls /var/cache/pacman/pkg/$PACKAGE_NAME-$PACKAGE_VERSION_OLD-*)
        TO_ROLLBACK+=("$PACKAGE_TARBALL")
    else
        color_red
        echo "WARNING: Unable to find package: $PACKAGE_NAME-$PACKAGE_VERSION_OLD"
        reset_color
    fi
done

sudo pacman -U ${TO_ROLLBACK[@]}
