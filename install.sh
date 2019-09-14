#!/usr/bin/env bash

set -e # exit immediately on error

curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/base-install.sh | bash
curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/cli-tooling-install.sh | bash
curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/python-install.sh | bash
curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/bash-it-install.sh | bash

# Test if runing in WSL (brittle)
if grep -qE "(Microsoft@Microsoft.com)" /proc/version &> /dev/null ; then
    curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/wsl-install.sh | bash
fi

curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/wrap-up-install.sh | bash

# TODO:
# Add vim config
# Add GUI application install/config for full-blown Linux environments
# Add Ubuntu/Manjaro detection
