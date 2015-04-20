class people::jacebrowning {

  include zsh
  include ohmyzsh

  include p4merge

  include daisy_disk
  include appcleaner
  include spectacle

  repository { "/Users/${::boxen_user}/.dotfiles":
      source => 'jacebrowning/dotfiles',
      provider => git
  }
  file { "${boxen::config::srcdir}/dotfiles":
    ensure => link,
    target => "/Users/${::boxen_user}/.dotfiles"
  }
  exec { "install dotfiles":
    command => "/usr/bin/make -C /Users/${::boxen_user}/.dotfiles"
  }

  repository { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 3/Packages/User":
    source => 'jacebrowning/sublime-settings',
    provider => git
  }
  file { "${boxen::config::srcdir}/sublime-settings":
    ensure => link,
    target => "/Users/${::boxen_user}/Library/Application Support/Sublime Text 3/Packages/User"
  }

}
