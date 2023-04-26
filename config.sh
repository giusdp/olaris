#!/bin/bash
NUV_TMP=~/.nuv/tmp

if test -z "$1"
then cat $NUV_TMP/env 
     exit 0
fi

for I in "$@"
do
    IFS='=' read -r K V <<<"$I"
    if test -z "$V"
    then rm $NUV_TMP/$K.env
    else echo $I >$NUV_TMP/$K.env
    fi
done
cat $NUV_TMP/*.env >$NUV_TMP/env
