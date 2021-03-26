cd /tmp

sudo apt install tmux
mv .tmux.conf ~/.tmux.conf
mv .tmux.conf.osx ~/.tmux.conf.osx
mv .tmux.powerline.conf ~/.tmux.powerline.conf

# Install Powerline
python3 -m pip install --user powerline-status
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
