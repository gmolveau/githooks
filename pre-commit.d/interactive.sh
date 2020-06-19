#!/usr/bin/env bash
set -uo pipefail

  
echo "Would you like to play a game?"

# Read user input, assign stdin to keyboard
exec < /dev/tty

while read -r -p "Have you double checked that only relevant files were added? (Y/n) " yn; do
    case $yn in
        [Yy] ) break;;
        [Nn] ) echo "Please ensure the right files were added!"; exit 1;;
        * ) echo "Please answer y (yes) or n (no):" && continue;
    esac
done
while read -r -p "Has the documentation been updated? (Y/n) " yn; do
    case $yn in
        [Yy] ) break;;
        [Nn] ) echo "Please add or update the docs!"; exit 1;;
        * ) echo "Please answer y (yes) or n (no):" && continue;
    esac
done
while read -r -p "Do you know which issue or PR numbers to reference? (Y/n) " yn; do
    case $yn in
        [Yy] ) break;;
        [Nn] ) echo "Better go check those tracking numbers!"; exit 1;;
        * ) echo "Please answer y (yes) or n (no):" && continue;
    esac
done

exec <&-