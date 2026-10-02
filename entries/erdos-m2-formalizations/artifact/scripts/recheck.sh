#!/bin/bash
# recompile every file of the final bundle through leancheck.sh, two at a time; logs in recheck/
cd ~/erdos-fc/m2/final && mkdir -p recheck
one(){ f=$1; n=$(basename $(dirname $f))_$(basename $f .lean); ~/erdos-fc/leancheck.sh $f > recheck/$n.log 2>&1; }
export -f one
ls $PWD/bundle/*.lean $PWD/bundle_optional/*.lean | xargs -P 2 -I{} bash -c "one {}"
echo done > recheck/DONE
