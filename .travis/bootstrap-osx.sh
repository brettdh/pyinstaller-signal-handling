#!/bin/sh -e

brew update
brew install pyenv
pyenv install ${PYTHON_VERSION}
pyenv global ${PYTHON_VERSION}
