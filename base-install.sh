#!/usr/bin/env bash

# .bashrc
if [ -f $HOME/.bashrc ]; then
    rm $HOME/.bashrc
fi
wget -o $HOME/.bashrc https://raw.githubusercontent.com/joeparis/dotfiles/master/base_bashrc
chmod 644 $HOME/.bashrc

# .bash_aliases
if [ -f $HOME/.bash_aliases ]; then
    rm $HOME/.bash_aliases
fi
wget -o $HOME/.bash_aliases https://raw.githubusercontent.com/joeparis/dotfiles/master/bash_aliases
chmod 644 $HOME/.bash_aliases

# .dircolors
if [ -f $HOME/.dircolors ]; then
    rm $HOME/.dircolors
fi
wget -o $HOME/.dircolors https://raw.githubusercontent.com/joeparis/dotfiles/master/dircolors
chmod 644 $HOME/.dircolors

# .groot-lecture
mkdir -p $HOME/.lectures/
wget -o $HOME/.lectures/.groot-lecture https://raw.githubusercontent.com/joeparis/dotfiles/master/groot-lecture
chmod 644 $HOME/.lectures/.groot-lecture
touch $HOME/lecture
echo -e "Defaults\tlecture = always" >> $HOME/lecture
echo -e "Defaults\tlecture_file = $HOME/.lecture" >> $HOME/lecture
chmod 444 lecture
sudo chown root:root lecture
sudo mv lecture /etc/sudoers.d/

# Update all the things
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
exec "$SHELL"
