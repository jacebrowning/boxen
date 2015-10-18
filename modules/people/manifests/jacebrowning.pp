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
  include sublime_text
  repository { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 3/Packages/User":
    source => 'jacebrowning/sublime-settings',
    provider => git,
    ensure   => 'origin/HEAD',
  }
  file { "${boxen::config::srcdir}/sublime-settings":
    ensure => link,
    target => "/Users/${::boxen_user}/Library/Application Support/Sublime Text 3/Packages/User"
  }

  # applications
  include daisy_disk
  include appcleaner
  include spectacle
  package { 'skype': provider => 'brewcask' }
  package { 'macpilot': provider => 'brewcask' }
  package { 'caffeine': provider => 'brewcask' }
  package { 'gitter': provider => 'brewcask'}

}
