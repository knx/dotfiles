#!/usr/bin/env bash

stty -ixon

export PATH="/usr/local/sbin:$PATH"

# Setting for the new UTF-8 terminal support in Lion                                                                                                                                                                                                                       
export LANG="en_US.UTF-8"                                                                                                                                                                                                                                                  
export LANGUAGE="en_US"                                                                                                                                                                                                                                                    
export LC_CTYPE="en_US.UTF-8"                                                                                                                                                                                                                                                
export LC_ALL="en_US.UTF-8"                                                                                                                                                                                                                                                  

# Identify OS and Machine                                                                                                                                                                                                                                                  
export OS=`uname -s | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`                                                                                                                                                                           
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`                                                                                                                                                                                   
export MACHINE=`uname -m | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`                                                                                                                                                                      
export PLATFORM="$MACHINE-$OS-$OSVERSION"              

# Set Homebrew github token, for search rate limiting prevention
export HOMEBREW_GITHUB_API_TOKEN="58b26c5606282e0da86e1798c7a475a6c13d0a43"

#shopt -s checkwinsize                                                                                                                                                                                                                                                      

# Case-insensitive globbing (used in pathname expansion)                                                                                                                                                                                                                   
shopt -s nocaseglob                                                                                                                                                                                                                                                       

# do not autocomplete on empty line
shopt -s no_empty_cmd_completion

# Append to the Bash history file, rather than overwriting it                                                                                                                                                                                                              
shopt -s histappend 

# Autocorrect typos in path names when using `cd`                                                                                                                                                                                                                          
shopt -s cdspell

shopt -s hostcomplete

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='mine'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@gitlab.digitalheads.pl'

# Set my editor and git editor
export EDITOR="nvim"
export GIT_EDITOR='nvim'
export BUNDLER_EDITOR='nvim'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

export TODO=task

# Load Bash It
source $BASH_IT/bash_it.sh

# # load powerline
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/local/lib/python2.7/site-packages/powerline/bindings/shell/powerline.sh


# # make title setting work hack
# preexec_xterm_title_install
