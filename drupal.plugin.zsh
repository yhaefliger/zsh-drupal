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

compdef _drush_add_completion drush

function _drush_add_completion() {
  if [ -x "$(command -v drush)" ]; then
    compadd `_drush_get_command_list`
  fi
}

function _drush_get_command_list() {
  drush list --raw | awk '{print $1}'
}
