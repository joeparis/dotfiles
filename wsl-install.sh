#!/usr/bin/env bash

echo -e "\n## WSL\n# Forward opengl calls to Windows.\nexport LIBGL_ALWAYS_INDIRECT=1\n# Forward X11 GUIS to Windows.\nexport DISPLAY=:0.0\n\n# Start in ~\ncd $HOME" >> $HOME/.bashrc
