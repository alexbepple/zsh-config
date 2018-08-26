#!/usr/bin/env zsh

source $HOME/local/Cellar/shellscriptloader/loader.zsh

path_to_here=$(dirname $(readlink $HOME/.zshrc))
loader_addpath "$path_to_here"
loader_addpath "$path_to_here/modules"
loader_addpath "$path_to_here/dev"

include prologue

    include editor
    include prompt
    include navigate
    include history
    include misc
    include ls

    include fzf
    include direnv

    include git
    include android
    include docker
    include node
    include python
    include go
    include rust

include epilogue

loader_finish

