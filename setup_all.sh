#!/bin/bash
set -e
sudo apt-get install curl
~/install_nvim.sh
~/install_vimplug.sh
~/install_ycm.sh
~/install_term.sh

~/install_i3.sh
~/install_python36.sh


~/install_delta.sh
~/install_ctags.sh
~/install_silver_searcher.sh
~/install_fzf.sh
~/install_ctags.sh


git config --global user.email "jonathonwhite@protonmail.com"
git config --global user.name "jonathon"

sudo apt-get install python3-pip
pip3 install neovim
sudo apt-get install redshift
