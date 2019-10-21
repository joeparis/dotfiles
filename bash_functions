#!/usr/bin/env bash

# function swpps1 {
#   joe_green="\[$(tput setaf 82)\]"
#   joe_yellow="\[$(tput setaf 220)\]"

#   if [ -z "${fancy_ps1}" ]
#   then
#     echo "${fancy_ps1}"
#     unset fancy_ps1
#   else
#     echo "Fancy ps1 does not exist"
#     fancy_ps1="$PS1"
#   fi

# }

function swpps1 {
  . ./bin/swp.sh
  clear
}

# Convert Python code files to RTF for quick-and-easy formatted copy-paste into PowerPoint.
function mkrtf { 
    for i in *.py; do
        [ -f "$i" ] || break
        name=$"{i%.*}"
        pygmentize -P "fontface=Cascadia Code" -f rtf -o "$name".rtf "$i"
    done
}

# Make placeholder Python files for student assignments and labs.
function mkpy {
    for i in `seq -w 1 10`; do touch $i.py; done
}

# The following was birthed as the start of a function to quickly convert svg files exported from Microsoft Whiteboard
# to a scaled png for readability sake.
#
#for i in *.svg; do
#    [ -f "$i" ] || break
#    #name=$(basename 19.10.16.svg .svg)
#    name="${i%.*}"
#    height=$(inkscape -H "$name".svg)
#    inkscape -z -e "$name".png -a 0:0:250:"$height" -w 1500 -d 300 "$name".svg 
#    #echo "${i%.*}"
#done
