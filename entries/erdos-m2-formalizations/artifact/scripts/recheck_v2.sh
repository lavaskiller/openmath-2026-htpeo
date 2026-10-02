#!/bin/bash
# recompile every Erdos file of the v2 bundle through leancheck.sh, two at a time; logs in recheck_v2/
# (Star6Simple.lean is not an FC file: see STAR6_DEPENDENCY.md and star6check/)
cd ~/erdos-fc/m2/final && mkdir -p recheck_v2 && rm -f recheck_v2/DONE
one(){ f=$1; n=$(basename $(dirname $f))_$(basename $f .lean); ~/erdos-fc/leancheck.sh $f > recheck_v2/$n.log 2>&1; }
export -f one
ls $PWD/bundle/Erdos*.lean $PWD/bundle_optional/Erdos*.lean | xargs -P 2 -I{} bash -c "one {}"
echo done > recheck_v2/DONE
