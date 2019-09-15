#!/usr/bin/env bash

if [ -x /usr/bin/vim ]; then
    mkdir -p $HOME/.vim/colors/

    curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/cobalt2.vim -o $HOME/.vim/colors/cobalt2.vim
    curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/monokai.vim -o $HOME/.vim/colors/monokai.vim
    curl -L https://raw.githubusercontent.com/lifepillar/vim-solarized8/master/colors/solarized8.vim -o $HOME/.vim/colors/solarized8.vim
    curl -L https://raw.githubusercontent.com/lifepillar/vim-solarized8/master/colors/solarized8_flat.vim -o $HOME/.vim/colors/solarized8_flat.vim
    curl -L https://raw.githubusercontent.com/lifepillar/vim-solarized8/master/colors/solarized8_high.vim -o $HOME/.vim/colors/solarized8_high.vim
    curl -L https://raw.githubusercontent.com/lifepillar/vim-solarized8/master/colors/solarized8_low.vim -o $HOME/.vim/colors/solarized8_low.vim

    curl -L https://raw.githubusercontent.com/joeparis/dotfiles/master/vimrc -o $HOME/.vimrc
fi
