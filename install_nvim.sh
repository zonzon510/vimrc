#!/bin/bash

if [ -d ~/nvim/ ]; then
	echo directory already exists
	exit 0
fi

mkdir ~/nvim && \
cd ~/nvim &&\

wget https://github.com/neovim/neovim/releases/download/v0.4.2/nvim.appimage &&\
mv ./nvim.appimage ./nvim &&\
chmod +x ./nvim

# for clipboard to work
sudo apt-get install xsel
# try this if still not working
# install vim-gtk

