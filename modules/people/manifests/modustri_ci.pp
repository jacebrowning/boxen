class people::modustri_ci {

  # Applications
  include iterm2::dev
  include sublime_text
  package { 'caffeine': provider => 'brewcask' }

  # Projects
  repository { "${boxen::config::srcdir}/modustri-api":
    source => 'modustri/api',
    provider => git,
  }
  repository { "${boxen::config::srcdir}/modustri-uc-ios":
    source => 'modustri/uc-mobile',
    provider => git,
  }
  repository { "${boxen::config::srcdir}/modustri-uc-web":
    source => 'modustri/uc-web',
    provider => git,
  }
  repository { "${boxen::config::srcdir}/modustri-uc":
    source => 'modustri/uc',
    provider => git,
  }

  # TeamCity
  file { "/Users/${::boxen_user}/Library/LaunchAgents/jetbrains.teamcity.BuildAgent.plist":
    ensure => present,
    source => "${boxen::config::srcdir}/TeamCity/buildAgent/bin/jetbrains.teamcity.BuildAgent.plist"
  }

}
