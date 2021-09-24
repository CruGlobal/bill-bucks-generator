#!/bin/bash

docker build \
    --build-arg DD_API_KEY=$DD_API_KEY \
    --build-arg RAILS_MASTER_KEY=$RAILS_MASTER_KEY \
    -t 056154071827.dkr.ecr.us-east-1.amazonaws.com/$PROJECT_NAME:$ENVIRONMENT-$BUILD_NUMBER .
rc=$?

if [ $rc -ne 0 ]; then
  echo -e "Docker build failed"
  exit $rc
fi