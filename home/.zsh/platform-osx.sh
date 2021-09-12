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

# Add homebrew ruby to PATH
[[ -d /usr/local/opt/ruby/bin ]] && export PATH="/usr/local/opt/ruby/bin:$PATH"
[[ -d /usr/local/lib/ruby/gems/2.7.0/bin ]] && export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
