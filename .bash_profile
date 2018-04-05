# Choose homebrew bins first
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

# unlimited-ish history file
HISTFILESIZE=1000000000
HISTSIZE=1000000000

# Add ssh keys with passphrases to keychain
ssh-add -A 2>/dev/null

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# AWS completion
complete -C aws_completer aws

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxexexabagacad
export CDPATH=.:~:~/repos:~/sites

alias ll='ls -alh'
alias tac=gtac
alias sb='source ~/.bash_profile'
alias fdns='echo "Flushing DNS..."; sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'
alias brewup='brew update && echo "Outdated:" && brew outdated'
alias brewupg="brew outdated | tr '\n' ' ' |  sed 's/mysql //g' | xargs brew upgrade"
alias gyb="python3 gyb.py"
alias fixcam='sudo killall VDCAssistant && sudo killall AppleCameraAssistant'
alias py='python manage.py runserver'
alias torstatus='cd ansible-jmo && ansible tor-relays -m shell -a "systemctl status tor" && cd -'

# git commands
alias gs='git status'
alias gh='git push'
alias gl='git pull'
alias ga='git add -A && git status'
function gc { git commit -m "$1"; }
alias rebase-dev='!(git pull || true) && git checkout dev && git pull && git checkout - && git rebase dev'

mygrants() {
  mysql -B -N $@ -e "SELECT DISTINCT CONCAT(
    'SHOW GRANTS FOR \'', user, '\'@\'', host, '\';'
    ) AS query FROM mysql.user" | \
  mysql $@ | \
  sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/## \1 ##/;/##/{x;p;x;}'
}

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@mbp\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
#export PS1='\u@mbp \w$(__git_ps1)\$ '

export WORKON_HOME=~/.virtualenvs/
#source /usr/local/bin/virtualenvwrapper.sh

export CUJO_DATABASE_USER="django_tester"
export CUJO_DATABASE_PASSWORD="password"
