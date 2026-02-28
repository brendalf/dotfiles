!#/bin/bash

echo "Installing Homebrew"
cd
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.config/fish/personal_config.fish
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing essential"
brew install gum
brew install zoxide
brew install tmp
brew install gh
brew install tmux
brew install fzf
brew install htop
brew install ranger
brew install neovim

echo "Install extras"
brew install bat
brew install ag
brew install ripgrep
brew install tree-sitter
brew install exa
brew install gh

echo "Installing languagues"
brew install golang
brew install rust

echo "Install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
nvm install lts

echo "Github Auth"
gh auth login

echo "Install Nerd Fonts"
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
cd nerd-fonts
chmod +x install.sh
./install.sh Meslo
./install.sh FiraCode
./install.sh FiraMono
./install.sh SourceCodePro
cd ..
rm -r nerd-fonts

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
