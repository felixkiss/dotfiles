export PATH=$PATH:/snap/bin

# Add ~/.bin/linux to PATH
[[ -d $HOME/.bin/linux ]] && export PATH=$HOME/.bin/linux:$PATH

function hashed-hostname {
  hostname | sha1sum -b | cut -f1 -d" " | base64
}
