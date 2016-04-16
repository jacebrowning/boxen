class people::jasich {

  package { 'bash-completion':
    ensure => installed,
    provider => homebrew,
  }

}
