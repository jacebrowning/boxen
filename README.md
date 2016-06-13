# Boxen

## Installation

Unless this is a new machine, you will need to uninstall your current Homebrew setup (https://gist.github.com/mxcl/1173223) and delete leftover links to Homebrew installed in `/usr/local/bin`.

Install Xcode and launch it to accept the license agreements. Install the Xcode command-line tools:

```sh
$ xcode-select --install
```

Clone this project by pasting these commands exactly:

```sh
$ sudo mkdir -p /opt/boxen
$ sudo chown ${USER}:staff /opt/boxen
$ git clone https://github.com/jacebrowning/boxen /opt/boxen/repo
```

Run boxen:

```sh
$ cd /opt/boxen/repo
$ ./script/boxen
```

Add the following lines to the end of your shell run configuration (`.zshrc`, `.bashrc`, etc.):

```
source /opt/boxen/env.sh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
RBENV_ROOT=/opt/boxen/rbenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
PYENV_ROOT=/opt/boxen/pyenv
if which fuck > /dev/null; then eval "$(thefuck --alias)"; fi
```

Open a new terminal window and verify the `boxen` command is available. Boxen is now installed.

## Updates

To apply updates in the future:

```sh
$ boxen
```

For additional customization, consult the upstream [README](https://github.com/boxen/our-boxen#customizing).
