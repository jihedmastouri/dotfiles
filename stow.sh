#!/bin/bash

sudo stow --target=/usr/bin/ BashScripts

declare -a arr

usage() {
    echo "Usage: $0 [-a]"
}

all=false
while getopts "a" o; do
   case $o in
        a) all=true
          ;;
        *) usage
           exit 1
          ;;
    esac
done
shift $((OPTIND-1))

excludeStr=".git|BashScripts"

if [ "$all" = true ]; then
    arr=($(find . -maxdepth 1 \( -name ".git" -o -name "BashScripts" \) -prune -o -type d -print | sed 's|^\./||'))
else
    arr=$(find . -maxdepth 1 \( -name ".git" -o -name "BashScripts" \) -prune -o -type d -print | sed 's|^\./||' | fzf -m --prompt "choose which pkgs to link (use tab for multi)>")
fi

[[ -n "$arr" ]] && stow ${arr[@]}
