#!/bin/bash

# bin/rails Commands
alias r='bin/rails'
alias rg='bin/rails g'
alias rs='bin/rails s'
alias rc='bin/rails c'
alias rn='bin/rails new'
alias rd='bin/rails dbconsole'
alias rp='bin/rails plugin'
alias ra='bin/rails application'
alias rd='bin/rails destroy'

alias restart='touch tmp/restart.txt'  # restart passenger
alias devlog='tail -f log/development.log'

# bin/rake
alias rt='bin/rake test'
alias rtu='bin/rake test:units'
alias rtf='bin/rake test:functionals'
alias rti='bin/rake test:integration'
alias rr='bin/rake routes'
alias rdbm='bin/rake db:migrate'
alias rdbr='bin/rake db:rollback'

rails-help () {
  echo "bin/rails Aliases Usage"
  echo
  echo "  r           = bin/rails"
  echo "  rg          = bin/rails generate"
  echo "  rs/ss       = bin/rails server"
  echo "  rc/sc       = bin/rails console"
  echo "  rn          = bin/rails new"
  echo "  rd          = bin/rails dbconsole"
  echo "  rp          = bin/rails plugin"
  echo "  ra          = bin/rails application"
  echo "  rd          = bin/rails destroy"
  echo "  restartapp  = touch tmp/restart.txt"
  echo "  restart     = touch tmp/restart.txt"
  echo "  devlog      = tail -f log/development.log"
  echo "  taild       = tail -f log/development.log"
  echo
}

