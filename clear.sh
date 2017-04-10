#!/bin/bash

input=$1

if [[ $# != 1 ]]; then
    echo ""
    echo "Usage: ./clear.sh directory-entry"
    echo ""
fi

echo "Please confirm you want to delete [$input] entries! Type anything .."
read x

if [[ -e raw/$input ]]; then
    rm -rf raw/$input
fi

if [[ -e dat/$input ]]; then
    rm -rf dat/$input
fi

if [[ -e plot/${input}.plot ]]; then
    rm -rf plot/${input}.plot
fi

if [[ -e eps/${input}.eps ]]; then
    rm -rf eps/${input}.eps
fi

echo "Done!"


