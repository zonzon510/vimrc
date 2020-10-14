#!/bin/bash

set -e

cd ~/
if [ -d ~/delta/ ]; then
	echo directory already exists
else
	mkdir ~/delta
fi
cd ~/delta
wget https://github.com/dandavison/delta/releases/download/0.4.4/delta-0.4.4-x86_64-unknown-linux-gnu.tar.gz
# download delta
tar -xvf delta*tar.gz

if [ -d ~/bin/ ]; then
	echo directory already exists
else
	mkdir ~/bin
fi
cp ~/delta/delta-0.4.4-x86_64-unknown-linux-gnu/delta ~/bin/
