# Add ~/.bin/base to PATH
export PATH=$HOME/.bin/base:$PATH

# Add ./vendor/bin and global composer bin to PATH (for Composer projects)
export PATH=./vendor/bin:$HOME/.composer/vendor/bin:$PATH

# Add npm bins to PATH
export PATH=./node_modules/.bin:$PATH

# Add Go projects to PATH
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Ruby homebrew shit
[[ -d /usr/local/opt/ruby/bin ]] && export PATH="/usr/local/opt/ruby/bin:$PATH"
[[ -d /usr/local/opt/ruby/lib ]] && export LDFLAGS="-L/usr/local/opt/ruby/lib"
[[ -d /usr/local/opt/ruby/include ]] && export CPPFLAGS="-I/usr/local/opt/ruby/include"
[[ -d /usr/local/opt/ruby/lib/pkgconfig ]] && export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# Load rbenv if installed
[[ -d ~/.rbenv ]] && eval "$(rbenv init -)"

# Add rails binaries to PATH
export PATH=./bin:$PATH

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

# Add Cargo to PATH
if [[ -d "$HOME/.cargo" ]]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

# Google Cloud SDK
[[ -f "$HOME/code/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/code/google-cloud-sdk/path.zsh.inc"
[[ -f "$HOME/code/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/code/google-cloud-sdk/completion.zsh.inc"
