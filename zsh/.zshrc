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

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ravi/.lmstudio/bin"
# End of LM Studio CLI section

export COMPOSE_BAKE=true
eval "$(zoxide init zsh)"

# Added by Antigravity
export PATH="/Users/ravi/.antigravity/antigravity/bin:$PATH"

# OpenClaw Completion
source "/Users/ravi/.openclaw/completions/openclaw.zsh"

# Prefer n-managed Node at /usr/local/bin over Homebrew node (brew shellenv prepends /opt/homebrew/bin).
export PATH="/usr/local/bin:$PATH"

# Auto-activate Node from .n-node-version, .node-version, .nvmrc, or package.json (like nvm+precmd, but via `n`).
# Uses chpwd (on cd) + once at startup, not precmd every prompt. See: https://johnlindquist.com/automatically-switch-node-versions-based-on-your-packagejson-and-precmd-in-zsh/
autoload -Uz add-zsh-hook
_n_auto_node() {
  command -v n >/dev/null || return 0
  [[ -f .n-node-version || -f .node-version || -f .nvmrc || -f package.json ]] || return 0
  n auto -q 2>/dev/null
}
add-zsh-hook chpwd _n_auto_node
_n_auto_node
