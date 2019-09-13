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

echo -e '\n\n## Python pipx\neval "$(register-python-argcomplete pipx)"' >> $HOME/.bashrc
