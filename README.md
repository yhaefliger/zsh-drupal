# Drupal ZSH Plugin

Mainly inspired from [Artisan ZSH plugin](https://github.com/jessarcher/zsh-artisan) by Jess Archer

* 3 new functions: `droot` to go from anywhere within a drupal project to the root directory, `dtheme` to go to the active theme directory and `dsite` to go to site directory.
* `drush` function auto-completion.
* common `drush` tasks aliases (cache/config).

## Requirement

* [zsh](https://www.zsh.org/)
* [oh-my-zsh](https://ohmyz.sh/)
* [drush](https://www.drush.org/)
* [drush-launcher](https://github.com/drush-ops/drush-launcher) or drush installed in your global $PATH with another method :)

## Installation

### Manual

```
git clone https://github.com/yhaefliger/zsh-drupal.git ~/.oh-my-zsh/custom/plugins/drupal
```

### Antigen

Add this line in your `.zshrc` file before `antigen apply` call
```
antigen bundle yhaefliger/zsh-drupal
```

Add `drupal` in the plugin directive of your `.zshrc` file

## Aliases

### Drush

* `dcr`: drush cache:rebuild
* `dcc`: drush cache:clear
* `dcex`: drush config:export
* `dcim`: drush config:import
* `dcget`: drush config:get
* `dcset`: drush config:set
* `dcedit`: drush config:edit
* `dup`: drush updatedb

### Composer

Check Drupal outdated versions and update core as recommended in the [documentation](https://www.drupal.org/docs/updating-drupal/updating-drupal-core-via-composer)

* `dco`: composer outdated "drupal/*"
* `dcu`: composer update drupal/core --with-dependencies
* `dcur`: composer update drupal/core "drupal/core-*" --with-all-dependencies
