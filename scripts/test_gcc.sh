#!/bin/bash

# Test the GCC version in our container
imageName=sfarrell/cc7-dev

# Get the version from the container
expectedVer="4.9.3"
actualVer=`sudo docker run $imageName:gcc49 gcc -dumpversion`

if [[ $actualVer != $expectedVer ]]; then
    echo "Wrong GCC version: $actualVer, expected $expectedVer"
    exit 1
fi

echo "GCC version is correct: $actualVer"
