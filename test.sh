#!/bin/bash

# Check if the output file exists
if [ ! -f conflict.txt ]; then
    echo "Output file not found!"
    exit 1
fi

# Check for both lines from the conflict resolution
if grep -q "This is the main branch line" conflict.txt && grep -q "This is the feature branch line" conflict.txt; then
    echo "Test passed!"
    exit 0
else
    echo "Test failed! Make sure both lines are present."
    exit 1
fi
