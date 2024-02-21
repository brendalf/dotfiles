#!/bin/bash

branch=$(git branch | fzf | sed "s/\+ //g" | sed "s/\* //g" | sed "s/  //g")
git checkout "$branch"
