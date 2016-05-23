#!/bin/bash

alias j="z"
alias ms="mux start"
alias rr="bin/rake routes"

alias v="vi"
alias vi="nvim"
alias vim="nvim"

#git
alias gaa='git add --all'
alias push='git push'
alias pull='git pull'

#bundler
alias bo='bundle open'

# Markdown
alias md2rtf='pbpaste | markdown | textutil -stdin -stdout -format html -convert rtf | pbcopy'
alias md2html='pbpaste | markdown | browser'

# Fast editing
alias edd="z dotfiles && vi . && cd -"
alias eds="cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User && s ."

#rails migrations editing
alias cm='cat `ls db/migrate/*.rb | tail -n 1`'
alias vm='vi `ls db/migrate/*.rb | tail -n 1`'

# Server in ruby
alias serverr="ruby -run -e httpd . -p5000"

# Apache
alias apache_restart="sudo apachectl -k graceful"
alias apache_stop="sudo apachectl -k graceful-stop"
alias apache_start="sudo apachectl -k start"

# Clean up
#alias rm="rmtrash"
alias biggest_files="find . -type f -print0 | xargs -0 du -s | sort -n | tail -20 | cut -f2 | xargs -I{} du -sh {}"
alias biggest_folders="du -hsx * | gsort -rh | head -20"

#postgres shortcuts
alias pgs="postgres_start"

#ctags
#alias tags="ctags -R --languages=Ruby,HTML,JavaScript --exclude=.git --exclude=log --exclude=lib/tracker/node_modules --exclude=vendor/assets/bower_components ."
alias tags="ctags --recurse --languages=Ruby,HTML,JavaScript --exclude=.git --exclude=log --exclude=lib/tracker/node_modules --exclude=vendor/assets/bower_components \`bundle show --paths\` ."

#rake to binstubs
alias rake="bin/rake"
alias rspec="bin/rspec 2>/dev/null"

#rails migrations
alias dbr="rake db:rollback"
alias dbtp="rake db:test:prepare"
alias dbm="rake db:migrate"
alias dbmm="dbm && dbr && dbm && dbtp"

#dokku 
alias dokku='$HOME/.dokku/contrib/dokku_client.sh'
alias d='dokku'
