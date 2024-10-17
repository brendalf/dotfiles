!#/bin/bash

echo "Installing Homebrew"
cd
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.config/fish/personal_config.fish
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing essential"
brew install gum
brew install zoxide
brew install alacritty
brew install fish
brew install fisher
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
brew install tmuxinator

echo "Installing languagues"
brew install luajit
brew install golang
brew install rust

echo "Install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
nvm install 22

echo "Github Auth"
gh auth login

echo "Configure Fish"
chsh -s $(which fish)

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

echo "Install Fisher Plugins"
fisher install gazorby/fish-abbreviation-tips
fisher install jorgebucaran/nvm.fish
fisher install IlanCosman/tide
fisher install jethrokuan/z

echo "Configure tmuxinator for fish"
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.fish
mv tmuxinator.fish ~/.config/fish/completions/
