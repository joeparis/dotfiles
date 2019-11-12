#!/usr/bin/env bash

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --no-modify-config

mkdir -p $HOME/.bash_it/custom/themes/joe1
curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/joe1.theme.bash -o $HOME/.bash_it/custom/themes/joe1/joe1.theme.bash

echo -e '\n##bash-it\n# Path to the bash-it configuration\nexport BASH_IT="$HOME/.bash_it"' >> $HOME/.bashrc
echo -e '\n# Lock and Load a custom bash-it theme file location /.bash_it/themes/\nexport BASH_IT_THEME="joe1"' >> $HOME/.bashrc
echo -e "\n# Don't check mail when opening terminal.\nunset MAILCHECK" >> $HOME/.bashrc
echo -e '\n# Set this to false to turn off version control status checking within the prompt for all themes\nexport SCM_CHECK=true' >> $HOME/.bashrc
echo '. "$BASH_IT"/bash_it.sh' >> $HOME/.bashrc


# bash-it enable alias apt fuck
sudo DEBIAN_FRONTEND=noninteractive apt install python3-dev python3-pip python3-setuptools -y
pip3 install thefuck --user
ln -s $HOME/.bash_it/aliases/available/apt.aliases.bash $HOME/.bash_it/enabled/150---apt.aliases.bash
ln -s $HOME/.bash_it/aliases/available/fuck.aliases.bash $HOME/.bash_it/enabled/150---fuck.aliases.bash

# bash-it enable plugin explain less-pretty-cat tmux
ln -s $HOME/.bash_it/plugins/available/explain.plugin.bash $HOME/.bash_it/enabled/250---explain.plugin.bash
ln -s $HOME/.bash_it/plugins/available/less-pretty-cat.plugin.bash $HOME/.bash_it/enabled/250---less-pretty-cat.plugin.bash
ln -s $HOME/.bash_it/plugins/available/tmux.plugin.bash $HOME/.bash_it/enabled/250---tmux.plugin.bash
