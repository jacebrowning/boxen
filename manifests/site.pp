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
  include mercurial

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # databases
  include postgresql

  # programming languages
  include $ios
  include $java
  include $node
  include $python
  include $ruby

  # web browsers
  package { 'google-chrome': provider => 'brewcask' }
  package { 'firefox': provider => 'brewcask' }

  # common useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar',
      'dos2unix',
      'unix2dos',
    ]:
  }

  # tools needed edit this project
  file { "${boxen::config::srcdir}/Boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  # provisioning and deployment
  include virtualbox
  class { 'vagrant': completion => true }
  include heroku

}
