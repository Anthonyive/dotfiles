#!/bin/zsh
# Open a man page in Preview:
pman() {
    man -t "$1" | open -f -a Preview; 
}
