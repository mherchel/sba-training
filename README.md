# SBA D9 Chrome

Temporary repo for SBA D9 work, until the team gets access to SBA's GitHub acount.

1. [Local Inititialization](#local-initialization)
2. [Updating Your Local Installation](#updating-your-local-installation)

## Local Initialization

You should only need to run the local installation the first time you set up your
local development environment.

First, check out this repository to a directory on your computer.

The easiest way to set up a local development environment is to use [Lando](https://lando.dev/). <br />
If you haven't already done so, download and install [the latest release](https://github.com/lando/lando/releases).

Once you have the code checked out, and Lando installed;
using the command line, change to the directory where this repository is checked out
and run:

```
lando start
```

Lando will install Docker*, and build the container environement.
After that setup is finished, run:

```
lando composer install
```

Next, copy the local settings example file:

```
cp ./web/sites/example.settings.local.php ./web/sites/default/settings.local.php
```

Then, edit the new `settings.local.php` file and add the following to the bottom.

```
$databases['default']['default'] = [
  'database' => 'drupal9',
  'username' => 'drupal9',
  'password' => 'drupal9',
  'host' => 'database',
  'port' => '3306',
  'driver' => 'mysql',
  'prefix' => '',
  'collation' => 'utf8mb4_general_ci',
];

$config['config_split.config_split.non_prod']['status'] = TRUE;
$config['config_split.config_split.local']['status'] = TRUE;
```

Next, initialize the site with the existing configuration.

```
lando drush site:install --existing-config
```

You should make a note of the admin username and password that is generated.
If you don't you can always log in from the command line by running:

```
lando drush user:login
```

Aaaand, you're done. Your site should be available at https://sba-d9-chrome.lndo.site/. <br>

***

*It is best to let Lando install the version of Docker that it is expecting.
Installing a different version, or updating outside of Lando sometimes can cause unexpected behavior.

## Updating Your Local Installation

If you have already setup your local, but you need to update to the latest configuration and schema,
then run:

```
lando local-update
```
