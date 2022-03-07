#!/bin/bash

cd /app

composer install

cd /app/web

drush cache:rebuild
drush updatedb --yes
drush config:import --yes

# The chosen module needs to download the library.
# There is a Drush command for that.
drush chosenplugin

drush cache:rebuild
