#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ $? -eq 0 ]; then
    echo "Homebrew installed successfully."
  else
    echo "Failed to install Homebrew. Please install it manually and rerun this script."
    exit 1
  fi
else
  echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install applications and tools using Brewfile
echo "Installing applications and tools using Brewfile..."
brew bundle --file=Brewfile

# Install LTS version of Node.js
n lts

# Install zgen for zsh plugin management if not already installed
if [ ! -d "${HOME}/.zgen" ]; then
  echo "Installing zgen for zsh plugin management..."
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
else
  echo "zgen is already installed."
fi

echo "macOS installation script complete. Please restart your terminal to apply changes."
echo "If you haven't set up your dotfiles with Stow, run 'setup-dotfiles.sh' after restarting the terminal."
