
# dotfiles

Dotfiles for personal use, now managed with Stow.

## Packages

| Package     | Symlinks to home        |
|-------------|-------------------------|
| `zsh`       | `~/.zshrc`              |
| `git`       | `~/.gitconfig`          |
| `aerospace` | `~/.aerospace.toml`     |

Install all packages:

```bash
cd ~/dotfiles
stow zsh git aerospace
```

Or run `bash ~/dotfiles/setup-dotfiles.sh`.

## Overview

This repository contains personal dotfiles for shell, Git, and AeroSpace (macOS tiling WM). Configurations are managed with [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager.

### How Stow Works (Simplified)

Stow creates symlinks from `~/dotfiles` into your home directory (default target: `~`).

1. **Where symlinks go**
   - Example: `~/dotfiles/zsh/.zshrc` → `~/.zshrc`
   - Use `-t` for a different target when needed.

2. **How linking works**
   - Each subdirectory is a Stow *package*. Files inside mirror their path under the target.
   - Example:
     ```
     ~/dotfiles/aerospace/.aerospace.toml
     ```
     Running `stow aerospace` creates:
     ```
     ~/.aerospace.toml → ~/dotfiles/aerospace/.aerospace.toml
     ```

3. **Add a new dotfile**
   1. Create a package folder and move the file in (e.g. `~/dotfiles/vim/.vimrc`).
   2. `cd ~/dotfiles && stow vim`
   3. Verify with `ls -la ~/.vimrc`
   4. Commit to Git.

4. **Lifecycle**
   - **Add**: file in `~/dotfiles/<package>/`, then `stow <package>`
   - **Update**: edit in `~/dotfiles` (symlinks pick up changes immediately)
   - **Remove**: `stow -D <package>` or remove the symlink, then commit

## Setup with Stow

1. **Clone the repository**
   ```bash
   git clone https://github.com/Ravi-Rajpurohit/dotfiles.git ~/dotfiles
   ```

2. **Install Stow**
   ```bash
   # macOS
   brew install stow
   # Linux (Debian/Ubuntu)
   sudo apt install stow
   ```

3. **Symlink packages**
   ```bash
   cd ~/dotfiles
   stow zsh git aerospace
   ```
   Or: `bash ~/dotfiles/setup-dotfiles.sh` (backs up existing files first).

4. **Verify**
   ```bash
   ls -la ~/.zshrc ~/.gitconfig ~/.aerospace.toml
   ```

See [new-system-checklist.md](new-system-checklist.md) for a full new-machine checklist.

## Backup

Before first Stow run, back up any existing `~/.zshrc`, `~/.gitconfig`, or `~/.aerospace.toml`. `setup-dotfiles.sh` moves them to `~/dotfiles/backup-home-YYYYMMDD/`.

## Managing Dotfiles with Stow

### Adding a new package
1. Add files under `~/dotfiles/<package>/` with the correct relative paths.
2. `cd ~/dotfiles && stow <package>`
3. Verify symlinks, then commit.

### Updating
Edit files under `~/dotfiles`. To refresh symlinks after structural changes:
```bash
cd ~/dotfiles
stow -R zsh
```

### Removing
```bash
cd ~/dotfiles
stow -D zsh
```

## Additional Notes

- Resolve conflicting real files in `$HOME` before Stow (Stow will not overwrite them).
- Edit tracked files in `~/dotfiles` and commit changes to this repository.

### Brewfile

Install Homebrew dependencies from this repo:

```bash
cd ~/dotfiles
brew bundle
```

Regenerate the Brewfile after package changes:

```bash
brew bundle dump --describe --no-vscode .
```

The `--no-vscode` flag excludes VS Code extensions from the dump.

For more on Stow, see the [manual](https://www.gnu.org/software/stow/manual/stow.html).
