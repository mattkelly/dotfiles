########################################
# Antidote (Plugin Manager)
########################################
# Homebrew installation
source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
antidote load ~/.zsh_plugins.txt


########################################
# Load Powerlevel10k configuration
########################################
# p10k must load AFTER antidote
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


########################################
# OS-specific settings
########################################
case "$(uname -s)" in
  Linux)
    [[ -f ~/.zshrc-linux ]] && source ~/.zshrc-linux
    ;;
  Darwin)
    [[ -f ~/.zshrc-macos ]] && source ~/.zshrc-macos
    ;;
esac


########################################
# Environment / Paths
########################################
export GOPATH="$HOME/go"
export PATH="$HOME/go/bin:/usr/local/bin:$PATH"

# Helpful CDPATH (optional)
export CDPATH=".:$GOPATH/src/github.com:$GOPATH/src/golang.org:$GOPATH/src"


########################################
# Navigation: zoxide (modern cd)
########################################
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi


########################################
# Shell Behavior
########################################
setopt autocd               # "cd" by typing dir
setopt extendedglob         # advanced globbing
setopt notify               # job notifications
setopt completeinword       # partial-word completion
unsetopt beep               # silence
setopt interactive_comments # allow comments in commands


########################################
# History
########################################
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt append_history       # append, don't overwrite
setopt share_history        # share across sessions
setopt hist_ignore_space    # ignore commands starting w/ space
setopt hist_ignore_all_dups # no duplicates at all
setopt hist_reduce_blanks   # tidy formatting


########################################
# Keybindings
########################################
bindkey -e   # Emacs keybindings (bash-like)


########################################
# FZF integration
########################################
# Homebrew installs its own integration script
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh


########################################
# Aliases
########################################
# Better safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# General shortcuts
alias c='clear'
alias h='history'
alias md='mkdir'
alias rd='rmdir'

# Git
alias gs='git status'
alias gn='git-num'
alias gg='git grep -I'
alias gco='git checkout'
alias gl='git log'
alias gls='git log --show-signature'
alias gd='git diff'
alias gds='git diff --staged'
alias gpum='git pull upstream master'
alias gpom='git push origin master'
alias gpud='git pull upstream development'
alias gpod='git push origin development'
alias gt='git tree'

# Docker & Kubernetes
alias dps="docker ps"
alias di="docker images"
alias kc="kubectl"

# Tools
alias rg="rg --hidden --glob '!vendor' --glob '!.git'"
alias fd='fd -H'
alias i="invoke"

# Neovim as primary editor
alias vim='nvim'
alias v='nvim'
alias vimdiff='nvim -d'
alias vd='nvim -d'

# Utilities
alias stamp="ts '[%H:%M:%S]'"
alias total="awk '{s+=$1} END {print s}'"


########################################
# Functions
########################################
hist_most () {
  fc -il 1 | awk '{print $4}' | sort | uniq -c | sort -rn | head -${1:=10}
}

