# move to temporary folder
cd /tmp

# install fish terminal
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish

# configure fish as the default terminal
chsh -s $(which fish)

# install fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install nerd fonts
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
cd nerd-fonts
chmod +x install.sh

./install.sh Meslo
./install.sh FiraCode
./install.sh FiraMono
./install.sh SourceCodePro

# install plugins
fisher install gazorby/fish-abbreviation-tips
fisher install jorgebucaran/nvm.fish
fisher install IlanCosman/tide

# functions
mv .config/fish/functions/* ~/.config/fish/functions
