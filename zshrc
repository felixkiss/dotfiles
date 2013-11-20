# Use oh-my-zsh if installed
[[ -d ~/.oh-my-zsh ]] && source ~/.zshrc.oh-my-zsh

# PATH management
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Add ~/.bin to PATH
export PATH=$HOME/.bin:$PATH

# Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin

source ~/.rvm/scripts/rvm
