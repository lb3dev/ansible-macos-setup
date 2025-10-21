#!/usr/bin/env bash

function semver_greater_equal() {
    printf '%s\n%s\n' "$2" "$1" | sort --check=quiet --version-sort
}

function setup_python3_macos11() {
    set -x
    # Install latest Python 3 for older macOS without system Python 3
    brew install python@3.13
    /usr/local/bin/python3 -m venv ~/.setup/venv-ansible
}

function setup_python3_macos() {
    set -x
    /usr/bin/python3 -m venv ~/.setup/venv-ansible
}

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

# Setup virtualenv, update pip and install ansible and dependencies

MACOS_VER=$(sw_vers -productVersion)
if semver_greater_equal $MACOS_VER 11.7.10; then
    setup_python3_macos
else
    setup_python3_macos11
fi

set +x
source ~/.setup/venv-ansible/bin/activate

set -x
pip install --upgrade pip
pip install -r requirements.txt
ansible-galaxy install -r requirements.yml

# Restore original file descriptors for stdout and stderr
set +x
exec 1>&3 3>&-
exec 2>&4 4>&-

set -x
export ANSIBLE_LOG_PATH="$SETUP_LOGS_DIR/ansible-$CURR_DATE.log"
ansible-playbook main.yml -K
