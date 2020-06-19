#!/usr/bin/env bash
set -uo pipefail

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

if [ "$TODO_FOUND" != "no" ]; then
    exit 1
fi
