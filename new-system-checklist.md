# New System Setup Checklist

This checklist is designed to guide you through the process of setting up a new system with your dotfiles and preferred tools. Follow these steps to ensure a smooth transition:

## Initial Setup
- [ ] **Clone Dotfiles Repository**: Clone your dotfiles repository to `~/dotfiles` on the new system.
  ```bash
  git clone https://github.com/Ravi-Rajpurohit/dotfiles.git ~/dotfiles
  ```
- [ ] **Install Stow**: Ensure GNU Stow is installed on the new system. On macOS, use Homebrew; on Linux, use the appropriate package manager.
  ```bash
  # macOS
  brew install stow
  # Linux (Debian/Ubuntu)
  sudo apt install stow
  ```
- [ ] **Backup Existing Dotfiles**: Backup any existing dotfiles in your home directory to avoid overwriting important configurations.
  ```bash
  BACKUP_DIR="$HOME/dotfiles/backup-home-$(date +%Y%m%d)"
  mkdir -p "$BACKUP_DIR"
  for file in ~/.zshrc ~/.gitconfig ~/.aerospace.toml; do
    if [ -f "$file" ] || [ -L "$file" ] || [ -d "$file" ]; then
      mv "$file" "$BACKUP_DIR/"
    fi
  done
  ```
- [ ] **Setup Dotfiles with Stow**: Navigate to `~/dotfiles` and use Stow to create symlinks for your configurations.
  ```bash
  cd ~/dotfiles
  stow zsh git aerospace
  ```
  Or run the setup script: `bash ~/dotfiles/setup-dotfiles.sh`
- [ ] **Verify Symlinks**: Check that symlinks are correctly created in your home directory.
  ```bash
  ls -la ~/.zshrc ~/.gitconfig ~/.aerospace.toml
  ```

## Tool and Environment Setup
- [ ] **Install Essential Tools**: Use the appropriate installation script for your system (macOS or Linux) to install necessary tools and applications.
  ```bash
  # macOS
  bash ~/dotfiles/mac-install.sh
  # Linux (Ubuntu)
  bash ~/dotfiles/ubuntu-install.sh
  ```
- [ ] **Configure Shell**: Ensure your preferred shell (e.g., zsh) is set as the default shell.
  ```bash
  chsh -s $(which zsh)
  ```
- [ ] **Setup Git**: User name and email are in `git/.gitconfig` when stowed. Override locally if needed:
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"
  ```
- [ ] **Install Additional Software**: Install any additional software or tools specific to your workflow that are not covered by the installation scripts.
- [ ] **Manual Backup for Specific Configurations**: Backup configurations for iTerm2, Raycast, and .ssh manually to ensure they are preserved.
  ```bash
  # Backup iTerm2 configuration
  mkdir -p ~/dotfiles/backup-configs-$(date +%Y%m%d)/iterm2
  cp ~/Library/Preferences/com.googlecode.iterm2.plist ~/dotfiles/backup-configs-$(date +%Y%m%d)/iterm2/

  # Backup Raycast configuration
  mkdir -p ~/dotfiles/backup-configs-$(date +%Y%m%d)/raycast
  cp -r ~/Library/Application\ Support/Raycast ~/dotfiles/backup-configs-$(date +%Y%m%d)/raycast/

  # Backup .ssh directory (excluding private keys if desired)
  mkdir -p ~/dotfiles/backup-configs-$(date +%Y%m%d)/ssh
  cp -r ~/.ssh/config ~/.ssh/known_hosts ~/dotfiles/backup-configs-$(date +%Y%m%d)/ssh/
  ```

## Customization and Verification
- [ ] **Customize Configurations**: Review and customize your dotfiles as needed for the new system.
- [ ] **Test Configurations**: Test your shell, Git, and AeroSpace config to ensure they work as expected.
  ```bash
  zsh
  git --version
  ```
- [ ] **Backup New System State**: Create a backup of the initial state of your new system’s dotfiles for future reference.
  ```bash
  mkdir -p ~/dotfiles/backup-new-system-$(date +%Y%m%d)
  cp ~/.zshrc ~/.gitconfig ~/.aerospace.toml ~/dotfiles/backup-new-system-$(date +%Y%m%d)/
  ```

## Additional Notes
- Ensure you have access to your dotfiles repository and any necessary credentials for cloning and setting up tools.
- If you encounter issues with Stow or symlinks, check for conflicting files in your home directory and resolve them manually.
- Keep this checklist updated with any additional steps or tools specific to your workflow for future system migrations.
