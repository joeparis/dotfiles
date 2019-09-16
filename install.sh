#!/usr/bin/env bash

set -e # exit immediately on error

curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/base-install.sh | bash
curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/cli-tooling-install.sh | bash
curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/python-install.sh | bash
curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/bash-it-install.sh | bash
curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/nano-install.sh | bash

# Test if runing in WSL (brittle)
# if grep -qE "(Microsoft@Microsoft.com)" /proc/version &> /dev/null ; then
#Less brittle (?) test
if [ -z "WSLENV" ]; then
    curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/wsl-install.sh | bash
fi

# Test for gdm to determine if we're running under a full-blown Linux install with Gnome desktop
# and, if so, install GUI applications.
# if [ ! -x /usr/bin/gdm ]; then
#     sudo apt install curl
# fi

curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/wrap-up-install.sh | bash
