#!/bin/bash

# Check if the output file exists
if [ ! -f Level2.txt ]; then
    echo "Output file Level2.txt not found!"
    exit 1
fi

# Check if the content of Level2.txt matches the expected format
expected_content="Main branch\nFeature branch"
actual_content=$(cat Level2.txt)

if [[ "$actual_content" == "$expected_content" ]]; then
    echo "Content check passed!"
else
    echo "Content check failed! Expected:"
    echo "$expected_content"
    echo "But got:"
    echo "$actual_content"
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
