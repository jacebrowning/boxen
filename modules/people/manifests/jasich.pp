class people::jasich {

  package { 'bash-completion':
    ensure => installed,
    provider => homebrew,
  }

  # tools written in Python 3
  $python3 = '3.5.0'

  python::package { "thefuck for $python3":
    package => 'thefuck',
    python  => $python3,
    version => '>= 3.1',
  }

}
