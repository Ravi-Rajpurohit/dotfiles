CODESTATS_API_KEY="SFMyNTY.Y21GMmFTMXlZV3B3ZFhKdmFHbDAjI016QXhNQT09.1evqNXYzJSKrvN_JaYoxzsufnUM-fQ1WE3gZ4Tuu44U"

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load https://gitlab.com/code-stats/code-stats-zsh.git
    zgen load https://github.com/zsh-users/zsh-autosuggestions.git
    #zgen load /path/to/super-secret-private-plugin

    # bulk load
    #zgen loadall <<EOPLUGINS
    #    zsh-users/zsh-history-substring-search
    #   /path/to/local/plugin
    #EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen load bhilburn/powerlevel9k powerlevel9k
    zgen load denysdovhan/spaceship-prompt spaceship

    # save all to init script
    zgen save

fi

alias dotfiles='/usr/bin/git --git-dir=/home/jarvis/.dotfiles/ --work-tree=/home/jarvis'

export PATH="$PATH:$(yarn global bin):/home/jarvis/.local/bin"
export LD_LIBRARY_PATH=/usr/local/lib
