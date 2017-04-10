#!/bin/bash
# Author: Huaicheng <huaicheng@cs.uchicago.edu>
# generate a template gnuplot file 
#

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    TOPDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$TOPDIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done

TOPDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )/.."
RAWDIR=$TOPDIR/raw
DATDIR=$TOPDIR/dat
SCRIPTDIR=$TOPDIR/script
PLOTDIR=$TOPDIR/plot
EPSDIR=$TOPDIR/eps
STATDIR=$TOPDIR/stat

################################################################################

function pr_title()
{
    printf "%-32s%-12s%-12s%-12s%-12s\n" "Filename" "Min" "Average" "Median" "Max"
    echo "----------------------------------------------------------------------------"
}

INPUT=$1

if [[ $# != 1 ]]; then
    echo ""
    echo "Usage: ./getstat.sh [directory|file]"
    echo ""
    exit
fi

#if [[ ! -f $INPUT || ! -d $RAWDIR/$INPUT ]]; then
    #echo "Error: $INPUT not found!\n"
    #exit
#fi


if [[ -f $RAWDIR/$INPUT ]]; then

    pr_title
    awk -vFNAME=$(basename $INPUT) -f $SCRIPTDIR/stat.awk $INPUT

elif [[ -d $RAWDIR/$INPUT ]]; then

    if [[ ! -d $STATDIR/$INPUT ]]; then
        mkdir -p $STATDIR/$INPUT
    fi

    {
        pr_title 
        for i in $RAWDIR/$INPUT/*.tmp; do
            FNAME=$(basename $i)
            awk -vFNAME=$FNAME -f $SCRIPTDIR/stat.awk $i
            echo "----------------------------------------------------------------------------"
        done
    } > $STATDIR/$INPUT/stat.md

    # show result to terminal
    cat $STATDIR/$INPUT/stat.md
fi

