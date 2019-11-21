# ---------------------------
# Antigen
# ---------------------------
source $HOME/git/antigen/antigen.zsh

antigen use prezto

antigen bundle joel-porquet/zsh-dircolors-solarized
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# ---------------------------
# Global aliases
# ---------------------------
alias -g '...'='../..'
alias -g 'COLOR'='--color=auto'

# ---------------------------
# Command aliases
# ---------------------------
case $(uname -s) in
    Linux)
        alias l='ls -F COLOR'
        alias ls='ls -F COLOR'
        alias ll='ls -lF COLOR'
        alias la='ls -laF COLOR'
        alias ltr='ls -ltrFh COLOR'
        alias lm='ls -alF COLOR'
    ;;
    Darwin)
        # -G for color on OSX
        alias l='ls -FG'
        alias ls='ls -FG'
        alias ll='ls -l -FG'
        alias la='ls -la -FG'
        alias ltr='ls -ltrh -FG'
        alias lm='ls -al -FG'
    ;;
    *)
        # Leave aliases alone if OS is unknown
    ;;
esac

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias c='clear'
alias h='history'

alias md='mkdir'
alias rd='rmdir'

alias grep='grep COLOR'
alias egrep='egrep COLOR'

# git
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
alias gt='git tree' # https://github.com/knugie/git-status-tree

# Docker
alias dps="docker ps"
alias di="docker images"

# Kubernetes
alias kc="kubectl"

# Misc
alias f="find . -iname"
alias rg="rg --glob '!vendor'"
alias i="invoke"

# util
alias stamp="ts '[%H:%M:%S]'"
alias total="awk \'{s+=$1} END {print s}\'"

# Use neovim!
alias vim='nvim'
alias v='nvim'
alias vimdiff='nvim -d'
alias vd='nvim -d'

# ---------------------------
# History
# ---------------------------
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# Multiple zsh instances share history file
setopt append_history
# Don't save history for immediately repeated commands
#setopt hist_ignore_dups
# Don't save any duplicate commands at all
setopt hist_ignore_all_dups
# Commands preceded with a space won't be saved
setopt hist_ignore_space

# ---------------------------
# Miscellaneous options
# ---------------------------
# Automatically cd to dir given on command line
setopt autocd
setopt extendedglob
setopt notify
# Tab completion from both ends
setopt completeinword
# Don't beep
unsetopt beep

# Better completion for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# Emacs keybindings, to be closer to bash
bindkey -e

# Display CPU usage stats for commands taking more than N seconds
REPORTTIME=5

# ---------------------------
# Add more Emojis to your life
# ---------------------------
# Install with: pip install emoji-fzf
alias emoj="emoji-fzf preview | fzf --preview 'emoji-fzf get --name {1}' | cut -d \" \" -f 1 | emoji-fzf get"

# ---------------------------
# Functions
# ---------------------------
hist_most () {
  fc -il 1 | awk '{print $4}' | sort | uniq -c | sort -rn | head -${1:=10}
}

# ---------------------------
# fzf
# ---------------------------
# must come after prezto
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ---------------------------
# Prompt
# ---------------------------
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# go path stuff
export GOPATH="$HOME/go"
export PATH=$GOPATH/bin:$PATH
export CDPATH=.:$GOPATH/src/github.com:$GOPATH/src/golang.org:$GOPATH/src

export PATH="/usr/local/bin:$PATH"

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship
