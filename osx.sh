#!/usr/bin/env bash

set -e
set -u
set -o pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Exiting osx script, requires sudo privilege"
  exit 1
else
  # Update existing `sudo` timestamp until `.osx` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

set -x

###############################################################################
# Firewall                                                                    #
###############################################################################

# Enable Firewall
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Set Firewall to block all incoming connections
/usr/libexec/ApplicationFirewall/socketfilterfw --setblockall on

###############################################################################
# Power Management                                                            #
###############################################################################

# Prevent screen from sleeping at all
pmset -a displaysleep 0

###############################################################################
# Finder                                                                      #
###############################################################################

# Don't hide Volumes folder in Finder
chflags nohidden /Volumes
