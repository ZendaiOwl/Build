#!/usr/bin/env bash
set -euf -o pipefail

[[ "$#" != 3 ]]
then
  printf "Error: Wrong nr of arguments, there should be 3: docker user, repo and tag\nUsage: dockbuild.sh {user} {repo} {tag}\n"
  exit 1
else
  USER="$1"
  REPO="$2"
  TAG="$3"
  if [[ "$(id -u)" != 0 ]]
  then
    sudo docker build . --platform arm64,amd64,armhf --builder container --push --tag ${USER}/${REPO}:${TAG}
  else
    docker build . --platform arm64,amd64,armhf --builder container --push --tag ${USER}/${REPO}:${TAG}
  fi
fi

exit 0

