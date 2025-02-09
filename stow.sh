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


if [ "$all" = true ]; then
    all_pkgs=($(ls -d */ | grep -Ev "(\.git|BashScripts|other|assets)" | sed 's|/||'))
    # With find: ($(find . -maxdepth 1 -mindepth 1 \( -name ".git" -o -name "BashScripts" ...... \) -prune -o -type d -print | sed 's|^\./||'))
    arr=(${all_pkgs[@]})
else
    arr=($(cat $all_pkgs | fzf -m --prompt "choose which pkgs to link (use tab for multi)>"))
fi

[[ -n "$arr" ]] && stow ${arr[@]}
# [[ -n "$arr" ]] && echo ${arr[@]}
