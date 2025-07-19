# dotfiles

Dotfiles for personal use, now managed with Stow.

## Overview

This repository contains my personal dotfiles, which are configuration files for various tools and shells. Previously, these were managed using a bare Git repository method, but they have been transitioned to use [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager, for easier management and organization.

## Setup with Stow

To set up these dotfiles on your system using Stow, follow these steps:

1. **Clone the Repository**: Clone this repository to a directory in your home folder, typically `~/dotfiles`.
   ```bash
   git clone https://github.com/Ravi-Rajpurohit/dotfiles.git ~/dotfiles
   ```

2. **Install Stow**: Ensure Stow is installed on your system. On macOS, you can install it via Homebrew:
   ```bash
   brew install stow
   ```
   On Linux, use your package manager, e.g., `sudo apt install stow` for Debian-based systems.

3. **Navigate to the Dotfiles Directory**:
   ```bash
   cd ~/dotfiles
   ```

4. **Use Stow to Create Symlinks**: Stow creates symlinks from the dotfiles in this repository to your home directory. Run the following command for each subdirectory corresponding to the tool or configuration you want to symlink:
   ```bash
   stow bash
   stow zsh
   stow git
   stow roocode  # Includes custom modes for Roo-Code
   stow cline
   stow ghostty
   stow gemini   # Includes settings and global context for Gemini CLI
   ```
   Alternatively, if you want to symlink all configurations at once, you can use a script or manually run `stow` for each relevant directory.

5. **Verify Setup**: Check that the symlinks are correctly created in your home directory. For example, `ls -la ~/.bashrc` should show a symlink pointing to `~/dotfiles/bash/.bashrc`.

## Backup

Before setting up with Stow, ensure you back up any existing dotfiles in your home directory to avoid overwriting important configurations. A backup is typically created in `~/dotfiles/backup-[DATE]` during the transition process.

## Previous Method

For reference, the previous method used a bare Git repository. The setup script for that approach can be found in the repository history or backups, but it is no longer the recommended method for managing these dotfiles.

## Managing Dotfiles with Stow

This section provides guidance on how to add, remove, or update dotfiles in this repository using Stow.

### Adding a New Dotfile
1. **Create the File Structure**: Place the new dotfile in the appropriate subdirectory within `~/dotfiles`. If the tool or category doesn't exist, create a new subdirectory (e.g., `~/dotfiles/newtool/.newconfig`).
2. **Use Stow to Symlink**: Run Stow for the specific subdirectory to create the symlink in your home directory or appropriate location.
   ```bash
   cd ~/dotfiles
   stow newtool
   ```
3. **Verify Symlink**: Check that the symlink was created correctly.
   ```bash
   ls -la ~/.newconfig
   ```
4. **Commit Changes**: Add and commit the new file to the repository.
   ```bash
   git add newtool/.newconfig
   git commit -m "Add new dotfile for newtool"
   ```

### Updating an Existing Dotfile
1. **Edit the File**: Modify the dotfile directly in `~/dotfiles` (e.g., `~/dotfiles/bash/.bashrc`).
2. **Automatic Update**: Since Stow maintains symlinks, changes to the file in `~/dotfiles` are automatically reflected in the symlinked location (e.g., `~/.bashrc`). No additional Stow command is needed for updates. Optionally, you can restow to ensure consistency or prune obsolete symlinks.
   ```bash
   cd ~/dotfiles
   stow -R bash
   ```
3. **Commit Changes**: Commit the updated file to the repository.
   ```bash
   git add bash/.bashrc
   git commit -m "Update bash configuration"
   ```

### Removing a Dotfile
1. **Delete the File**: Remove the dotfile from `~/dotfiles` (e.g., `~/dotfiles/bash/.bashrc`).
2. **Remove Symlink with Stow**: Use Stow to remove the symlink from your home directory by restowing the directory with the `--delete` option or by manually deleting the symlink.
   ```bash
   cd ~/dotfiles
   stow -D bash
   # Or manually delete the symlink
   rm ~/.bashrc
   ```
3. **Commit Changes**: Commit the removal to the repository.
   ```bash
   git rm bash/.bashrc
   git commit -m "Remove bash configuration from dotfiles"
   ```

## Additional Notes

- Ensure there are no conflicting files in your home directory before running Stow to avoid symlink errors.
- If you need to update or modify dotfiles, edit the files in `~/dotfiles` and commit the changes to this repository.

For more information on Stow, refer to the [official documentation](https://www.gnu.org/software/stow/manual/stow.html) and this [tutorial video](https://www.youtube.com/watch?v=NoFiYOqnC4o) for a visual guide on managing dotfiles with Stow.
