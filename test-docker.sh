#!/bin/sh -e

_image="pyinstaller-signal-handling"
docker build -t ${_image} .

docker run --rm ${_image}
