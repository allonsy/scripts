#!/bin/bash

if [ $# = 0 ]; then
    SCRIPT_DIRS=`ls`
else
    SCRIPT_DIRS=$@
fi

for SCRIPT_DIR in $SCRIPT_DIRS; do
    if [ -d $SCRIPT_DIR ]; then
        echo "================="
        echo "installing $SCRIPT_DIR"
        echo ""
        cd $SCRIPT_DIR
        bash init.sh
        cd ..
        echo "================="
    fi
done

