#!/bin/bash -e

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    brew update
    brew install pyenv
    pyenv install ${PYTHON_VERSION}
    pyenv global ${PYTHON_VERSION}
fi
