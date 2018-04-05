# Choose homebrew installed apps first
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

# unlimited-ish history file
HISTFILESIZE=1000000000
HISTSIZE=1000000000

# homebrew bash4 bash-completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# AWS completion
complete -C aws_completer aws

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxexexabagacad
export CDPATH=.:~:~/repos:~/sites

# Directory listing/traversal
alias l="ll"
alias ll="ls -lAh"
alias lt="ls -lAhtr"

alias ..="cd .."
alias ...="cd ../.."

# Shortcuts
alias reload="source ~/.bash_profile"

# Development
alias gyb="python3 gyb.py"
alias py='python manage.py runserver'
alias torstatus='cd ansible-jmo && ansible tor-relays -m shell -a "systemctl status tor" && cd -'

export WORKON_HOME=~/.virtualenvs/    # Python venv locaiton for virtualenvwrapper

export CUJO_DATABASE_USER="django_tester"
export CUJO_DATABASE_PASSWORD="password"

# macOS hacks
alias fdns='echo "Flushing DNS..."; sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'
alias fixcam='sudo killall VDCAssistant && sudo killall AppleCameraAssistant'

# homebrew
alias brewup='brew update && echo "Outdated:" && brew outdated'

# git
alias gs='git status'
alias gh='git push'
alias gl='git pull'
alias ga='git add -A && git status'
function gc { git commit -m "$1"; }
alias rebase-dev="!(git pull || true) && git checkout dev && git pull && git checkout - && git rebase dev"

# enhance terminal prompt with git repo info
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\[\033[32m\]\u@mbp\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ "
