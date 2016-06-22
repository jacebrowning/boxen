class people::jacebrowning {

  # Shell
  include zsh
  include ohmyzsh
  $dotfiles = "/Users/${::boxen_user}/.dotfiles"
  repository { $dotfiles:
    source => 'jacebrowning/dotfiles',
    provider => git,
    ensure   => 'origin/HEAD',
  }
  exec { "install custom dotfiles":
    require => Repository[$dotfiles],
    command => "/usr/bin/make -C $dotfiles"
  }
  file { "${boxen::config::srcdir}/dotfiles":
    ensure => link,
    target => "/Users/${::boxen_user}/.dotfiles"
  }

  # Terminal
  include iterm2::dev

  # Version control
  include github_for_mac
  include sourcetree
  include p4merge
  package { 'diffmerge': provider => brewcask }

  # Applications
  include daisy_disk
  include appcleaner
  include spectacle
  package { 'skype': provider => 'brewcask' }
  package { 'macpilot': provider => 'brewcask' }
  package { 'caffeine': provider => 'brewcask' }
  package { 'gitter': provider => 'brewcask'}
  package { 'cronnix': provider => 'brewcask' }
  package { 'sococo': provider => 'brewcask' }
  package { 'flowdock': provider => 'brewcask' }
  package { 'postico': provider => 'brewcask' }
  package { 'sequel-pro': provider => 'brewcask' }

  # Projects
  file { "${boxen::config::srcdir}/boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
  file { "${boxen::config::srcdir}/sublime-settings":
    ensure => link,
    target => "/Users/${::boxen_user}/Library/Application Support/Sublime Text 3/Packages/User"
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
    version => '>=0.5,<0.6',
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
