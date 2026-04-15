# --- Environment & Paths ---
export GOPATH="$HOME/.config/go"
export COMPOSERPATH="$HOME/.config/composer"
export PATH="$PATH:$COMPOSERPATH/vendor/bin:$GOPATH/bin"

# FZF Styling
export FZF_DEFAULT_OPTS="
    --height=99% --layout=reverse --pointer='█' --scrollbar='▌' --highlight-line
    --color=hl:#f3be7c,bg:-1,gutter:-1,bg+:#252530,fg+:#aeaed1,hl+:#f3be7c
    --color=border:#606079,prompt:#bb9dbd,query:#aeaed1:bold,pointer:#aeaed1
    --color=scrollbar:#aeaed1,info:#f3be7c,spinner:#7fa563"

# --- Zinit Plugin Manager ---
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[[ ! -d "$ZINIT_HOME" ]] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load essential plugins
zinit light-mode for \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-completions \
    Aloxaf/fzf-tab

# Load snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZL::async_prompt.zsh

for snip in git sudo archlinux command-not-found; do
    zinit snippet "OMZP::$snip"
done

# -- Theme ---
setopt PROMPT_SUBST
zinit ice lucid
zinit snippet OMZT::robbyrussell

# ls Theme
if [[ -x /usr/bin/dircolors ]]; then
    eval "$(dircolors -b <<EOF
DIR 38;5;75
EXEC 38;5;120
*.tar 38;5;204
*.gz 38;5;204
*.zip 38;5;204
*.png 38;5;219
*.jpg 38;5;219
*.mp4 38;5;171
EOF
)"
fi

alias ls='ls --color=auto --group-directories-first'

# --- Completions & Fixes ---
autoload -Uz compinit && compinit
zinit cdreplay -q

# --- History & Keybindings ---
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt append_history share_history hist_ignore_space hist_ignore_all_dups
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# --- Sail Dynamic Alias ---
SAIL_PROJECTS=(
    "$HOME/work/kurochi/back"
    "$HOME/work/gravion"
    "$HOME/work/cyber-clash"
    "$HOME/work/aun/back"
    "$HOME/work/spazieren-gehen"
)

sail_alias() {
    if [[ ${SAIL_PROJECTS[(ie)$PWD]} -le ${#SAIL_PROJECTS} ]]; then
        alias sail='./vendor/bin/sail'
    else
        unalias sail 2>/dev/null
    fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd sail_alias

sail_alias

# --- Prompt & Integrations ---
eval "$(fzf --zsh)"
[[ -s "/home/giorgi/.bun/_bun" ]] && source "/home/giorgi/.bun/_bun"

# --- Tmux Auto-start ---
if [[ "$TERM_PROGRAM" == "ghostty" && -z "$TMUX" ]]; then
    tmux attach-session -t default || tmux new-session -s default
    exit
fi

# Aliases
alias vim='nvim'
alias c='clear'

