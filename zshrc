#!/usr/bin/env zsh

source $HOME/local/Cellar/shellscriptloader/loader.zsh

path_to_here=$(dirname $(readlink $HOME/.zshrc))
loader_addpath "$path_to_here"
loader_addpath "$path_to_here/modules"

include prologue

    include editor
    include prompt
    include navigate
    include history
    include misc
    include ls

    include fzf

    include git
    include node
    include android
    include docker

include epilogue

loader_finish

