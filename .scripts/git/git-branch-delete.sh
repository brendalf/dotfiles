#!/bin/bash

mode="$1"
shift
args="$@"

if [ -z "$args" ]; then
	args=$(git branch | sed "s/\+ //g" | sed "s/\* //g" | sed "s/  //g" | awk '{ print $1 } ' | gum choose --limit 1)

	[ -z "$args" ] && exit 1
fi

git branch $mode $args
