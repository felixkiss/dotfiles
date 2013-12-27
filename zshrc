# Set LANG
export LANG="en_US.UTF-8"

# Use oh-my-zsh if installed
[[ -d ~/.oh-my-zsh ]] && source ~/.zshrc.oh-my-zsh

# Load aliases
[[ -f ~/.zsh-aliases ]] && source ~/.zsh-aliases

# PATH management
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Add ~/.bin to PATH
export PATH=$HOME/.bin:$PATH

# Add rbenv to PATH
eval "$(rbenv init -)"
