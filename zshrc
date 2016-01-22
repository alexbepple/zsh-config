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


# local bin
add_to_path $HOME/local/bin


###############################################################
# Git
###############################################################
alias g='git'

alias gs='git status'
alias ga='git add'
alias gac='git add -A :/ && git commit -v'
alias gl='git log --oneline'
alias gd='git diff --histogram --word-diff=color'
alias gp='git push'
alias gwR='git reset --hard'

alias st='open -a sourcetree .'


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

alias bd='. bd -si'

setopt auto_cd


###############################################################
# misc
###############################################################

# completion options
#   'm:{a-zA-Z}={A-Za-z}' – case-insensitive
#   'r:|[._-]=* r:|=*' allows 'f.b' to expand to 'foo.bar'
#   'l:|=* r:|=*' allows 'bar' to expand to 'foobar'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

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

source /usr/local/opt/autoenv/activate.sh

alias serve.this='mongoose -hide_files_patterns ".DS_Store"'

