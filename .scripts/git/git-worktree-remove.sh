#!/bin/bash

path_branch_to_delete=$(git worktree list | tail -n +2 | awk '{print $1}' | fzf)

if [[ -z $path_branch_to_delete ]]; then
	exit 0
fi

branch_to_delete=$(basename "$path_branch_to_delete")

echo "Deleting branch $branch_to_delete"
git worktree remove "$branch_to_delete"
rm -rf "$branch_to_delete"
