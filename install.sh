#!/bin/bash

rsync -rtv ./home/ ~/

if [[ -z "$(which brew)" ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle

if [ ! -d "$NVM_DIR" ]; then
  NVM_VERSION=`curl --silent "https://api.github.com/repos/creationix/nvm/releases/latest" | jq -r .tag_name`
  curl -o- https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash
fi

. ~/.bash_profile

cp ./node_default_packages $NVM_DIR/default-packages

nvm install stable
nvm alias default stable

if [[ -z "$(which pip)" ]]; then
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python get-pip.py --user
  rm get-pip.py
fi

pip install -r requirements.txt

# from https://github.com/geerlingguy/mac-dev-playbook/issues/26
osascript <<EOD
tell application "Terminal"
  local allOpenedWindows
  local initialOpenedWindows
  local windowID
  set themeName to "TomWoodward" (* Set the name of the theme*)
  set initialOpenedWindows to id of every window
  do shell script "open 'TomWoodward.terminal'"
  delay 1
  set default settings to settings set themeName
  set allOpenedWindows to id of every window
  repeat with windowID in allOpenedWindows
    if initialOpenedWindows does not contain windowID then
      close (every window whose id is windowID)
    end if
  end repeat
end tell
EOD
