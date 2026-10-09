#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ─── Helpers ──────────────────────────────────────────────────────────────────

info()    { echo "[info]  $*"; }
success() { echo "[ok]    $*"; }
warning() { echo "[warn]  $*"; }
error()   { echo "[error] $*" >&2; }

symlink() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ]; then
    if [ "$(readlink "$dest")" = "$src" ]; then
      info "Already linked: $dest"
      return
    fi
    warning "Replacing existing symlink: $dest"
    rm "$dest"
  elif [ -e "$dest" ]; then
    warning "Backing up existing file: $dest -> ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi

  ln -s "$src" "$dest"
  success "Linked: $dest -> $src"
}

# Requires gum to be installed. Falls back to a plain read prompt.
confirm() {
  local prompt="$1"
  if command -v gum &>/dev/null; then
    gum confirm "$prompt"
  else
    read -r -p "$prompt [y/N] " reply
    [[ "$reply" =~ ^[Yy]$ ]]
  fi
}

# ─── Homebrew ─────────────────────────────────────────────────────────────────

install_homebrew() {
  info "Checking Homebrew..."
  if command -v brew &>/dev/null; then
    info "Homebrew already installed, updating..."
    brew update
  else
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if [[ "$(uname -m)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  # Install gum early so confirm() can use it for the rest of setup
  if ! command -v gum &>/dev/null; then
    info "Installing gum (used for interactive prompts)..."
    brew install gum
  fi

  success "Homebrew ready"
}

# ─── Packages ─────────────────────────────────────────────────────────────────

install_packages() {
  info "Installing essential packages..."
  brew install \
    zoxide \
    tmux \
    gh \
    fzf \
    htop \
    ranger \
    neovim

  info "Installing extra tools..."
  brew install \
    bat \
    the_silver_searcher \
    ripgrep \
    tree-sitter \
    eza \
    git-lfs

  success "Core packages installed"
}

# ─── Optional: languages & version managers ───────────────────────────────────

install_optional_packages() {
  if confirm "Install Go?"; then
    brew install golang
    success "Go installed"
  fi

  if confirm "Install Rust?"; then
    brew install rust
    success "Rust installed"
  fi

  if confirm "Install pyenv (Python version manager)?"; then
    brew install pyenv
    success "pyenv installed"
  fi

  if confirm "Install rbenv (Ruby version manager)?"; then
    brew install rbenv
    success "rbenv installed"
  fi

  if confirm "Install jenv (Java version manager)?"; then
    brew install jenv
    success "jenv installed"
  fi

  if confirm "Install kubectl + kubectx?"; then
    brew install kubectl kubectx
    success "kubectl + kubectx installed"
  fi

  if confirm "Install AeroSpace (tiling window manager)?"; then
    brew tap nikitabobko/tap
    brew install --cask nikitabobko/tap/aerospace
    success "AeroSpace installed"
  fi
}

# ─── Optional: Node via nvm ───────────────────────────────────────────────────

install_node() {
  if ! confirm "Install Node.js via nvm?"; then
    return
  fi

  info "Installing nvm..."
  brew install nvm

  export NVM_DIR="$HOME/.nvm"
  local nvm_script
  nvm_script="$(brew --prefix nvm)/nvm.sh"
  if [ -s "$nvm_script" ]; then
    # shellcheck source=/dev/null
    source "$nvm_script"
    nvm install --lts
    nvm use --lts
    success "Node LTS installed via nvm"
  else
    warning "nvm script not found at $nvm_script"
  fi
}

# ─── Optional: Bun ────────────────────────────────────────────────────────────

install_bun() {
  if ! confirm "Install Bun?"; then
    return
  fi

  if command -v bun &>/dev/null; then
    info "Bun already installed"
  else
    curl -fsSL https://bun.sh/install | bash
    success "Bun installed"
  fi
}

# ─── Optional: Nerd Fonts ─────────────────────────────────────────────────────
# Not needed for Oh My Zsh (robbyrussell theme), but required by LazyVim
# for icons in the file tree and statusline.

install_nerd_fonts() {
  if ! confirm "Install Nerd Fonts? (required by LazyVim for icons)"; then
    return
  fi

  info "Installing Nerd Fonts via Homebrew..."
  brew tap homebrew/cask-fonts 2>/dev/null || true
  for font in \
    font-meslo-lg-nerd-font \
    font-fira-code-nerd-font \
    font-fira-mono-nerd-font \
    font-sauce-code-pro-nerd-font; do
    brew install --cask "$font" || warning "Could not install $font, skipping"
  done
  success "Nerd Fonts installed"
}

# ─── Oh My Zsh ────────────────────────────────────────────────────────────────

install_oh_my_zsh() {
  if confirm "Install Oh My Zsh?"; then
    if [ -d "$HOME/.oh-my-zsh" ]; then
      info "Oh My Zsh already installed"
    else
      # RUNZSH=no / CHSH=no prevents OMZ from hijacking the script mid-run
      RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      success "Oh My Zsh installed"
    fi
  fi
}

# ─── Dotfile Symlinks ─────────────────────────────────────────────────────────

link_dotfiles() {
  info "Symlinking dotfiles..."

  symlink "$DOTFILES_DIR/.zshrc"            "$HOME/.zshrc"
  symlink "$DOTFILES_DIR/.gitconfig"        "$HOME/.gitconfig"
  symlink "$DOTFILES_DIR/.gitignore-global" "$HOME/.gitignore-global"
  symlink "$DOTFILES_DIR/.tmux.conf"        "$HOME/.tmux.conf"
  symlink "$DOTFILES_DIR/.ideavimrc"        "$HOME/.ideavimrc"

  symlink "$DOTFILES_DIR/.config/nvim"      "$HOME/.config/nvim"
  symlink "$DOTFILES_DIR/.config/aerospace" "$HOME/.config/aerospace"
  symlink "$DOTFILES_DIR/.config/glab-cli"  "$HOME/.config/glab-cli"
  symlink "$DOTFILES_DIR/.config/windsurf"  "$HOME/.config/windsurf"

  symlink "$DOTFILES_DIR/.scripts"          "$HOME/.scripts"

  success "Dotfiles linked"
}

# ─── GitHub Auth ──────────────────────────────────────────────────────────────

github_auth() {
  info "GitHub CLI auth..."
  if gh auth status &>/dev/null; then
    info "Already authenticated with GitHub"
  else
    gh auth login
  fi
}

# ─── git-lfs ──────────────────────────────────────────────────────────────────

setup_git_lfs() {
  info "Configuring git-lfs..."
  git lfs install
  success "git-lfs configured"
}

# ─── Optional: macOS defaults ─────────────────────────────────────────────────

macos_defaults() {
  if ! confirm "Apply macOS defaults? (key repeat, Finder hidden files, etc.)"; then
    return
  fi

  defaults write com.apple.finder AppleShowAllFiles YES
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write -g ApplePressAndHoldEnabled -bool false
  defaults write -g KeyRepeat -int 2
  defaults write -g InitialKeyRepeat -int 15
  killall Finder 2>/dev/null || true
  success "macOS defaults applied"
}

# ─── Main ─────────────────────────────────────────────────────────────────────

main() {
  echo ""
  echo "=============================="
  echo "  Dotfiles setup starting...  "
  echo "=============================="
  echo ""

  install_homebrew      # always required
  install_packages      # always: core CLI tools
  install_optional_packages
  install_node
  install_bun
  install_nerd_fonts
  install_oh_my_zsh
  link_dotfiles         # always: symlink everything
  setup_git_lfs
  github_auth
  macos_defaults

  echo ""
  echo "=============================="
  success "All done! Restart your terminal."
  echo "=============================="
  echo ""
}

main "$@"
