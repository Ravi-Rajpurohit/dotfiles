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

export LANG=en_US.UTF-8

. "$HOME/.deno/env"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


. "$HOME/.local/bin/env"
