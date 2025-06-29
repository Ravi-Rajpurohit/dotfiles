#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# setup-dotfiles.sh - Script to set up dotfiles using GNU Stow
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

echo "Setting up dotfiles with Stow..."

# Clone the dotfiles repository to ~/dotfiles if it doesn't exist
if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository to ~/dotfiles..."
  git clone https://github.com/Ravi-Rajpurohit/dotfiles.git $HOME/dotfiles
else
  echo "Dotfiles repository already exists at ~/dotfiles."
fi

# Check if Stow is installed, if not, attempt to install it (macOS via Homebrew)
if ! command -v stow &> /dev/null; then
  echo "Stow is not installed. Attempting to install Stow via Homebrew..."
  if command -v brew &> /dev/null; then
    brew install stow
    if [ $? -eq 0 ]; then
      echo "Stow installed successfully."
    else
      echo "Failed to install Stow. Please install it manually and rerun this script."
      exit 1
    fi
  else
    echo "Homebrew not found. Please install Stow manually (e.g., 'brew install stow' on macOS or 'sudo apt install stow' on Linux) and rerun this script."
    exit 1
  fi
else
  echo "Stow is already installed."
fi

# Backup existing dotfiles in home directory
BACKUP_DIR="$HOME/dotfiles/backup-home-$(date +%Y%m%d)"
echo "Creating backup of existing dotfiles in $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"
for file in ~/.bashrc ~/.zshrc ~/.gitconfig ~/.roo ~/.cline; do
  if [ -f "$file" ] || [ -L "$file" ] || [ -d "$file" ]; then
    mv "$file" "$BACKUP_DIR/"
    echo "Moved $file to $BACKUP_DIR"
  fi
done

# Navigate to dotfiles directory and run Stow to create symlinks
cd "$HOME/dotfiles"
echo "Creating symlinks with Stow for dotfiles..."
stow bash zsh git roocode cline ghostty
if [ $? -eq 0 ]; then
  echo "Symlinks created successfully with Stow."
else
  echo "Error occurred while creating symlinks with Stow. Please check for conflicts or permissions issues."
  exit 1
fi

echo "Dotfiles setup complete. Your configurations are now managed with Stow."
echo "To verify, check symlinks in your home directory (e.g., 'ls -la ~/.bashrc')."
echo "If you need to update dotfiles, edit files in ~/dotfiles and commit changes to the repository."

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
