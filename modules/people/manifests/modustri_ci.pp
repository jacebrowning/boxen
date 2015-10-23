class people::modustri_ci {

  # applications
  include iterm2::dev
  include sublime_text
  package { 'caffeine': provider => 'brewcask' }

  # projects
  repository { "${boxen::config::srcdir}/modustri-api":
    source => 'modustri/api',
    provider => git,
    ensure   => 'origin/HEAD',
  }
  repository { "${boxen::config::srcdir}/modustri-uc-ios":
    source => 'modustri/uc-mobile',
    provider => git,
    ensure   => 'origin/HEAD',
  }
  repository { "${boxen::config::srcdir}/modustri-uc-web":
    source => 'modustri/uc-web',
    provider => git,
    ensure   => 'origin/HEAD',
  }
  repository { "${boxen::config::srcdir}/modustri-uc":
    source => 'modustri/uc',
    provider => git,
    ensure   => 'origin/HEAD',
  }

}
