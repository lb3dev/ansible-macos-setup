#!/usr/bin/env bash

SETUP_DIR=~/.setup
CURR_DATE=$(date +%F_%T)

# Create ~/.setup as the default folder to store all setup related logs and files
mkdir -p "$SETUP_DIR"

# Capture all logs from this script to a new setup log file
LOGFILE="$SETUP_DIR/setup-$CURR_DATE.log"
touch "$LOGFILE"
exec > >(tee -a "$LOGFILE") 2>&1

echo "Running setup script at: $CURR_DATE"

set -e
set -u
set -o pipefail

# Set path for homebrew
export PATH="$PATH:/opt/homebrew/bin"

# Install Homebrew if not installed (https://brew.sh)

if ! command -v brew &> /dev/null; then
    set -v
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "brew: already installed"
fi

brew analytics off
set +v

# Setup virtualenv, update pip and install ansible and dependencies
set -x
/usr/bin/python3 -m venv ~/.setup/venv-ansible

set +x
source ~/.setup/venv-ansible/bin/activate

set -x
pip install --upgrade pip
pip install -r requirements.txt
ansible-galaxy install -r requirements.yml

ansible-playbook main.yml -e 'initial_setup=true'
