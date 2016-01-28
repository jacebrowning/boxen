class people::modustri_ci {

  # Applications
  include iterm2::dev
  include sublime_text

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
