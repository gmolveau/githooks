#!/usr/bin/env bash
set -uo pipefail

if ! [ -x "$(command -v shfmt)" ]; then
    echo "_ Skipping shmft - not installed/not in \$PATH"
    exit 0
fi

# note : xargs option "no-run-if-empty" does not work on macOSX except if brew install findutils

# -d : diff mode - output diffs
# -l : list files whose formatting differs from shfmt's
# -i X : indent by X spaces
# -bn : binary ops like && and | may start a line
# -ci : switch cases will be indented
# -sr : redirect operators will be followed by a space

git diff --cached --name-only --diff-filter=AM '*.sh' | xargs --no-run-if-empty shfmt -d -l -i 4 -bn -ci -sr || exit 1

#find . -type f -name "*.sh" -print0 | xargs -0 shfmt -d -l -i 4 -bn -ci -sr || exit 1