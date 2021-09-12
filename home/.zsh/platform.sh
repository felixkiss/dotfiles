# Load stuff depending on platform
#
# For example, some things we only need on macOS

if [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]]; then
  source ~/.zsh/platform-ubuntu.sh
elif [[ "$OSTYPE" =~ ^darwin ]]; then
  source ~/.zsh/platform-osx.sh
fi
