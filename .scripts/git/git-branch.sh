#!/bin/bash

branch=$(git branch | fzf | sed "s/\* //g")
git checkout $branch
