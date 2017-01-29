#!/usr/bin/env bash
set -e

IMG=histrio/rake-build:v6

if [ ! -d "Gemfile" ]
then
    echo "Must be run from gem dir."
    exit 1
fi

DST="./builds/"
CONT=rake-build_$(echo $RANDOM | tr '[0-9]' '[a-zA-Z]')
workdir="/docker_rakebuild"

docker run --name "$CONT" -v "$PWD":"$workdir":ro,z -w "$workdir" \
     "$IMG" cd "$workdir" && rake build
docker cp "$CONT":/kuberdock.rpm "$DST"
docker rm -f "$CONT"
