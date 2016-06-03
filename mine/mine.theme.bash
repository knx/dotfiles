#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}●"
SCM_THEME_PROMPT_CLEAN=" ${green}○"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=""

GIT_THEME_PROMPT_DIRTY=" ${orange}●"
GIT_THEME_PROMPT_CLEAN=""
#GIT_THEME_PROMPT_CLEAN=" ${green}○"
GIT_THEME_PROMPT_PREFIX=" ${green}"
GIT_THEME_PROMPT_SUFFIX="${green}"

RVM_THEME_PROMPT_PREFIX=""
RVM_THEME_PROMPT_SUFFIX=""

function set_rvm_prompt() {
  if [ -e ./Rakefile ] 
  then
    echo " ${orange}◆ ${blue}$(ruby_version_prompt)"
  fi 
}

function set_scm_prompt() {
  if [ -e .git ]
  then
    echo "${orange} $(scm_char)$(scm_prompt_info)"
  fi
}

function set_host_prompt() {
  host=${HOSTNAME}
  if [ ${host} != "mbp.local" ]
  then
    echo "${USER}@${host}"
  fi
}

function prompt_command() {
  PS1="\n${yellow}❐ $(set_host_prompt) \w $(set_rvm_prompt)$(set_scm_prompt)\n\[\033[G\]${yellow}𝌆${reset_color} "
}

PROMPT_COMMAND=prompt_command;
