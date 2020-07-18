# Set LANG
export LANG="en_US.UTF-8"

# Tell bundler I prefer Git over SSH
export BUNDLER_USE_SSH=true

# Use oh-my-zsh if installed
[[ -d ~/.oh-my-zsh ]] && source ~/.zsh/oh-my-zsh.sh

# Install broot shell function. See https://dystoy.org/broot/install
source /Users/felix/.config/broot/launcher/bash/br

# Load aliases
source ~/.zsh/aliases.sh

# Set base PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

# Load platform specific settings
source ~/.zsh/platform.sh

# Add ~/.bin/base to PATH
export PATH=$HOME/.bin/base:$PATH

# Add ./vendor/bin and global composer bin to PATH (for Composer projects)
export PATH=./vendor/bin:$HOME/.composer/vendor/bin:$PATH

# Add npm bins to PATH
export PATH=./node_modules/.bin:$PATH

# Add Go projects to PATH
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Load rbenv if installed
[[ -d ~/.rbenv ]] && eval "$(rbenv init -)"

# Add rails binaries to PATH
export PATH=./bin:$PATH

# Add mysql binaries to PATH
[[ -d /usr/local/opt/mysql@5.7 ]] && export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# [[ -d ~/.rvm ]] && export PATH="$PATH:$HOME/.rvm/bin"

# Add NVM
if [[ -d "$HOME/.nvm" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Add Cargo to PATH
if [[ -d "$HOME/.cargo" ]]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

# Google Cloud SDK
if [ -f '/Users/felix/code/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/felix/code/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/felix/code/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/felix/code/google-cloud-sdk/completion.zsh.inc'; fi
