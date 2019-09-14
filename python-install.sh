#!/usr/bin/env bash

sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo -H python3 get-pip.py
yes | rm get-pip.py
pip3 install --user pipx
pipx install black
pipx install pipenv
pipx install pytest
pipx install pylint
pipx install pydocstyle
pipx install pycodestyle
pipx install terminal-colors

## pyenv
curl https://pyenv.run | bash

echo -e '\n## Python pipx\neval "$(register-python-argcomplete pipx)"' >> $HOME/.bashrc

echo -e '\n## pyenv\nexport PATH="$HOME/.pyenv/bin:$PATH"' >> $HOME/.bashrc
echo -e '\neval "$(pyenv init -)"' >> $HOME/.bashrc
echo -e '\neval "$(pyenv virtualenv-init -)"' >> $HOME/.bashrc

. $HOME/.bashrc

# https://unix.stackexchange.com/questions/515303/what-libraries-are-needed-to-install-python-3-7-on-ubuntu-18-04
sudo apt install build-essential libsqlite3-dev sqlite3 bzip2 libbz2-dev zlib1g-dev libssl-dev openssl libgdbm-dev libgdbm-compat-dev liblzma-dev libreadline-dev libncursesw5-dev libffi-dev uuid-dev -y

pyenv install 3.7.4
