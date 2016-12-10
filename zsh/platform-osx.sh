# Add ~/.bin/osx to PATH
[[ -d $HOME/.bin/osx ]] && export PATH=$HOME/.bin/osx:$PATH

export EDITOR="text --wait"

export HOMEBREW_NO_ANALYTICS=1

# Register SSH key to agent
ssh-add ~/.ssh/id_rsa
