# Add ~/.bin/osx to PATH
[[ -d $HOME/.bin/osx ]] && export PATH=$HOME/.bin/osx:$PATH

export EDITOR="text --wait"

export HOMEBREW_NO_ANALYTICS=1

# Register SSH key to agent
# ssh-add ~/.ssh/id_rsa

# Add aliases to toggle desktop files
alias desktop-hide-files='defaults write com.apple.finder CreateDesktop false; killall Finder'
alias desktop-show-files='defaults write com.apple.finder CreateDesktop true; killall Finder'

# Add aliases for brew services
alias brew-start='brew services start'
alias brew-stop='brew services stop'
alias brew-services='brew services list'

# Use Google Chrome for Launchy
export LAUNCHY_APPLICATION="open -a Google\ Chrome"

# Fix ruby crashes on macOS Mojave
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Add mysql binaries to PATH
[[ -d /usr/local/opt/mysql@5.7 ]] && export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Ruby homebrew shit
[[ -d /usr/local/opt/ruby/bin ]] && export PATH="/usr/local/opt/ruby/bin:$PATH"
[[ -d /usr/local/lib/ruby/gems/2.7.0/bin ]] && export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
[[ -d /usr/local/opt/ruby/lib ]] && export LDFLAGS="-L/usr/local/opt/ruby/lib"
[[ -d /usr/local/opt/ruby/include ]] && export CPPFLAGS="-I/usr/local/opt/ruby/include"
[[ -d /usr/local/opt/ruby/lib/pkgconfig ]] && export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"


# Install broot shell function. See https://dystroy.org/broot/install
[[ -f ~/.config/broot/launcher/bash/br ]] && source ~/.config/broot/launcher/bash/br

# Add Cargo to PATH
if [[ -d "$HOME/.cargo" ]]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

# Google Cloud SDK
[[ -f "$HOME/code/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/code/google-cloud-sdk/path.zsh.inc"
[[ -f "$HOME/code/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/code/google-cloud-sdk/completion.zsh.inc"

# pipx (python)
[[ -d ~/.local/bin ]] && export PATH="$PATH:~/.local/bin"

# Add Go projects to PATH
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Add npm bins to PATH
export PATH=./node_modules/.bin:$PATH

# Add rails binaries to PATH
export PATH=./bin:$PATH
