source "${HOME}/local/Cellar/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Initializing plugins"

    zgen loadall <<EOPLUGINS
        mafredri/zsh-async
        sindresorhus/pure
EOPLUGINS

    zgen save
fi

