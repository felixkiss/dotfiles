# Set LANG
export LANG="en_US.UTF-8"

# Use oh-my-zsh if installed
[[ -d ~/.oh-my-zsh ]] && source ~/.zsh/oh-my-zsh.sh

# Load aliases
source ~/.zsh/aliases.sh

# Set base PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Load platform specific settings
source ~/.zsh/platform.sh

# Add ~/.bin/base to PATH
export PATH=$HOME/.bin/base:$PATH

# Load rbenv if installed
[[ -d ~/.rbenv ]] && eval "$(rbenv init -)"
