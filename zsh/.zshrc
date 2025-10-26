# Exports
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
export FZF_DEFAULT_OPTS="
    --height=99% 
    --layout=reverse 
    --pointer='█'
    --scrollbar='▌'
    --highlight-line
    --color=hl:#f3be7c
    --color=bg:-1
    --color=gutter:-1
    --color=bg+:#252530
    --color=fg+:#aeaed1
    --color=hl+:#f3be7c
    --color=border:#606079
    --color=prompt:#bb9dbd
    --color=query:#aeaed1:bold
    --color=pointer:#aeaed1
    --color=scrollbar:#aeaed1
    --color=info:#f3be7c
    --color=spinner:#7fa563
    "

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Starship Theme
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
autoload -U add-zsh-hook

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='exa --icons -F -H --group-directories-first --git -1'
alias cat="bat --paging=never"
alias vim='nvim'
alias c='clear'

# Conditional alias for sail
sail_alias_update() {
    if [[ "$PWD" == "$HOME/work/kurochi-laravel" || "$PWD" == "$HOME/work/gravion" || "$PWD" == "$HOME/work/cyber-clash" ]]; then
        alias sail='./vendor/bin/sail'
    else
        unalias sail 2>/dev/null
    fi
}

add-zsh-hook chpwd sail_alias_update
sail_alias_update

# Shell integrations
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

# Auto-start tmux in Ghostty if not already in tmux
if [[ "$TERM_PROGRAM" == "ghostty" && -z "$TMUX" ]]; then
    tmux attach-session -t default || tmux new-session -s default
    exit
fi
