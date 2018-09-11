# Keep things you don't want checked into the repo here
source ~/.bash_secrets

# Choose homebrew installed apps first
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# History
export HISTSIZE=32768;
export HISTFILESIZE="${HISTSIZE}";
export SAVEHIST=4096
export HISTCONTROL=ignoredups:erasedups

# Wrapping is annoying, espeically in psql
export PAGER="less --chop-long-lines --no-init --quit-if-one-screen"

# Recursive globbing with "**"
if [ ${BASH_VERSINFO[0]} -ge 4 ]; then
  shopt -s globstar
fi

# homebrew bash4 bash-completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# homebrew gcp command completion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

# homebrew
alias brewup='brew update && echo "Outdated:" && brew outdated && brew cask outdated'
alias brewupg="brew upgrade && brew cask upgrade && brew cleanup && brew prune"

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxexexabagacad
export CDPATH=.:~:~/repos:~/repos/go/src/gitlab.com/breadwallet

# Directory listing/traversal
alias l="ll"
alias ll="ls -lAh"
alias lt="ls -lAhtr"

alias ..="cd .."
alias ...="cd ../.."

# Shortcuts
alias reload="source ~/.bash_profile && bind -f  ~/.inputrc"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Development
alias gyb="python3 gyb.py"
alias py='python manage.py runserver'
alias torstatus='cd ansible-jmo && ansible tor-relays -m shell -a "systemctl status tor" && cd -'

export GOPATH="${HOME}/.go;${HOME}/repos/go"

# calc some hashes
alias sha="sha256"
function sha1() { get_sha 1 $1; }
function sha256() { get_sha 256 $1;}
function sha512() { get_sha 512 $1;}
function get_sha() { echo -n "$2" | openssl sha -sha$1; }

export WORKON_HOME=~/.virtualenvs/    # Python venv locaiton for virtualenvwrapper

export CUJO_DATABASE_USER="django_tester"
export CUJO_DATABASE_PASSWORD="password"

# macOS hacks
alias fdns='echo "Flushing DNS..."; sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'
alias fixcam='sudo killall VDCAssistant && sudo killall AppleCameraAssistant'
alias updatedb="sudo /usr/libexec/locate.updatedb"

# git
alias gs='git status'
alias gh='git push'
alias gl='git pull'
alias ga='git add -A && git status'
function gc { git commit -m "$1"; }
alias rebase-dev="!(git pull || true) && git checkout dev && git pull && git checkout - && git rebase dev"

# GCP
alias gssh='gcloud compute ssh --project='
alias k='kubectl'

# enhance terminal prompt with git repo info
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
