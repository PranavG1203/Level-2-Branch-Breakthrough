#!/bin/bash

git fetch --all

branch_count=$(git branch -r | grep -vE "origin/(main|master)" | wc -l)

if [ "$branch_count" -gt 0 ]; then
    echo "Pass!"
    exit 0
else
    echo "Fail!"
    exit 1
fi
