#!/bin/bash
sudo apt install build-essential cmake python3-dev &&\
cd ~/.vim/bundle/YouCompleteMe &&\
python3 install.py --clang-completer

