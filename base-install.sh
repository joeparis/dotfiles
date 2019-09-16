#!/usr/bin/env bash

# Make user binaries directories.
mkdir -p $HOME/bin $HOME/.local/bin/

# Update all the things
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

if [ ! -x /usr/bin/curl ]; then
    sudo apt install curl
fi

# .bashrc
if [ -f $HOME/.bashrc ]; then
    rm $HOME/.bashrc
fi
curl -L -o $HOME/.bashrc https://raw.githubusercontent.com/joeparis/dotfiles/master/base_bashrc
chmod 644 $HOME/.bashrc

# .bash_aliases
if [ -f $HOME/.bash_aliases ]; then
    rm $HOME/.bash_aliases
fi
curl -L -o $HOME/.bash_aliases https://raw.githubusercontent.com/joeparis/dotfiles/master/bash_aliases
chmod 644 $HOME/.bash_aliases

# .dircolors
if [ -f $HOME/.dircolors ]; then
    rm $HOME/.dircolors
fi
curl -L -o $HOME/.dircolors https://raw.githubusercontent.com/joeparis/dotfiles/master/dircolors
chmod 644 $HOME/.dircolors

# .groot-lecture
mkdir -p $HOME/.lectures/
chmod 755 $HOME/.lectures/
curl -L -o $HOME/.lectures/groot-lecture https://raw.githubusercontent.com/joeparis/dotfiles/master/groot-lecture
chmod 644 $HOME/.lectures/groot-lecture
touch $HOME/lecture
echo -e "Defaults\tlecture = always" >> $HOME/lecture
echo -e "Defaults\tlecture_file = $HOME/.lectures/groot-lecture" >> $HOME/lecture
chmod 444 lecture
sudo chown root:root lecture
sudo mv lecture /etc/sudoers.d/

# Set up root's .bashrc giving them a scary red prompt and other misc. goodies.
sudo su
if [ -f /root/.bashrc ]; then
    rm /root/.bashrc
fi
curl -L -o /root/.bashrc https://raw.githubusercontent.com/joeparis/dotfiles/master/root_bashrc
chmod 644 /root/.bashrc

if [ -f /root/.dircolors ]; then
    rm /root/.dircolors
fi
curl -L -o /root/.dircolors https://raw.githubusercontent.com/joeparis/dotfiles/master/dircolors
chmod 644 /root/.dircolors

# exec "$SHELL"
