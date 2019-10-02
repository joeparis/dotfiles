#!/usr/bin/env bash
# ~/bash_it/custom/themes/joe1/joe1.theme.bash

# set -x

# reset="\e[0m"
# dir_color="\e[38;5;51m"
# clock_color="\e[38;5;33m"
# text_color="\e[38;5;252m"
# user_host_color="\e[38;5;39m"
# root_color="\e[38;5;161m"

# SCM_NONE_CHAR=''
# SCM_THEME_PROMPT_DIRTY=" ${red}✗"
# SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
# SCM_THEME_PROMPT_PREFIX=" ${green}|"
# SCM_THEME_PROMPT_SUFFIX="${green}|"
# # SCM_GIT_SHOW_MINIMAL_INFO=true

# GIT_THEME_PROMPT_DIRTY=" ${red}✗"
# GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
# GIT_THEME_PROMPT_PREFIX=" ${green}|"
# GIT_THEME_PROMPT_SUFFIX="${green}|"

# RVM_THEME_PROMPT_PREFIX="|"
# RVM_THEME_PROMPT_SUFFIX="|"

# VIRTUALENV_THEME_PROMPT_PREFIX='('
# VIRTUALENV_THEME_PROMPT_SUFFIX=') '

# THEME_SHOW_USER_HOST=true
# USER_HOST_THEME_PROMPT_PREFIX='['
# USER_HOST_THEME_PROMPT_SUFFIX='] '

# THEME_SHOW_CLOCK=true
# THEME_SHOW_CLOCK_CHAR=${THEME_SHOW_CLOCK_CHAR:-"false"}
# #THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$bold_cyan"}
# THEME_CLOCK_COLOR=${clock_color}
# THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%Y-%m-%d %H:%M:%S"}

# # https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
# # https://github.com/eikenb/terminal-colors
# # https://misc.flogisoft.com/bash/tip_colors_and_formatting

# function prompt_command() {
#     # This needs to be first to save last command return code
#     local RC="$?"

#     clock="$(clock_prompt)${reset} "
#     rvn="${bold_yellow}$(ruby_version_prompt)"
#     virtualenv="${bold_yellow}$(virtualenv_prompt)"

#     user_host="${user_host_color}\u@\h "
#     current_directory="${dir_color}\w${reset} "

#     scm_prompt="$(scm_prompt_char_info)"

#     # Set return status color
#     if [[ ${RC} == 0 ]]; then
#         ret_status="${bold_green}"
#     else
#         ret_status="${bold_red}"
#     fi

#     PS1="\n${clock}${rvn}${virtualenv}${user_host}${normal}${text_color}in${reset} ${current_directory}\n$(scm_prompt_char_info)${ret_status}→ ${normal}\$ "
#     # PS1="${clock}${rvn}${virtualenv}${user_host}${normal}${text_color}in${reset} ${current_directory}$(scm_prompt_char_info)${ret_status}→ ${normal}\$ "
# }

# Detect whether a reboot is required
function show_reboot_required() {
  if [[ ! -z "$_bf_prompt_reboot_info" ]]; then
    if [[ -f /var/run/reboot-required ]]; then
      printf "Reboot required!"
    fi
  fi
}

# Define custom colors we need
# non-printable bytes in PS1 need to be contained within \[ \].
# Otherwise, bash will count them in the length of the prompt
function set_custom_colors() {
  bright_yellow="\[$(tput setaf 226)\]"
  clock_color="\[$(tput setaf 33)\]"
  dark_grey="\[$(tput setaf 8)\]"
  dir_color="\[$(tput setaf 51)\]"
  failure="\[$(tput setaf 9)\]"
  host_color="\[$(tput setaf 39)\]"
  light_grey="\[$(tput setaf 248)\]"
  light_orange="\[$(tput setaf 172)\]"
  lime_yellow="\[$(tput setaf 190)\]"
  powder_blue="\[$(tput setaf 153)\]"
  root_color="\[$(tput setaf 161)\]"
  ssh_color="\[$(tput setaf 100)\]"
  success="\[$(tput setaf 82)\]"
  text_color="\[$(tput setaf 252)\]"
  uh_separator_color="\[$(tput setaf 39)\]"
  user_color="\[$(tput setaf 39)\]"
  venv_color="\[$(tput setaf 220)\]"
  rvm_color="\[$(tput setaf 220)\]"
}

# Set different username color for users and root
function set_user_color() {
  case $(id -u) in
    0)
      printf "${root_color}"
      ;;
    *)
      printf "${user_color}"
      ;;
  esac
}

# Set different host color for local and remote sessions
function set_host_color() {
  # Detect if connection is through SSH
  if [[ ! -z $SSH_CLIENT ]]; then
    printf "${ssh_color}"
  else
    printf "${host_color}"
  fi
}

scm_prompt() {
  CHAR=$(scm_char)
  if [[ $CHAR = $SCM_NONE_CHAR ]]
    then
      return
    else
      echo "$(scm_prompt_info)"
      # echo "$(scm_char)$(scm_prompt_info)"
  fi
}

# Set return status color
function set_user_mark_color() {
  if [[ ${RC} == 0 ]]; then
    printf "${success}"
  else
    printf "${failure}"
  fi

}

function prompt_command() {
  # This needs to be first to save last command return code
  local RC="$?"

  ps_clock="$(clock_prompt)${normal}"
  ps_hostname="$(set_host_color)\h${normal}"
  # ps_path="${light_grey}in ${dir_color}\w${normal}\n"
  ps_path="${dir_color}\w${normal}\n"
  ps_reboot="${bright_yellow}$(show_reboot_required)${normal}\n"
  ps_scm_prompt="${light_grey}$(scm_prompt)"
  ps_uh_separator="${uh_separator_color}@${normal}"
  ps_usermark="$(set_user_mark_color)\$${normal}"
  ps_username="$(set_user_color)\u${normal}"
  ps_rvm="${rvm_color}$(ruby_version_prompt)"
  ps_virtualenv="${venv_color}$(virtualenv_prompt)"

  PS1="\n$ps_clock $ps_username$ps_uh_separator$ps_hostname $ps_path$ps_virtualenv$ps_rvm$ps_scm_prompt$ps_usermark "
}

set_custom_colors

# SCM_GIT_CHAR="±"
RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="| "
SCM_GIT_CHAR="🚐"
SCM_NONE_CHAR=''
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_PREFIX="${green}|"
SCM_THEME_PROMPT_SUFFIX="${green}| "
THEME_CLOCK_COLOR=${clock_color}
THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$bold_cyan"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%Y-%m-%d %H:%M:%S"}
THEME_SHOW_CLOCK_CHAR=${THEME_SHOW_CLOCK_CHAR:-"false"}
THEME_SHOW_CLOCK=true
VIRTUALENV_THEME_PROMPT_PREFIX='('
VIRTUALENV_THEME_PROMPT_SUFFIX=') '

safe_append_prompt_command prompt_command
