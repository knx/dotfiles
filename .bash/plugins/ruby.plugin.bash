#!/bin/bash
remove_gem() {
  gem list | grep $1 | awk '{ print $1; }' | xargs sudo gem uninstall
}

gemmate() {
  GEMDIR=`gem env gemdir`/gems
  mate $GEMDIR/`ls $GEMDIR | grep $1 | sort | tail -1`
}

cat_colorless() {
  cat $1 | sed -r "s/\x1B\[([0-9]{1,3}((;[0-9]{1,3})*)?)?[m|K]//g"
}

new_app() {
  rails new $1 -m https://raw.github.com/RailsApps/rails-composer/master/composer.rb
}

pg_start() {
  pg_ctl start -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log
}
