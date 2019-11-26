#!/bin/bash

if [ -n "$1" ]
then
    echo "About to prune $1. Continue ? [y/N] "
    read confirm
    case $confirm in
        y*)
            git filter-branch --tag-name-filter cat --index-filter 'git rm -r --cached --ignore-unmatch $1' --prune-empty -f -- --all
            ;;

        *)
            echo "Nooo"
            ;;
    esac
else
    echo "No argument provided. Exiting."
fi
