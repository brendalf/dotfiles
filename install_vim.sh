#!/bin/bash

# install pre reqs
sudo apt install silversearcher-ag
sudo apt-get install python-dev python-pip python3-dev python3-pip
python3 -m pip install pynvim
sudo npm install -g neovim

# instalando vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

# instalando neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# nvim como editor default
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# copiando arquivos
cp .vim* ~/
cp -r .config/nvim .config

# instalando o vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
