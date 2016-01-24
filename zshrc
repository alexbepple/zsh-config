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


###############################################################
# misc – early
###############################################################

# must be sourced before enhancd
source /usr/local/opt/autoenv/activate.sh


###############################################################
# ls
###############################################################
gnu_less='/usr/local/bin/gls'
alias ls="$gnu_less --color -U"

alias l='ls'         # Lists in one column, hidden files.
alias ll='ls -l'
alias la='ls -A'

alias tree.without.garbage="tree -I '.git|.jhw-cache|.DS_Store|Icon*'"


###############################################################
# fs
###############################################################
function mkcd () { mkdir -p "$1" && cd "$1" }

setopt auto_cd
alias -- -='builtin cd -'
alias -- ..='cd ..'

zgen load b4b4r07/enhancd

# cd into recent dir on tab at beginning of line
function _cd_into_recent_or_expand() {
    if [[ -z $BUFFER ]]; then
        BUFFER="cd"
        zle accept-line
    else
        zle expand-or-complete
    fi
}
zle -N _cd_into_recent_or_expand
bindkey '^I' _cd_into_recent_or_expand


###############################################################
# history
###############################################################

HISTFILE=$HOME/.zhistory
HISTSIZE=10000 # maximum number of events to save in memory
SAVEHIST=10000 # maximum number of events to save in the history file
setopt HIST_IGNORE_ALL_DUPS # delete old recorded event if new event is duplicate
setopt SHARE_HISTORY # share history between all sessions


###############################################################
# load modules
###############################################################

source $HOME/local/Cellar/shellscriptloader/loader.zsh
loader_addpath "$(dirname $(readlink $HOME/.zshrc))/modules"

include editor
include git
include misc

loader_finish

