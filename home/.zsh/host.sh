# Load stuff depending on hostname
#
# For example, aliases to switch to deploy user and certain directory on shell init

deployer_servers=(
  NWY3NmVjODI2MTE2NTYzZTI1NTc2ZDg3MDk3NWE2OGRlN2ZjNmE5Nwo=
  NDY4ZWNmZTE5NWNhNWE5YWQ1NjY1NjU0MjE0OGU0OGUzNDZhN2QzOQo=
  NGEzYzdiOGFhNTA2MDk0M2NjNDNlYjgzOWJjOWVkZjJiM2RiYjk5Nwo=
  NDkxOGZjZjBmYzg4YzkzY2IwOTg5NjRiMWE0NTgyYWNkNDJhN2E5MQo=
)
current = hashed-hostname

if (($deployer_servers[(Ie)$current])); then
  source ~/.zsh/host-deployer.sh
fi
