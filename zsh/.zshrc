# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/giorgi/.cargo/bin:/home/giorgi/.config/composer/vendor/bin"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  zsh-autosuggestions
  zsh-syntax-highlighting 
  fast-syntax-highlighting 
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4"
source <(fzf --zsh)

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# aliases
alias vim=nvim
alias lf=yazi
alias gpreq=$HOME/.local/bin/git-push

if [[ "$PWD" == "$HOME/work/kurochi-laravel" ]]; then
    alias sail='./vendor/bin/sail'
else
    unalias sail 2>/dev/null
fi

if [[ "$TERM_PROGRAM" == "ghostty" && -z "$TMUX" ]]; then
    tmux attach-session -t default || tmux new-session -s default
    exit
fi
