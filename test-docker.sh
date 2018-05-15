#!/bin/sh -e

_pyinstaller_version=3.3.1
if [[ -n $1 ]]; then
    echo "pyv: $1"
    _pyinstaller_version=$1
fi

_image="pyinstaller-signal-handling"
docker build --build-arg "PYINSTALLER_VERSION=${_pyinstaller_version}" -t ${_image} .

docker run --rm ${_image}
