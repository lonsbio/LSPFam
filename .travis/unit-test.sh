#!/bin/bash

set -e
errors=0

# Run unit tests
python LSPfam/LSPfam_test.py || {
    echo "'python python/LSPfam/LSPfam_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E LSPfam/*.py || {
    echo 'pylint -E LSPfam/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
