source "${HOME}/local/Cellar/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Need to recreate init script …"

    zgen load zsh-users/zsh-completions src

    # syntax-highlighting should be sourced at the end of .zshrc
    # otherwise there might be problems with ZLE widgets loaded afterwards
    # -- README
    zgen load zsh-users/zsh-syntax-highlighting
fi


###############################################################
# misc – early
###############################################################

# must be sourced before enhancd
source /usr/local/opt/autoenv/activate.sh


###############################################################
# load modules
###############################################################

source $HOME/local/Cellar/shellscriptloader/loader.zsh
loader_addpath "$(dirname $(readlink $HOME/.zshrc))/modules"

include editor
include prompt
include navigate
include 'history'
include misc
include 'ls'

include git

loader_finish

if ! zgen saved; then
    zgen save
fi

