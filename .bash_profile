. ~/.git-completion.bash

#exports
#======================================================================
export CLICOLOR=1
export TERM=xterm-256color

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:~/.composer/vendor/bin
export PATH=${PATH}:~/Library/Python/2.7/bin
export PATH=${PATH}:/usr/local/php5/bin
export PATH=${PATH}:~/.instantclient_12_1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export JAVA_HOME=`/usr/libexec/java_home`;

#docker shortcuts
#======================================================================
dssh() {
  docker exec -ti $1 /bin/bash
}
alias drun="docker-compose run web"
alias dash="docker-compose run web /bin/bash"
alias dkill="docker kill \$(docker ps -q)"
alias drmc="docker rm -v \$(docker ps -aq)"
alias drmi="docker rmi \$(docker images -q)"

#misc
#======================================================================
alias gs="git status";
alias l="ls -lhaG";
alias dl="node ~/.daftlabs/src/main.js";

alias e="vim ."

generateCode() {
  for (( i=1; i<=$1; i++ ))
  do
    echo "$2`</dev/urandom LC_CTYPE=C tr -dc 'A-HJ-NP-Z2-9' | fold -w $3 | head -n 1`"
  done
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
