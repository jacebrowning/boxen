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

  # Fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # Core modules, needed for most things
  include git
  include hub
  include brewcask

  # Programming languages
  include $ios
  include $java
  include $node
  include $python
  include $ruby
  include $r

  # Databases
  include postgresql
  include neo4j
  package { 'elasticsearch': }

  # Services
  include $circleci
  include heroku
  package { 'ngrok': provider => 'brewcask' }
  include virtualbox
  include vagrant

  # Editors
  include atom

  # Web browsers
  include chrome
  include firefox

  # Documentation tools
  include dia

  # Alternate programs
  file { "${boxen::config::homebrewdir}/bin/sort":
      ensure  => link,
      target => "${boxen::config::homebrewdir}/bin/gsort",
  }

}
