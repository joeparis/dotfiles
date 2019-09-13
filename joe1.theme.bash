#!/usr/bin/env bash
# ~/bash_it/custom/themes/joe1/joe1.theme.bash

reset="\e[0m"
dir_color="\e[38;5;51m"
clock_color="\e[38;5;33m"
text_color="\e[38;5;252m"
user_host_color="\e[38;5;39m"

SCM_NONE_CHAR=''
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" ${green}|"
SCM_THEME_PROMPT_SUFFIX="${green}|"
# SCM_GIT_SHOW_MINIMAL_INFO=true

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

VIRTUALENV_THEME_PROMPT_PREFIX='('
VIRTUALENV_THEME_PROMPT_SUFFIX=') '

THEME_SHOW_USER_HOST=true
USER_HOST_THEME_PROMPT_PREFIX='['
USER_HOST_THEME_PROMPT_SUFFIX='] '

THEME_SHOW_CLOCK=true
THEME_SHOW_CLOCK_CHAR=${THEME_SHOW_CLOCK_CHAR:-"false"}
#THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$bold_cyan"}
THEME_CLOCK_COLOR=${clock_color}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%Y-%m-%d %H:%M:%S"}

# https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
# https://github.com/eikenb/terminal-colors
# https://misc.flogisoft.com/bash/tip_colors_and_formatting

function prompt_command() {
    # This needs to be first to save last command return code
    local RC="$?"

    clock="$(clock_prompt)${reset} "
    rvn="${bold_yellow}$(ruby_version_prompt)"
    virtualenv="${bold_yellow}$(virtualenv_prompt)"

    user_host="${user_host_color}\u@\h "
    current_directory="${dir_color}\w${reset} "

    scm_prompt="$(scm_prompt_char_info)"

    # Set return status color
    if [[ ${RC} == 0 ]]; then
        ret_status="${bold_green}"
    else
        ret_status="${bold_red}"
    fi

    PS1="\n${clock}${rvn}${virtualenv}${user_host}${normal}${text_color}in${reset} ${current_directory}\n$(scm_prompt_char_info)${ret_status}→ ${normal}\$ "
}

safe_append_prompt_command prompt_command
