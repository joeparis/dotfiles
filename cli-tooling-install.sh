#!/usr/bin/env bash

echo | sudo add-apt-repository ppa:ubuntu-toolchain-r/test
# as of 18.04 Ubuntu automatically updates the repositories when one is added
# so no apt-update needed.
sudo DEBIAN_FRONTEND=noninteractive apt install aptitude autoconf automake build-essential build-essential cowsay curl fonts-font-awesome fonts-hack-ttf fonts-firacode fortune gcc-9 git glances htop httpie imagemagick lolcat most python-argcomplete python3.6-dev python3.6-distutils python3.6-doc python3.6-tk python3.6-venv tmux toilet xclip youtube-dl -y
echo | sudo add-apt-repository --remove ppa:ubuntu-toolchain-r/test
