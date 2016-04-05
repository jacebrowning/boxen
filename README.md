# Boxen

[![TeamCity](http://crackfox.office.modustri.com:8111/app/rest/builds/buildType:%28id:Boxen_PullRequest%29/statusIcon)](http://crackfox.office.modustri.com:8111/project.html?projectId=Boxen&tab=projectOverview)

## Contents

Boxen will install and manage your all of the system dependencies listed here.

Python development:

* pyenv
* Python 3.5
* virtualenv

Ruby development:

* rbenv
* Ruby 2.2.3
* Ruby 2.3.0

Ember development:

* n
* nodenv
* Node / NPM
* Bower

iOS development:

* xctool
* LCOV
* Groovy

Dependency management:

* Bundler
* GitMan
* Honcho

Databases:

* PostgreSQL 9.4

Documentation tooling:

* Graphviz
* Java

## Installation

Uninstall your current Homebrew setup (https://gist.github.com/mxcl/1173223) and delete leftover links to Homebrew installed in `/usr/local/bin`. Install Xcode tools:

```sh
$ xcode-select --install
```

Clone this project by pasting these commands exactly:

```sh
$ sudo mkdir -p /opt/boxen
$ sudo chown ${USER}:staff /opt/boxen
$ git clone https://github.com/modustri/boxen /opt/boxen/repo
```

Run boxen:

```sh
$ cd /opt/boxen/repo
$ ./script/boxen
```

Add the following line to the end of your shell run configuation (`.zshrc`, `.bashrc`, `.profile`, etc.):

```
source /opt/boxen/env.sh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
RBENV_ROOT=/opt/boxen/rbenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
PYENV_ROOT=/opt/boxen/pyenv
```

Open a new terminal window and verify the `boxen` command is available. Boxen is now installed.

## Updates

To apply updates in the future:

```sh
$ boxen
```

For additional customization, consult the upstream [README](https://github.com/boxen/our-boxen#customizing).
