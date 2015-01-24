[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt
export PATH="./bin:$PATH:/usr/local/heroku/bin"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Set my editor and git editor
export EDITOR="vim"
export GEM_EDITOR="vim"
export BUNDLER_EDITOR="vim"
# export GIT_EDITOR="vim" is now set in gitconfig

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

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

# Lock and Load a custom theme file from /.bash/themes/
export BASH_THEME='mine'

# Path to the bash it configuration
export BASH=$HOME/.bash

# Load Bash It
source "$BASH"/bash_it.sh

# credulous
if [ -f $(brew --prefix)/etc/profile.d/credulous.sh ]; then
  . $(brew --prefix)/etc/profile.d/credulous.sh
fi

# Don't check mail when opening terminal.
unset MAILCHECK

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
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
