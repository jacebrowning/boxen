class people::jacebrowning {

  # Shell
  include zsh
  include ohmyzsh
  $dotfiles_custom = "/Users/${::boxen_user}/.dotfiles-custom"
  repository { $dotfiles_custom:
    source => 'jacebrowning/dotfiles',
    provider => git,
    ensure   => 'origin/HEAD',
  }
  exec { "install custom dotfiles":
    require => Repository[$dotfiles_custom],
    command => "/usr/bin/make -C $dotfiles_custom"
  }
  file { "${boxen::config::srcdir}/dotfiles-custom":
    ensure => link,
    target => "/Users/${::boxen_user}/.dotfiles-custom"
  }

  # Terminal
  include iterm2::dev

  # Version control
  include github_for_mac
  include sourcetree
  include p4merge
  package { 'diffmerge': provider => brewcask }

  # Development
  include dia
  package { 'cronnix': provider => 'brewcask' }
  file { "${boxen::config::srcdir}/sublime-settings":
    ensure => link,
    target => "/Users/${::boxen_user}/Library/Application Support/Sublime Text 3/Packages/User"
  }
  package { 'pandoc':
    ensure => installed,
    provider => homebrew,
  }
  repository { "/Users/${::boxen_user}/Dropbox/Settings/Atom":
    source => 'jacebrowning/atom-config',
    provider => git,
  }
  file { "/Users/${::boxen_user}/.atom":
    ensure => link,
    target => "/Users/${::boxen_user}/Dropbox/Settings/Atom",
  }
  file { "${boxen::config::srcdir}/atom-config":
    ensure => link,
    target => "/Users/${::boxen_user}/Dropbox/Settings/Atom",
  }

  # Applications
  include daisy_disk
  include appcleaner
  include spectacle
  package { 'skype': provider => 'brewcask' }
  package { 'macpilot': provider => 'brewcask' }
  package { 'caffeine': provider => 'brewcask' }
  package { 'gitter': provider => 'brewcask'}

  # Tools written in Python 2
  $python2 = '2.7.10'

  # Tools written in Python 3
  $python3 = '3.5.0'
  python::package { "doorstop for $python3":
    package => 'doorstop',
    python  => $python3,
    version => '>=1.0,<2.0',
  }
  python::package { "mine for $python3":
    package => 'mine',
    python  => $python3,
    version => '>=0.4.2,<0.5',
  }
  python::package { "curmit for $python3":
    package => 'curmit',
    python  => $python3,
    version => '>=1.0,<2',
  }
  python::package { "dropthebeat for $python3":
    package => 'dropthebeat',
    python  => $python3,
    version => '>=0.2.1,<0.3',
  }

}
