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

