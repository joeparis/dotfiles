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
    #for i in `seq -w 1 10`; do touch $i.py; done
    touch exercise_{01..15}.py
}

ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
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
