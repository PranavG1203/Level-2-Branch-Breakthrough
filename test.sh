#!/bin/bash

# Check if the output file exists
if [ ! -f Level2.txt ]; then
    echo "Output file Level2.txt not found!"
    exit 1
fi

# Read the content of Level2.txt into an array, trimming whitespace
mapfile -t lines < <(sed 's/^[[:space:]]*//;s/[[:space:]]*$//' Level2.txt)

# Check if the content matches either expected format
if [[ ("${lines[0]}" == "Feature branch" && "${lines[1]}" == "Main branch") || ("${lines[0]}" == "Main branch" && "${lines[1]}" == "Feature branch") ]]; then
    echo "Content check passed!"
else
    echo "Content check failed! Expected either:"
    echo -e "Feature branch\nMain branch"
    echo "or:"
    echo -e "Main branch\nFeature branch"
    echo "But got:"
    printf "%s\n" "${lines[@]}"
    exit 1
fi

# Check if the feature branch exists
if git show-ref --verify --quiet refs/heads/feature; then
    echo "Feature branch exists."
else
    echo "Feature branch does not exist! Make sure you created the feature branch."
    exit 1
fi

# If both checks pass
echo "All checks passed!"
exit 0
