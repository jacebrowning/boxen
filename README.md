# Boxen

## Contents

Boxen will install and manage your all of the system dependencies listed here.

Python development:

* [Python 3.5](https://www.python.org/downloads): `$ brew install python3`
* [virtualenv](https://virtualenv.pypa.io/en/latest/installation.html): `$ pip3 install virtualenv`

Ember development:

* [Node.js](http://nodejs.org): `$ brew install node`
* [n (Node Switcher)](https://github.com/tj/n) `$ npm install -g n && n 4.2.4`
* [Bower](http://bower.io/): `$ npm install -g bower`

iOS development:

* [Xcode](https://developer.apple.com/xcode)
  * Install command-line tools: `$ xcode-select --install`
* [xctool](https://github.com/facebook/xctool): `$ brew install xctool`
* [LCOV](http://ltp.sourceforge.net/coverage/lcov.php): `$ brew install lcov`
* [Groovy](http://www.groovy-lang.org): `$ brew install groovy`

Dependency management:

* [Bundler](http://bundler.io): `$ sudo gem install bundler`
* [GDM](http://git-dependency-manager.info): `$ pip3 install gdm`
* [Honcho](https://honcho.readthedocs.org): `$ brew install python3 && pip3 install honcho`

Databases:

* [PostgreSQL 9.4](http://www.postgresql.org/download): `$ brew install postgres`
  * Ensure the server is running: http://stackoverflow.com/questions/7975556

Documentation tooling:

* [Graphviz](http://www.graphviz.org/Download.php): `$ brew install graphviz`
* [Java](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html)

Deployment tooling:

* [boto](https://github.com/boto/boto): `$ brew install python && pip2 install boto`

## Installation

Uninstall your current Homebrew setup (https://gist.github.com/mxcl/1173223) and delete leftover links to Homebrew installs in `/usr/local/bin`.

Clone this project:

    $ sudo mkdir -p /opt/boxen
    $ sudo chown ${USER}:staff /opt/boxen
    $ git clone https://github.com/modustri/boxen /opt/boxen/repo

Run boxen:

    $ cd /opt/boxen/repo
    $ ./script/boxen

Add the following line to the end of your shell run configuation (`.zshrc`, `.bashrc`, `.profile`, etc.):

    source /opt/boxen/env.sh
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
    RBENV_ROOT=/opt/boxen/rbenv
    if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
    PYENV_ROOT=/opt/boxen/pyenv

Open a new terminal window and verify the `$ boxen` command is available. Boxen is now installed.

## Updates

To apply updates in the future:

    $ boxen

For additional customization, consult the upstream [README](https://github.com/boxen/our-boxen#customizing).
