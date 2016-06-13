require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {

  # Core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx
  include brewcask

  # Fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # Git configuration
  $dotfiles = "/Users/${::boxen_user}/.dotfiles"
  repository { $dotfiles:
    source => 'modustri/dotfiles',
    provider => git,
    ensure   => 'origin/HEAD',
  }
  exec { "install dotfiles":
    require => Repository[$dotfiles],
    command => "/usr/bin/make -C $dotfiles"
  }
  file { "${boxen::config::srcdir}/dotfiles":
    ensure => link,
    target => "/Users/${::boxen_user}/.dotfiles"
  }

  # Databases and provisioning
  include postgresql
  include heroku

  # Programming languages
  include $ios
  include $java
  include $node
  include $python
  include $ruby

  # Web browsers
  include chrome
  include firefox

  # Tools needed edit this project
  include atom
  file { "${boxen::config::srcdir}/boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

}
