
export OSH_THEME="powerline-multiline"
export POWERLINE_LEFT_PROMPT="scm cwd"
export POWERLINE_RIGHT_PROMPT="clock user_info"

#export OSH_THEME="agnoster"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# UPDATE_OSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"
# OSH_CUSTOM=/path/to/new-custom-folder


plugins=(
  git
  bashmarks
  nvm
  sdkman
  progress
  npm
)

completions=(
  git
  ssh
  docker-compose
  docker
  npm
  nvm
)
