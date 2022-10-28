#!/bin/bash

set -e
set -u
set -o pipefail

# Set path for homebrew

export PATH="$PATH:/opt/homebrew/bin"

# Install Homebrew if not installed (https://brew.sh)

if ! command -v brew &> /dev/null; then

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Turn off Homebrew analytics

    brew analytics off
else
    echo "brew: already installed"
fi

# Setup virtualenv, update pip and install ansible

/usr/bin/python3 -m venv ~/.macos-setup/venv-ansible

source ~/.macos-setup/venv-ansible/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

# Run macos ansible immediately

ansible-galaxy install -r requirements.yml
ansible-playbook main.yml -e 'initial_setup=true'
