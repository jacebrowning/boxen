# My Boxen

## Installation

Clone this project:

    $ sudo mkdir -p /opt/boxen
    $ sudo chown ${USER}:staff /opt/boxen
    $ git clone https://github.com/jacebrowning/my-boxen /opt/boxen/repo

Run boxen:

    $ cd /opt/boxen/repo
    $ ./script/boxen
    
Add the following line to the end of your shell run configuation (`.zshrc`, `.bashrc`, `.profile`, etc.):
  
    source /opt/boxen/env.sh
    
Open a new terminal window and verify the `$ boxen` command is available. Boxen is now installed.

## Updates

To apply updates in the future:

    $ boxen

For additional customization, consult the upstream [README](https://github.com/boxen/our-boxen#customizing).
