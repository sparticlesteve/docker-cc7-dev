#!/bin/bash

# Bail if error
set -e

# Name of our image to build
imageName=sfarrell/cc7-dev
# Tag to create
tagName=gcc49

# Pull the latest base image
sudo docker pull sfarrell/cc7-basic:latest

# Build and tag "latest"
echo "Building $imageName..."
sudo docker build -t $imageName .

# Tag the image
imageID=`sudo docker images -q $imageName:latest`
echo "Tagging $imageID as $tagName..."
sudo docker tag $imageID $imageName:$tagName
