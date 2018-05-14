#!/bin/bash -e

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    pyenv install ${PYTHON_VERSION}
    pyenv global ${PYTHON_VERSION}
fi
