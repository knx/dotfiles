cite about-plugin
about-plugin 'adds "remove_gem" function'

function remove_gem {
  about 'removes installed gem'
  param '1: installed gem name'
  group 'ruby'

  gem list | grep $1 | awk '{ print $1; }' | xargs sudo gem uninstall
}

function new_app {
  about 'creates new app using app composer'
  param '1: new app name'
  group 'ruby'

  rails new $1 -m https://raw.github.com/RailsApps/rails-composer/master/composer.rb -T
}
