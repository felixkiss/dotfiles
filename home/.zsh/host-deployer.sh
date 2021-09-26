if [[ "$USER" == "deploy" ]]; then
  # start in default app directory
  cd "$(ls -d /data/apps/* | head -n 1)/current" || cd /data/apps
else
  alias deploy='sudo su - deploy'
fi
