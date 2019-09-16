#!/usr/bin/env bash

echo | sudo add-apt-repository ppa:vantuz/cool-retro-term
echo | sudo add-apt-repository ppa:peek-developers/stable
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder

sudo apt update

# ASCIIquarium
# https://www.cyberciti.biz/tips/linux-unix-apple-osx-terminal-ascii-aquarium.html
# be sure to grab latest packages, web page is dated
sudo DEBIAN_FRONTEND=noninteractive apt install libcurses-perl -y
cd /tmp
wget https://cpan.metacpan.org/authors/id/K/KB/KBAUCOM/Term-Animation-2.6.tar.gz
tar -xzf Term-Animation-2.6.tar.gz
cd Term-Animation-2.6/
perl Makefile.PL && make && make test
sudo maksudo make install
cd /tmp
wget https://robobunny.com/projects/asciiquarium/asciiquarium.tar.gz --no-check-certificate
tar -xzf asciiquarium.tar.gz
cd asciiquarium_1.1
sudo cp asciiquarium /usr/local/bin
sudo chmod 0755 /usr/local/bin/asciiquarium

# ASCIInema, Bless Hex Editor, CRT, dconf-editor, gimp, handbrake, handbrake-cli, inkscape,
# kdenlive, krita, obs, peek, shutter, simple screen recorder, steam, textmaker, terminix,
# tilix, vscode insiders
sudo DEBIAN_FRONTEND=noninteractive apt install asciinema bless cool-retro-term dconf-editor gimp handbrake handbrake-cli inkscape inkscape-open-symbols kdenlive kdenlive-data kdenlive-dbg krita krita-data obs-studio peek shutter simplescreenrecorder simplescreenrecorder-lib:i386 steam-installer texmaker perl-tk terminix tilix tilix-common -y

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# VSCode Insider
sudo apt install libnotify4 libnss3 libxkbfile1 libnspr4 -y
curl -L -o code-insiders.deb https://go.microsoft.com/fwlink/?LinkID=760865
sudo dpkg -i code-insiders.deb
rm code-insiders.deb
mkdir -p "$HOME"/.config/Code/User
curl -L -o - http://bit.ly/30fJShW > "$HOME"/.config/Code/User/settings.json
code --install-extension Shan.code-settings-sync

# Thonny
echo | bash <(wget -O - https://thonny.org/installer-for-linux)
[ -f $HOME/Desktop/Thonny.desktop] && rm $HOME/Desktop/Thonny.desktop 2> /dev/null

# echo | sudo add-apt-repository --remove ppa:vantuz/cool-retro-term
# echo | sudo add-apt-repository --remove ppa:peek-developers/stable
