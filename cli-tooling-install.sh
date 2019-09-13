#!/usr/bin/env bash

echo | sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt install aptitude autoconf automake build-essential build-essential cowsay curl fortune gcc-9 git glances htop httpie imagemagick lolcat most python-argcomplete python3.6-dev python3.6-distutils python3.6-doc python3.6-tk python3.6-venv tmux toilet xclip youtube-dl -y
echo | sudo add-apt-repository --remove ppa:ubuntu-toolchain-r/test
