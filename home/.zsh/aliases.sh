# Zsh aliases
alias reload='source ~/.zshrc'
alias dotfiles-update='cd ~/dotfiles && git pull && reload'

# SSH aliases
ssh-fingerprint () {
  if [ "$#" -eq 0 ]
  then
    echo "Usage: ssh-fingerprint example.org"
  else
    ssh $@ bash <<'EOF'
      for file in /etc/ssh/ssh_host_*.pub
      do
        ssh-keygen -l -f $file
      done
EOF
  fi
}

# Git aliases
alias gs='git status'
alias gl='git log'
alias gst='git stash'
alias gstp='git stash pop'
alias gmo='git merge origin/$(git rev-parse --abbrev-ref HEAD)'
alias gpo='git push -u origin $(git rev-parse --abbrev-ref HEAD)'

# Util
alias tree='tree -FL 2 --dirsfirst'

# Ansible aliases
alias ap='ansible-playbook'
alias pb='ansible-playbook'
alias av='ansible-vault'

ara () {
  echo "ansible all -m shell -a $@"
  ansible all -m shell -a $@
}

arag () {
  echo "ansible all -m shell -a \"hostname; $1; echo '\\\\n---'\" ${@: 2}"
  ansible all -m shell -a "hostname; $1; echo '\\n---'" ${@: 2}
}

# Laravel aliases
alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'
alias art='php artisan'
alias vm='ssh vagrant@127.0.0.1 -p 2222'
alias deploy='dep deploy'
alias rollback='dep rollback'
alias mix='yarn watch'
alias ppp='phpstan && php-cs-fixer fix --dry-run --diff -v && pest'

# Vagrant aliases
alias vs='vagrant status'
alias vu='vagrant up'
alias vd='vagrant destroy'

# RubyGems aliases
alias be='bundle exec'

# Rails aliases
alias rr='be rails'

# Jest aliases
alias jest-inspect='node --inspect-brk node_modules/.bin/jest --runInBand --watch'

# Meister aliases
# alias tunnel-staging-shared-redis='gcloud beta compute start-iap-tunnel --project meister-accounts-staging accounts-staging-redis-shared 6379'
# alias gssh='gcloud compute ssh --project meisterlabs-staging'

# Docker aliases
function docker-build-and-bash {
	docker build $* --tag foo .
	docker run -it foo bash
}
