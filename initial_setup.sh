#!/bin/bash

set -e
set -u
set -o pipefail

# Set path for this script session

MACOS_VERSION=$(sw_vers -productVersion)

if [[ $MACOS_VERSION == 12.6 ]]; then
  export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
else
  export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"
fi

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

# Immediately run full ansible setup

ansible-galaxy install -r requirements.yml
ansible-playbook main.yml --ask-become-pass -e 'initial_setup=true'
