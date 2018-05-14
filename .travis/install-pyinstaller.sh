#!/bin/bash -e

_pyinstaller_develop="https://github.com/pyinstaller/pyinstaller/archive/develop.zip"

_version=$1

if [[ "${_version}" == "develop" ]]; then
    pip install ${_pyinstaller_develop}
else
    pip install pyinstaller==${_version}
fi
