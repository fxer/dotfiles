# zsh specific shell settings

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'

plugins=()

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# https://github.com/bhilburn/powerlevel9k/blob/master/functions/colors.zsh
# `virtualenv` default color is blue, which matches the `dir` color. give them a little definition.
POWERLEVEL9K_VIRTUALENV_BACKGROUND="mediumpurple3"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="white"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history command_execution_time time)

# oh-my-zsh script location
source $ZSH/oh-my-zsh.sh

# zsh specific aliases
alias reload="source $HOME/.zshrc"

# Activate common bash/zsh aliases and such
source $HOME/.profile

# gcloud command completion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Enable autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# My workflow is 6 term tabs open each working on diff projects, so sharing history across them isn't helpful
unsetopt share_history
