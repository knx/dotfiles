ZSH_THEME_RVM_PROMPT_PREFIX=" "
ZSH_THEME_RVM_PROMPT_SUFFIX=" "

function rvm_prompt {
  if [[ $(git_prompt_info) != "" ]]; then
    echo %{$fg[red]%} $(rvm_prompt_info)
  fi
}

PROMPT='%{$fg[yellow]%}λ %m %{$fg[blue]%}%c %{$fg[yellow]%}$(rvm_prompt)$(git_prompt_info)%{$fg[yellow]%}→ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}  %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
