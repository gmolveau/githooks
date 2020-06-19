#!/usr/bin/env bash
set -euo pipefail

TODO_FOUND="no"

OFFENDING_FILES=$(
    git grep -rE "(TODO|FIXME)" |
    tr ':' ' ' | awk '{ print $1 }' |
    sort | uniq
)

for WITH_TODO in $OFFENDING_FILES; do
    echo "! TODO or FIXME found in: $WITH_TODO"
    TODO_FOUND="yes"
done

if [ "$TODO_FOUND" = "no" ]; then
    echo "* No TODO or FIXME detected"
else
    exit 1
fi
