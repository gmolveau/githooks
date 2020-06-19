#!/usr/bin/env bash
set -euo pipefail

if ! [ -x "$(command -v shellcheck)" ]; then
    echo "_ Skipping shellcheck - not installed/not in \$PATH"
    exit 0
fi

# --exclude=RULE : exclude rule number X (here SC1091 = dont check files that are sourced)
# --format=FORMAT : ouput format (tty, json, diff)
# --severity=SEVERITY : minimum severity [error, warning, info, style]

git diff --cached --name-only --diff-filter=AM '*.sh' | xargs shellcheck --exclude=SC1091 || exit 1

#find . -type f -name "*.sh" -print0 | xargs -0 shellcheck --exclude=SC1091 || exit 1