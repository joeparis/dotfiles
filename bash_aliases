#!/usr/bin/env bash

# Sourced by ~/.bashrc.

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
