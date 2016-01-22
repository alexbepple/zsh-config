source "${HOME}/local/Cellar/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Initializing plugins"

    # pure depends on async
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure

    zgen load zsh-users/zsh-completions src

    # syntax-highlighting must allegedly be sourced at the end
    zgen load zsh-users/zsh-syntax-highlighting

    zgen save
fi


function add_to_path() { append_to_path "$@" }
function append_to_path() { export PATH=$PATH:$1 }


# Homebrew
add_to_path /usr/local/bin
add_to_path /usr/local/sbin


# local bin
add_to_path $HOME/local/bin


# Git
alias g='git'

alias gs='git status'
alias ga='git add'
alias gac='git add -A :/ && git commit -v'
alias gl='git log --oneline'
alias gd='git diff --histogram --word-diff=color'
alias gp='git push'
alias gwR='git reset --hard'

alias st='open -a sourcetree .'

