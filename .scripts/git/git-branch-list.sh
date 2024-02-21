#!/bin/bash

git branch | while read line; do
	description=$(git config branch.$(echo "$line" | sed "s/\+ //g" | sed "s/\* //g" | sed "s/  //g").description)

	if [[ -z $description ]]; then
		echo "$line"
	else
		echo "$line                        $description"
	fi
done
