# Bash specific shell settings

# bash specific aliases
alias reload="source ~/.bash_profile && bind -f ~/.inputrc"

# History
export HISTSIZE=32768;
export HISTFILESIZE="${HISTSIZE}";
export SAVEHIST=4096
export HISTCONTROL=ignoredups:erasedups

# Recursive globbing with "**"
if [ ${BASH_VERSINFO[0]} -ge 4 ]; then
  shopt -s globstar
fi

# homebrew Bash bash-completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# gcloud command completion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

# enhance terminal prompt
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
KUBE_PS1_SYMBOL_USE_IMG=true
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\W \e[m$(kube_ps1)\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
