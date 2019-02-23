#! /bin/bash
echo $HOME
echo $PWD
ln -sf $PWD/config/compton.conf $HOME/.config/compton.conf
ln -sf $PWD/zshrc $HOME/.zshrc
rm -rf $HOME/bin
ln -s $PWD/scripts $HOME/bin
rm -rf $HOME/.config/i3
ln -s $PWD/config/i3 $HOME/.config/i3
rm -rf $HOME/.config/nvim
ln -s $PWD/config/nvim $HOME/.config/nvim
rm -rf $HOME/.config/polybar
ln -s $PWD/config/polybar $HOME/.config/polybar
rm -rf $HOME/.config/ranger
ln -s $PWD/config/ranger $HOME/.config/ranger
rm -rf $HOME/.config/kitty
ln -s $PWD/config/kitty $HOME/.config/kitty
cp /etc/ls++.conf $HOME/.ls++.conf
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
git clone git@github.com:ranger/ranger.git $HOME/git/ranger
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $HOME/git/zsh-syntax-highlighting
git clone git@github.com:Jvanrhijn/polybar-spotify.git $HOME/git/polybar-spotify
git clone git@github.com:Firenox89/wallpyper.git $HOME/git/wallpyper

pip install --user pynvim 
pip3 install --user pynvim screeninfo

