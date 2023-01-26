#!/bin/bash

GITHUB_REF=$1
prod_repo=$2
ssh_command="ssh -o StrictHostKeyChecking=no"
if [ $GITHUB_REF = refs/heads/master ]; then
  curl -H "authorization: Bearer $TOKEN" -H "Accept: application/vnd.github.ant-man-preview+json" \
      -X POST https://api.github.com/repos/expertanalytics/website/deployments \
      -d "{\"ref\": \"$GITHUB_REF\", \"auto_merge\": false, \"required_contexts\": []}" \
      | jq -r .statuses_url > .statuses_url
  cd public
  echo expertanalytics.no > CNAME
  git init
  git config user.name builds.sr.ht
  git config user.email post@expertanalytics.no
  git config core.sshCommand "$ssh_command"
  git add .
  git commit -m 'Deploy from sr.ht'
  git push $prod_repo @:master --force
  cd ~
  env_url=https://expertanalytics.no/
else
  mkdir -p ~/.ssh
  echo "$SYNC_KEY" > ~/.ssh/id_rsa
  chmod 0700 ~/.ssh
  chmod 600 ~/.ssh/id_rsa
  env_name=$(echo ${GITHUB_REF##*/} | tr '[:upper:]' '[:lower:]')
  curl -H "authorization: Bearer $TOKEN" -H "Accept: application/vnd.github.ant-man-preview+json" \
      -X POST https://api.github.com/repos/expertanalytics/website/deployments \
      -d "{\"ref\": \"$GITHUB_REF\", \"environment\": \"pr-$env_name\", \"auto_merge\": false, \"required_contexts\": []}" \
      | jq -r .statuses_url > .statuses_url
  env_url=http://$env_name.pr.dev.xal.no/
  echo
  rsync -e "$ssh_command" --delete -rv public/ deploy@dev.xal.no:www/pr/$env_name
fi
echo
curl -H "authorization: Bearer $TOKEN" -H "Accept: application/vnd.github.ant-man-preview+json" \
  -X POST $(cat .statuses_url) \
  -d "{\"state\": \"success\", \"environment_url\": \"$env_url\"}"
