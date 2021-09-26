# Add ~/.bin/base to PATH
export PATH=$HOME/.bin/base:$PATH

# Add ./vendor/bin and global composer bin to PATH (for Composer projects)
export PATH=./vendor/bin:$HOME/.composer/vendor/bin:$PATH

# Load rbenv if installed
[[ -d ~/.rbenv ]] && eval "$(rbenv init -)"

# added by travis gem
[[ -f ~/.travis/travis.sh ]] && source ~/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# [[ -d ~/.rvm ]] && export PATH="$PATH:$HOME/.rvm/bin"

# Add NVM
if [[ -d "$HOME/.nvm" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
