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
# misc
###############################################################

alias grep='grep -i'
alias ag='ag --smart-case --hidden'

alias o='open'

export EDITOR=mvim
vim_less="vim -u /usr/share/vim/vim73/macros/less.vim"
alias L="$vim_less"
export PAGER="$vim_less"
export MANPAGER="col -b | $vim_less -c 'set ft=man nomod nolist' -"

alias p4merge='/Applications/p4merge.app/Contents/Resources/launchp4merge'
alias fix.open.with='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

export PERU_CACHE=$HOME/.cache/peru

alias time_="gtime -f '\ncompleted in %e seconds'"


# opens in new window on current space, even if another VimR windows exists on another space
function v () { 
    osascript -e 'on run (argv)
        tell application "VimR" to openFilesInNewWindow (argv)
        activate application "VimR"
    end' $(greadlink -f "$1") 
}

alias serve.this='mongoose -hide_files_patterns ".DS_Store"'

add_to_path $HOME/local/bin

source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--reverse --inline-info"


###############################################################
# load modules
###############################################################

source ~/local/Cellar/shellscriptloader/loader.zsh
loader_addpath "$(dirname $(readlink $HOME/.zshrc))/modules"

include editor
include git

loader_finish

