class people::jacebrowning {

  # shell
  include zsh
  include ohmyzsh
  repository { "/Users/${::boxen_user}/.dotfiles":
      source => 'jacebrowning/dotfiles',
      provider => git,
      ensure   => 'origin/HEAD',
  }
  $dotfiles =  "${boxen::config::srcdir}/dotfiles"
  file { $dotfiles:
    ensure => link,
    target => "/Users/${::boxen_user}/.dotfiles"
  }
  exec { "install dotfiles":
    require => File[$dotfiles],
    command => "/usr/bin/make -C /Users/${::boxen_user}/.dotfiles"
  }

  # terminal
  include iterm2::dev

  # version control
  include github_for_mac
  include sourcetree
  include p4merge
  package { 'diffmerge': provider => brewcask }

  # development
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
  include atom
  repository { "/Users/${::boxen_user}/.atom":
    source => 'jacebrowning/atom-config',
    provider => git,
    ensure   => 'origin/HEAD',
  }
  file { "${boxen::config::srcdir}/atom-config":
    ensure => link,
    target => "/Users/${::boxen_user}/.atom",
  }

  # applications
  include daisy_disk
  include appcleaner
  include spectacle
  package { 'skype': provider => 'brewcask' }
  package { 'macpilot': provider => 'brewcask' }
  package { 'caffeine': provider => 'brewcask' }
  package { 'gitter': provider => 'brewcask'}

  # tools written in Python 2
  $python2 = '2.7.10'

  # tools written in Python 3
  $python3 = '3.5.0'
  python::package { "doorstop for $python3":
    package => 'doorstop',
    python  => $python3,
    version => '== 0.8',
  }
  python::package { "mine for $python3":
    package => 'mine',
    python  => $python3,
    version => '== 0.3.dev4',
  }
  python::package { "curmit for $python3":
    package => 'curmit',
    python  => $python3,
    version => '== 1.0',
  }
  python::package { "thefuck for $python3":
    package => 'thefuck',
    python  => $python3,
    version => '== 3.1',
  }
  python::package { "dropthebeat for $python3":
    package => 'dropthebeat',
    python  => $python3,
    version => '== 0.1',
  }

}
