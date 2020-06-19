#!/usr/bin/env bash
set -euo pipefail

TAB_FOUND="no"

for WITH_TAB in $(git grep -r "$(printf '\t')" | tr ':' ' ' | awk '{ print $1 }' | sort | uniq); do
    echo "! Tab character found in: $WITH_TAB"
    TAB_FOUND="yes"
done

if [ "$TAB_FOUND" = "no" ]; then
    echo "* No tab characters detected"
else
    exit 1
fi
