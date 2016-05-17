#!/usr/bin/env zsh

function add_to_path() { append_to_path "$@" }
function append_to_path() { export PATH="$PATH:$1" }
function prepend_to_path() { export PATH="$1:$PATH" }

# Homebrew
prepend_to_path /usr/local/bin
add_to_path /usr/local/sbin

