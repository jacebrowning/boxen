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

  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx
  include brewcask

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # databases
  package {'postgresql':
    ensure => installed,
    provider => 'homebrew',
  }

  # programming languages
  include $python
  include $java
  ruby::version { '2.1.2': }
  class { 'ruby::global': version => '2.1.2' }
  nodejs::version { 'v0.12': }
  class { 'nodejs::global': version => 'v0.12' }
  nodejs::module { 'bower': node_version => 'v0.12' }
  nodejs::module { 'ember-cli': node_version => 'v0.12' }
  include $ios

  # web browsers
  package { 'google-chrome': provider => 'brewcask' }
  package { 'firefox': provider => 'brewcask' }

  # common useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  # tools needed edit this project
  file { "${boxen::config::srcdir}/MyBoxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  # provisioning and deployment
  include virtualbox
  class { 'vagrant': completion => true }
  include heroku

}
