#!/bin/bash

docker buildx build $DOCKER_ARGS \
    --build-arg DD_API_KEY=$DD_API_KEY \
    --build-arg SECRET_KEY_BASE=$SECRET_KEY_BASE \
    .
rc=$?

if [ $rc -ne 0 ]; then
  echo -e "Docker build failed"
  exit $rc
fi
