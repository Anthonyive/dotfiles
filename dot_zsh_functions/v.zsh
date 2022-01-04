#!/bin/zsh
# `v` with no arguments opens the current directory in Vim, otherwise opens the given location

v() {
	if [ $# -eq 0 ]; then
		nvim .
	else
		nvim "$@"
	fi
}
