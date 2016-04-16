class people::modustri_ci {

  # Shell
  include zsh
  include ohmyzsh
  repository { "/Users/${::boxen_user}/.dotfiles":
    source => 'modustri/dotfiles',
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
  git::config::global { 'color.ui':
    value  => 'false'
  }

  # Applications
  include iterm2::dev
  include sublime_text
  include atom

  # Projects
  repository { "${boxen::config::srcdir}/modustri-api":
    source => 'modustri/api',
    provider => git,
  }
  repository { "${boxen::config::srcdir}/modustri-hde-ios":
    source => 'modustri/hde-ios',
    provider => git,
  }
  repository { "${boxen::config::srcdir}/modustri-hde-web":
    source => 'modustri/hde-web',
    provider => git,
  }
  repository { "${boxen::config::srcdir}/modustri-hde":
    source => 'modustri/hde',
    provider => git,
  }

  # TeamCity
  file { "/Users/${::boxen_user}/Library/LaunchAgents/jetbrains.teamcity.BuildAgent.plist":
    ensure => present,
    source => "${boxen::config::srcdir}/TeamCity/buildAgent/bin/jetbrains.teamcity.BuildAgent.plist"
  }

}
