#!/usr/bin/env bash
set -uo pipefail

TAB_FOUND="no"

OFFENDING_FILES=$(
	git grep -r "$(printf '\t')" |
	tr ':' ' ' |
	awk '{ print $1 }' |
	sort |
	uniq
)

for WITH_TAB in $OFFENDING_FILES; do
    echo "! Tab character found in: $WITH_TAB"
    TAB_FOUND="yes"
done

if [ "$TAB_FOUND" != "no" ]; then
	exit 1
fi
