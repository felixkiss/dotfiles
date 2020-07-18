# Add ~/.bin/osx to PATH
[[ -d $HOME/.bin/osx ]] && export PATH=$HOME/.bin/osx:$PATH

export EDITOR="text --wait"

export HOMEBREW_NO_ANALYTICS=1

# Register SSH key to agent
ssh-add ~/.ssh/id_rsa

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/dotfiles/bin/osx/google-cloud-sdk/path.zsh.inc' ]; then . '~/dotfiles/bin/osx/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/dotfiles/bin/osx/google-cloud-sdk/completion.zsh.inc' ]; then . '~/dotfiles/bin/osx/google-cloud-sdk/completion.zsh.inc'; fi
