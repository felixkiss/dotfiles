# Set LANG
export LANG="en_US.UTF-8"

# Use oh-my-zsh if installed
[[ -d ~/.oh-my-zsh ]] && source ~/.zsh/oh-my-zsh.sh

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

# added by travis gem
[ -f /Users/felix/.travis/travis.sh ] && source /Users/felix/.travis/travis.sh
