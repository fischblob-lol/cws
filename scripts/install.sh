#!/usr/bin/env bash
# !!! UNFINISHED !!! 

echo "Do NOT run this script as root, it WILL mess up your system."
echo "Checking if running as root"

# Check if script is run as root
if [ "$EUID" -eq 0 ]; then
    echo "Do not run this script as root, aborting!"
    exit 1
fi

# Detect NixOS
if [ -f /etc/NIXOS ]; then
    echo "WARNING: You are running NixOS."
    echo "This script may not work correctly because NixOS is declarative."
    echo "You may need to install dependencies via configuration.nix instead."
    echo "Continuing in 5 seconds... CTRL+C to abort."
    sleep 5
fi

echo "Cloning GitHub repo in 5 seconds. Press CTRL+C to abort."
sleep 5

cd "$HOME" || { echo "Failed to cd into HOME"; exit 1; }

if [ -d "cws" ]; then
    echo "Directory 'cws' already exists. Remove it or update manually."
    exit 1
fi

git clone https://github.com/fischblob-lol/cws || { echo "Git clone failed"; exit 1; }

cd cws || { echo "Failed to enter cws directory"; exit 1; }

echo "Installing now..."
# insert kewl installing
