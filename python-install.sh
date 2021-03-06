#!/usr/bin/env bash

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
rm get-pip.py
pip3 install --user pipx
$HOME/.local/bin/pipx install black
$HOME/.local/bin/pipx install pipenv
$HOME/.local/bin/pipx install pytest
$HOME/.local/bin/pipx install pylint
$HOME/.local/bin/pipx install pydocstyle
$HOME/.local/bin/pipx install pycodestyle
$HOME/.local/bin/pipx install terminal-colors
$HOME/.local/bin/pipx install Pygments

echo -e '\n## Python pipx\neval "$(register-python-argcomplete pipx)"' >> $HOME/.bashrc

## pyenv
#curl https://pyenv.run | bash
# echo -e '\n## pyenv\nexport PATH="$HOME/.pyenv/bin:$PATH"' >> $HOME/.bashrc
# echo -e '\neval "$(pyenv init -)"' >> $HOME/.bashrc
# echo -e '\neval "$(pyenv virtualenv-init -)"' >> $HOME/.bashrc
# . $HOME/.bashrc
# # https://unix.stackexchange.com/questions/515303/what-libraries-are-needed-to-install-python-3-7-on-ubuntu-18-04
# sudo apt update
# sudo DEBIAN_FRONTEND=noninteractive apt install build-essential libsqlite3-dev sqlite3 bzip2 libbz2-dev zlib1g-dev libssl-dev openssl libgdbm-dev libgdbm-compat-dev liblzma-dev libreadline-dev libncursesw5-dev libffi-dev uuid-dev -y
# pyenv install 3.7.4

# Python 3.7
echo | sudo add-apt-repository ppa:deadsnakes/ppa
# as of 18.04 Ubuntu automatically updates the repositories when one is added
# so no apt-update needed.
sudo DEBIAN_FRONTEND=noninteractive apt install python3.7 python3.7-dev python3.7-doc python3.7-venv python3.7-distutils python3.7-tk -y
# echo | sudo add-apt-repository --remove ppa:deadsnakes/ppa
