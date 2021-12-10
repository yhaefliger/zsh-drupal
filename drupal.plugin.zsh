# find and cd to drupal root folder
function droot() {
  dir=.
  until [ $dir -ef / ]; do
    if [ -d "$dir/web" ]; then
      cd "$dir"
      return 0
    fi
    dir+=/..
  done

  echo "root folder not found"

  return 1
}

# cd to the active theme path
function dtheme() {
  root=`drush ev "echo DRUPAL_ROOT"`
  cd "$root"
  theme_path=`drush ev "echo \Drupal::theme()->getActiveTheme()->getPath()"`
  cd "$theme_path"
  return 0
}

# aliases
alias dcr='drush cache:rebuild'
alias dcc='drush cache:clear'

alias dcex='drush config:export'
alias dcim='drush config:import'
alias dcget='drush config:get'
alias dcset='drush config:set'
alias dcedit='drush config:edit'

alias dup='drush updatedb'
alias dco='composer outdated "drupal/*"'
alias dcur='composer update drupal/core "drupal/core-*" --with-all-dependencies' #with drupal-core-recommended
alias dcu='composer update drupal/core --with-dependencies'

# autocomplete
compdef _drush_add_completion drush

function _drush_add_completion() {
  if [ -x "$(command -v drush)" ]; then
    compadd `_drush_get_command_list`
  fi
}

function _drush_get_command_list() {
  drush list --raw | awk '{print $1}'
}
