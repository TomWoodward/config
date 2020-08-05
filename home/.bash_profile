[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#exports
#======================================================================
export CLICOLOR=1
export TERM=xterm-256color

export PATH=${PATH}:~/.bin
export PATH=${PATH}:~/.composer/vendor/bin
export PATH=${PATH}:~/Library/Python/2.7/bin
export PATH=${PATH}:~/Library/Android/sdk/platform-tools/
export PATH=${PATH}:~/.gem/ruby/2.3.0/bin
export PATH=${PATH}:/usr/local/php5/bin
export PATH="$PATH:$HOME/.rbenv/bin"

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
alias e="vim"

function setupstream() {
  git branch --set-upstream-to="origin/$(git symbolic-ref --short HEAD)"
}

gpr() {
  branch=$(git rev-parse --abbrev-ref HEAD)
  baseurl=$(git remote get-url origin | sed 's/^git@github\.com:\(.*\)\.git$/https:\/\/github.com\/\1/')
  url="$baseurl/compare/master...$branch?expand=1"
  open -a /Applications/Google\ Chrome.app "$url"
}

#prompt
#======================================================================
CYAN="\[\e[0;36m\]"
GREEN="\[\e[0;32m\]"
PURPLE="\[\e[0;35m\]"
BLUE="\[\e[1;34m\]"

function ref() {
  if [ -z "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
    return
  fi
  if [ -z "$(git rev-parse --verify HEAD 2>/dev/null)" ]; then
    return
  fi
  branch=$(git rev-parse --abbrev-ref HEAD)
  if [ "$branch" != "master" ]; then
    echo "[$branch]"
  fi
}

function sha() {
  git rev-parse --short HEAD 2>/dev/null | sed -e "s/\(.*\)/\[\1\]/" || return
}

function pos() {
  if [ -z "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
    return
  fi
  if [ -z "$(git rev-parse --verify HEAD 2>/dev/null)" ]; then
    return
  fi
  fork_point=$(git merge-base --fork-point origin/master)
  fork_count=$(if [ -n "$fork_point" ]; then git rev-list --count "$fork_point"; else echo "0"; fi;)
  head_count=$(git rev-list --count HEAD)
  echo "[$fork_count.$(( head_count - fork_count ))]"
}

PS1="$CYAN\$(pos)$GREEN\$(ref)$PURPLE\$(sha)$BLUE\w\[\e[0m\]: "
export GPG_TTY=$(tty)

eval "$(rbenv init -)"
