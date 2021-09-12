# Load stuff depending on user
#
# For example, some comfort things we only want enable for
# normal users and never for root

if [[ "$USER" -eq "root" ]]; then
  source ~/.zsh/user-root.sh
elif; then
  source ~/.zsh/user-normal.sh
fi
