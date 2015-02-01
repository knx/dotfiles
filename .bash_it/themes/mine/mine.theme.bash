#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}●"
SCM_THEME_PROMPT_CLEAN=" ${green}○"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=""

GIT_THEME_PROMPT_DIRTY=" ${orange}●"
GIT_THEME_PROMPT_CLEAN=" ${green}○"
GIT_THEME_PROMPT_PREFIX=" ${green}"
GIT_THEME_PROMPT_SUFFIX="${green}"

RVM_THEME_PROMPT_PREFIX=""
RVM_THEME_PROMPT_SUFFIX=""

function prompt_command() {
    #PS1="${bold_cyan}$(scm_char)${green}$(scm_prompt_info)${purple}$(ruby_version_prompt) ${yellow}\h ${reset_color}in ${green}\w ${reset_color}\n${green}→${reset_color} "
    PS1="\n${yellow}❐ \w ${orange}◆ ${blue}$(ruby_version_prompt)${orange} $(scm_char)$(scm_prompt_info)\n\[\033[G\]${yellow}𝌆${reset_color} "
}

PROMPT_COMMAND=prompt_command;
