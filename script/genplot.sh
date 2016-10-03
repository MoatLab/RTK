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

if [[ -z "$1" ]]; then
	echo "Usage: genplots TARGET, put all .dat files under dat/TARGET/"
	exit 1
fi

GNUPLOT=$(which gnuplot)
if [[ ! -x "$GNUPLOT" ]]
then
	echo "You need gnuplot installed to generate graphs"
	exit 1
fi

if [[ ! -d $PLOTDIR ]]; then
    mkdir -p $PLOTDIR
fi

if [[ ! -d $EPSDIR ]]; then
    mkdir -p $EPSDIR
fi

TARGET="$1"

SAMPLE_DURATION=80


TERM="set term postscript eps color 20"
TITLE="set title \"CDF of Read\""
KEY="set key right bottom"
SIZE="set size 1, 1"
XRANGE="set xrange [0:100]"
YRANGE="set yrange [0.9:1]"
XLABEL="set xlabel \"Latency (ms)\""
OUTPUT="set output \"eps/$TARGET.eps\""
PLOT="plot \\"

declare -a rgbcolors=(\"gray\" \"green\" \"blue\" \"red\" \"pink\" \"yellow\" \"purple\" \"cyan\")

function genplot() 
{
    # we are picky about colors, so be careful about the ordering
    if [[ -e $PLOTDIR/$TARGET.plot ]]; then
        exit
    fi

    {
        echo $TERM
        echo $TITLE
        echo $KEY
        echo $XRANGE
        echo $YRANGE
        echo $XLABEL
        echo $OUTPUT

        # settings should come before this line
        echo $PLOT

        cnt=0
        for i in dat/$TARGET/*.dat; do
            LT=$(basename $i | awk -F"_" '{print $2}')
            # We need to extract the line title info from $LT later 
            PL="'$i' u (\$1/1000):2 t \"$LT\" w l lc rgb ${rgbcolors[$cnt]} lw 8, \\"
            cnt=$((cnt+1))
            echo $PL
        done
    } > $PLOTDIR/$TARGET.plot
}

genplot

echo "==== genplot done ===="

