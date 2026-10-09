# dotfiles

Personal configuration for Neovim, tmux, zsh, and other tools.

## Structure

```
dotfiles/
├── .config/
│   ├── aerospace/   # AeroSpace tiling window manager
│   ├── glab-cli/    # GitLab CLI
│   ├── nvim/        # Neovim (LazyVim)
│   └── windsurf/    # Windsurf editor
├── .scripts/
│   ├── git/         # Custom git alias scripts
│   └── tmux/        # tmux-sessionizer, tmux-killer
├── .gitconfig
├── .gitignore-global
├── .ideavimrc
├── .tmux.conf
├── .zshrc
└── install.sh
```

## Install

Clone the repo anywhere and run the install script:

```sh
git clone https://github.com/brendalf/dotfiles ~/orca/dotfiles
cd ~/orca/dotfiles
./install.sh
```

The script will:
- Install Homebrew and core CLI tools
- Prompt for optional installs (Node, Bun, pyenv, rbenv, kubectl, etc.)
- Symlink all dotfiles and configs to their expected locations in `$HOME`
- Set up Oh My Zsh, Nerd Fonts, and git-lfs

Dotfiles are **not** copied — they are symlinked, so any changes made in the
repo are reflected immediately without re-running the script.

## Secrets & work config

Machine-specific config (secrets, work aliases, tokens) goes in `~/.zshrc.local`,
which is sourced automatically by `.zshrc` but never tracked in git.
