#!/usr/bin/env bash
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

### Added by the Heroku Toolbelt                                                                                                                                                                                                                                           
export PATH="$PATH:/usr/local/heroku/bin"                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                           
# if [ -f $(brew --prefix)/etc/bash_completion ]; then                                                                                                                                                                                                                       
#   . $(brew --prefix)/etc/bash_completion                                                                                                                                                                                                                                   
# fi 

stty -ixon
                                                                                                                                                                                                                                                                           
# Setting for the new UTF-8 terminal support in Lion                                                                                                                                                                                                                       
export LANG="en_US.UTF-8"                                                                                                                                                                                                                                                  
export LANGUAGE="en_US"                                                                                                                                                                                                                                                    
export LC_CTYPE=en_US.UTF-8                                                                                                                                                                                                                                                
export LC_ALL=en_US.UTF-8                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                           
# Identify OS and Machine                                                                                                                                                                                                                                                  
export OS=`uname -s | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`                                                                                                                                                                           
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`                                                                                                                                                                                   
export MACHINE=`uname -m | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`                                                                                                                                                                      
export PLATFORM="$MACHINE-$OS-$OSVERSION"                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                           
shopt -s checkwinsize                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                           
# Case-insensitive globbing (used in pathname expansion)                                                                                                                                                                                                                   
shopt -s nocaseglob;                                                                                                                                                                                                                                                       
                                                                                                                                                                                                                                                                           
# Append to the Bash history file, rather than overwriting it                                                                                                                                                                                                              
shopt -s histappend;                                                                                                                                                                                                                                                       
                                                                                                                                                                                                                                                                           
# Autocorrect typos in path names when using `cd`                                                                                                                                                                                                                          
shopt -s cdspell;                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                           
# Stuff I never really use but cannot delete either because of http://xkcd.com/530/                                                                                                                                                                                        
alias stfu="osascript -e 'set volume output muted true'"                                                                                                                                                                                                                   
alias pumpitup="osascript -e 'set volume 7'"                                                                                                                                                                                                                                                                              

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='mine'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@gitlab.digitalheads.pl'

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'
export BUNDLER_EDITOR='vim'

# Set the path nginx
# export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# # Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh
