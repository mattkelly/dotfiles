# ============================================================================
# Shows only contextually relevant info, stays totally clean otherwise.
# ============================================================================

# No extra newlines
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

# Minimal separator strategy
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=' '

# Colors are subtle but readable
typeset -g POWERLEVEL9K_FOREGROUND=250
typeset -g POWERLEVEL9K_BACKGROUND=NONE

# One-line layout: everything is on the left except errors/durations
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  dir                 # current directory
  vcs                 # git branch & status
  kubecontext         # kubectl context
  pyenv               # python virtualenv
  go_version          # go version when relevant
  node_version        # node version when relevant
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  command_execution_time
  status
)

# Directory appearance
typeset -g POWERLEVEL9K_DIR_FOREGROUND=33
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_first_and_last

# Git settings
typeset -g POWERLEVEL9K_VCS_FOREGROUND=39
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=''
typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON='*'
typeset -g POWERLEVEL9K_VCS_STAGED_ICON='+'
typeset -g POWERLEVEL9K_VCS_CLEAN_ICON='✓'
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=244
typeset -g POWERLEVEL9K_VCS_UNSTAGED_FOREGROUND=178
typeset -g POWERLEVEL9K_VCS_STAGED_FOREGROUND=70

# Perf tuning
typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1
typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0.05

# Kubernetes context
typeset -g POWERLEVEL9K_KUBECONTEXT_PREFIX='⎈ '
typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_DEFAULT=false
typeset -g POWERLEVEL9K_KUBECONTEXT_FOREGROUND=75

# Python venv
typeset -g POWERLEVEL9K_PYENV_FOREGROUND=36
typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false

# Go version
typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=37
typeset -g POWERLEVEL9K_GO_VERSION_SHOW_ON_COMMAND='go'

# Node version
typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=70
typeset -g POWERLEVEL9K_NODE_VERSION_SHOW_ON_COMMAND='node npm yarn pnpm'

# Command execution time (only show if >2s)
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=2000
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='%s'

# Exit status (only show when non-zero)
typeset -g POWERLEVEL9K_STATUS_OK=false
typeset -g POWERLEVEL9K_STATUS_ERROR=true
typeset -g POWERLEVEL9K_STATUS_VERBOSE=false
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=196

# Instant prompt (fast startup)
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

