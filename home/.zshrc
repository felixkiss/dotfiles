# Set LANG
export LANG="en_US.UTF-8"

# Tell bundler I prefer Git over SSH
export BUNDLER_USE_SSH=true

# Use oh-my-zsh if installed
[[ -d ~/.oh-my-zsh ]] && source ~/.zsh/oh-my-zsh.sh

# Load aliases
source ~/.zsh/aliases.sh

# Set base PATH
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Load platform specific settings
source ~/.zsh/platform.sh

# Load user specific settings
source ~/.zsh/user.sh

# Load host specific settings
source ~/.zsh/host.sh
