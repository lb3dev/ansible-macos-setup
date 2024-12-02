#!/usr/bin/env bash

SETUP_DIR=~/.setup
SETUP_LOGS_DIR="$SETUP_DIR/logs"
SETUP_BACKUP_LOGS_DIR="$SETUP_DIR/logs/backup"
CURR_DATE=$(date +%Y-%m-%d-%H%M%S)

# Create ~/.setup as the default folder to store all setup related logs and files
mkdir -p "$SETUP_DIR"
mkdir -p "$SETUP_LOGS_DIR"
mkdir -p "$SETUP_BACKUP_LOGS_DIR"

# Capture all logs from this script to a new setup log file
LOGFILE="$SETUP_LOGS_DIR/setup-$CURR_DATE.log"
touch "$LOGFILE"

# Save file descriptors for stdout and stderr, write all further output to logfile
exec 3>&1
exec 4>&2
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

# Install latest Python 3
brew install python@3.13

# Setup virtualenv, update pip and install ansible and dependencies
set -x
/usr/local/bin/python3 -m venv ~/.setup/venv-ansible

set +x
source ~/.setup/venv-ansible/bin/activate

set -x
pip install --upgrade pip
pip install -r requirements.txt
ansible-galaxy install -r requirements.yml

sudo ./osx.sh

# Restore original file descriptors for stdout and stderr
set +x
exec 1>&3 3>&-
exec 2>&4 4>&-

set -x
export ANSIBLE_LOG_PATH="$SETUP_LOGS_DIR/ansible-$CURR_DATE.log"
ansible-playbook main.yml -K
