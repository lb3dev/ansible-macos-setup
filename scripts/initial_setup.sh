#!/bin/bash

set -e
set -u
set -o pipefail

# Set path for this script session

export PATH="$HOME/Library/Python/3.8/bin:$PATH:/opt/homebrew/bin"

# Install ansible via pip

pip3 install --upgrade pip
pip3 install ansible

# Install Homebrew if not installed (https://brew.sh)

if ! command -v brew &> /dev/null; then

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Turn off Homebrew analytics

    brew analytics off
else
    echo "brew: already installed"
fi

cp ../dotfiles/.zshrc ~