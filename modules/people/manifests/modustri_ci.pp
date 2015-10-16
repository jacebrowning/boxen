class people::jacebrowning {

  # tools
  include iterm2::dev
  include sublime_text

  # projects
  repository { "${boxen::config::srcdir}/modustri-api":
    source => 'modustri/api',
    provider => git,
    ensure   => 'origin/HEAD',
  }

}
