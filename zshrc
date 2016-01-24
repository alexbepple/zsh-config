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
# load modules
###############################################################

source $HOME/local/Cellar/shellscriptloader/loader.zsh
loader_addpath "$(dirname $(readlink $HOME/.zshrc))/modules"

include editor
include navigate
include 'history'
include misc
include 'ls'

include git

loader_finish

