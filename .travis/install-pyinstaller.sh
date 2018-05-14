#!/bin/bash -e

_pyinstaller_develop="https://github.com/pyinstaller/pyinstaller/archive/develop.zip"

_version=${PYINSTALLER_VERSION}

if [[ "${_version}" == "develop" ]]; then
    pip install ${_pyinstaller_develop}
else if [[ -n ${_version} ]]; then
    pip install pyinstaller==${_version}
else
    echo >&2 "Must define PYINSTALLER_VERSION"
    exit 1
fi
