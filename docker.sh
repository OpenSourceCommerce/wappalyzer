#!/bin/bash

IMAGE="scalecommerce/wappalyzer"
TAG="$1"

if [ "$TAG" == "" ]; then
  echo "Please add release TAG parameter"
  echo "./docker.sh v1.0.0"
  exit 1
fi

yarn install
yarn run link

cd "src/drivers/npm"
docker build -t "$IMAGE:$TAG" -t "$IMAGE:latest" .
