echo "Updating Apt"
sudo apt update

echo "Installing Homebrew"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/${USER}/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "Installing Dependencies"
sudo apt install build-essential

echo "Installing libraries"
brew install gcc
brew install git
brew install gh
brew install tmux tmuxinator
brew install ag
brew install htop
brew install ranger
brew install fzf
brew install ripgrep
brew install bat
brew install peco
brew install tree-sitter
brew install neovim
brew install luajit
brew install ghq
brew install exa
brew install gnu-sed
brew install nodejs
brew install rust

echo "Github Auth"
gh auth login

echo "Clonning Dotfiles"
cd /home/$USER
gh repo clone brendalf/dotfiles
mv dotfiles/.config/* .config/
mv dotfiles/.git* .
mv dotfiles/.tmux* .
rm -r dotfiles

echo "Instaling Packer"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Install and Configure Fish"
sudo apt install fish
chsh -s $(which fish)

echo "Install Fisher"
curl -sL https://git.io/fisher > fisher.txt
fish -c "source fisher.txt"
fish -c "fisher install jorgebucaran/fisher"
rm fisher.txt

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
fish -c "fisher install gazorby/fish-abbreviation-tips"
fish -c "fisher install jorgebucaran/nvm.fish"
fish -c "fisher install IlanCosman/tide"
fish -c "fisher install fisherman/pyenv"
fish -c "fisher install jethrokuan/z"

echo "Configure neovim"
python3 -m pip install pynvim
sudo update-alternatives --install /usr/bin/vi vi /home/linuxbrew/.linuxbrew/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /home/linuxbrew/.linuxbrew/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /home/linuxbrew/.linuxbrew/bin/nvim 60
sudo update-alternatives --config editor

echo "Configure Tmux"
python3 -m pip install --user powerline-status
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.fish
mv tmuxinator.fish ~/.config/fish/completions/

echo "Misc"
npm install -g taskbook


