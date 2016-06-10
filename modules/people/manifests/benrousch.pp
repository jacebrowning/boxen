class people::benrousch {

  package { 'bash-completion':
    ensure => installed,
    provider => homebrew,
  }

  package { 'github-desktop': provider => 'brewcask' }
  include dia
}
