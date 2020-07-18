# Zsh aliases
alias reload='source ~/.zshrc'

# Git aliases
alias gs='git status'
alias gl='git log'
alias gst='git stash'
alias gstp='git stash pop'
alias gmo='git merge origin/$(git rev-parse --abbrev-ref HEAD)'
alias gpo='git push -u origin $(git rev-parse --abbrev-ref HEAD)'

# Laravel aliases
alias art='php artisan'
alias vm='ssh vagrant@127.0.0.1 -p 2222'
alias deploy='dep deploy'
alias mix='yarn watch'

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
alias tunnel-staging-shared-redis='gcloud beta compute start-iap-tunnel --project meister-accounts-staging accounts-staging-redis-shared 6379'
alias gssh='gcloud compute ssh --project meisterlabs-staging'

# Docker aliases
function docker-build-and-bash {
	docker build $* --tag foo .
	docker run -it foo bash
}

# Dokku
[ -f ~/code/dokku/contrib/dokku_client.sh ] && alias dokku='~/code/dokku/contrib/dokku_client.sh'
