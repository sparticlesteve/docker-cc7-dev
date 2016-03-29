#!/bin/bash

set -e

# Image to push
imageName=sfarrell/cc7-dev

# Push the image to docker-hub
echo "Pushing $imageName to docker-hub"
sudo docker push $imageName
