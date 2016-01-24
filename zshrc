#!/usr/bin/env zsh

source $HOME/local/Cellar/shellscriptloader/loader.zsh
loader_addpath "$(dirname $(readlink $HOME/.zshrc))"

include prologue

    loader_addpath "$(dirname $(readlink $HOME/.zshrc))/modules"
    include editor
    include prompt
    include navigate
    include 'history'
    include misc
    include 'ls'

    include git

include epilogue

loader_finish

