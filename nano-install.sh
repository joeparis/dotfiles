#!/usr/bin/env bash
# Install nano 4.4 and configure to my liking.

# pre-req
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt install libncursesw5-dev -y

curl -L https://www.nano-editor.org/dist/v4/nano-4.4.tar.gz -o $HOME/nano-4.4.tar.gz
tar -xzf nano-4.4.tar.gz

$HOME/nano-4.4/./configure --prefix=/usr --enable-all
$HOME/nano-4.4/make
sudo $HOME/nano-4.4/make install

#sudo rm -rf nano-4.4
#rm nano-4.4.tar.gz

curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/nanorc -o $HOME/.nanorc

curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
