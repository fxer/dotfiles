# Common shell settings between bash & zsh

# Keep things you don't want checked into the repo here
source ~/.profile_secrets

# http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
export LSCOLORS="ExFxCxDxBxegedabagaced"

# Get to my favorite paths faster
export CDPATH=.:~:~/repos:~/repos/go/src/gitlab.com/breadwallet

# Choose homebrew installed apps first
export PATH="/usr/local/sbin:$PATH"

# Wrapping is annoying, espeically in psql
export PAGER="less --chop-long-lines --no-init --quit-if-one-screen"

# Directory listing/traversal
alias ls='ls -G'
alias l='ll'
alias ll='ls -lAh'
alias ltime='ll -tr'    # list by timestamp, reversed
alias lz='ll -Sr'       # list by size, reversed
alias ..='cd ..'
alias ...='cd ../..'
alias grep='ggrep'      # use modern GNU grep, not old-and-busted macOS BSD grep

# homebrew
alias brewup='brew update && echo "Outdated:" && brew outdated && brew cask outdated'
alias brewupg="brew upgrade && brew cask upgrade && brew cleanup"

# calc some hashes
alias sha="sha256"
function sha1() { get_sha 1 $1; }
function sha256() { get_sha 256 $1;}
function sha512() { get_sha 512 $1;}
function get_sha() { echo -n "$2" | openssl sha -sha$1; }

# git
alias gs='git status'
alias gh='git push'
alias gl='git pull'
alias ga='git add -A && git status'
function gc { git commit -m "$1"; }
alias rebase-dev="!(git pull || true) && git checkout dev && git pull && git checkout - && git rebase dev"

# get external IP and print to stdout as well as copy IPv4 to clipboard
alias myip="dig -6 +short myip.opendns.com @resolver1.opendns.com AAAA && dig -4 +short myip.opendns.com @resolver1.opendns.com A | tee >(pbcopy)"

# Hex to decimal
function dehex() { echo $(($1)); }

# Development
alias gyb="python3 gyb.py"
alias py='python manage.py runserver'
alias torstatus='cd ansible-jmo && ansible tor-relays -m shell -a "systemctl status tor" && cd -'

# extra paths for golang src and bin files
export GOPATH="${HOME}/.go;${HOME}/repos/go"

# python helpers
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=~/.virtualenvs/    # Python venv locaiton for virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

export CUJO_DATABASE_USER="django_tester"
export CUJO_DATABASE_PASSWORD="password"

# macOS hacks
alias fixdns='echo "Flushing DNS..."; sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'
alias fixcam='sudo killall VDCAssistant && sudo killall AppleCameraAssistant'
alias updatedb="sudo /usr/libexec/locate.updatedb"

# Shorten a few commands (but maintain tab-completion)
alias gssh='gcloud compute ssh --project='
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'

# run kubectl commands showing all namespaces, but excluding the system namespace
alias ka='f(){ kubectl "$@" --all-namespaces | grep -v kube-system;  unset -f f; }; f'
