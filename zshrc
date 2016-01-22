source "${HOME}/local/Cellar/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Initializing plugins"

    zgen loadall <<EOPLUGINS
        mafredri/zsh-async
        sindresorhus/pure
EOPLUGINS

    # syntax-highlighting must allegedly be sourced at the end
    zgen load zsh-users/zsh-syntax-highlighting

    zgen save
fi


function add_to_path() { append_to_path "$@" }
function append_to_path() { export PATH=$PATH:$1 }

# Homebrew
add_to_path /usr/local/bin
add_to_path /usr/local/sbin

add_to_path $HOME/local/bin

