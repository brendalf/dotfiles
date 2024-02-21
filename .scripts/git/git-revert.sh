#!/usr/bin/env bash

selected=$(git lo -10 | fzf)

if [[ -z $selected ]]; then
	exit 0
fi

git revert $(echo $selected | awk '{split($0,a); print $1}')
