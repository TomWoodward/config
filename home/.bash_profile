. ~/.git-completion.bash

#exports
#======================================================================
export CLICOLOR=1
export TERM=xterm-256color

export PATH=${PATH}:~/.composer/vendor/bin
export PATH=${PATH}:~/Library/Python/2.7/bin
export PATH=${PATH}:/usr/local/php5/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#docker shortcuts
#======================================================================
alias dkill="docker kill \$(docker ps -q)"
alias drmc="docker rm -v \$(docker ps -aq)"
alias drmi="docker rmi \$(docker images -q)"

#misc
#======================================================================
alias gs="git status";
alias l="ls -lhaG";
alias e="vim ."

function setupstream() {
  git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD)
}

gpr() {
  branch=`git branch | grep "*" | sed 's/* //'`
  baseurl=`git remote get-url origin | sed 's/^git@github\.com:\(.*\)\.git$/https:\/\/github.com\/\1/'`
  url=$baseurl/compare/master...$branch?expand=1
  open -a /Applications/Google\ Chrome.app $url
}

#prompt
#======================================================================
RED="\[\e[0;31m\]"
CYAN="\[\e[0;36m\]"
GREEN="\[\e[0;32m\]"
LGREEN="\[\e[1;32m\]"
WHITE="\[\e[0;37m\]"
PURPLE="\[\e[0;35m\]"
BLUE="\[\e[1;34m\]"

function getTime() {
  date +%H:%M:%S
}

function ref() {
  git branch --no-color 2>/dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\[\1\]/" || return
}

function sha() {
  git rev-parse --short HEAD 2>/dev/null | sed -e "s/\(.*\)/\[\1\]/" || return
}

PS1="$GREEN\u@\h$WHITE[\$(getTime)]$CYAN\$(ref)$PURPLE\$(sha)$BLUE\w\[\e[0m\]: "
