# Add ~/.bin/osx to PATH
[[ -d $HOME/.bin/osx ]] && export PATH=$HOME/.bin/osx:$PATH

export EDITOR="text --wait"

export HOMEBREW_NO_ANALYTICS=1

# Register SSH key to agent
ssh-add ~/.ssh/id_rsa

# Add aliases to toggle desktop files
alias desktop-hide-files='defaults write com.apple.finder CreateDesktop false; killall Finder'
alias desktop-show-files='defaults write com.apple.finder CreateDesktop true; killall Finder'
