# A LOT comes from this video: https://www.youtube.com/watch?v=ud7YxC33Z3w
# Its great

# Keybindings
bindkey -e
# Cycle history for current command
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# History
HISTFILE=~/.zsh_history
[ ! -d $HISTFILE ] && mkdir -p "$(dirname $HISTFILE)" && touch "$HISTFILE"
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
# Write to history whenever a command is sent
setopt inc_append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
autoload -U compinit && compinit

# Autocomplete opts
# Case insensitive (amazing)
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

# Use starship
eval "$(starship init zsh)"

# Aliases
alias ..="cd .."
# Thank you redditor
alias gh="cat $HISTFILE | grep"

alias vi="nvim"
alias vim="nvim" history-search-forward
