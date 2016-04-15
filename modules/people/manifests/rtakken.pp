class people::rtakken {

  # Shell
  include zsh
  include ohmyzsh

  # Terminal
  include iterm2::dev

  # Version control
  include github_for_mac
  include sourcetree
  include p4merge
  package { 'diffmerge': provider => brewcask }

  # Applications
  include daisy_disk
  include appcleaner
  include spectacle
  package { 'skype': provider => 'brewcask' }
  package { 'macpilot': provider => 'brewcask' }
  package { 'caffeine': provider => 'brewcask' }
  package { 'gitter': provider => 'brewcask'}

  # Tools written in Python 2
  $python2 = '2.7.10'

  # Tools written in Python 3
  $python3 = '3.5.0'
  python::package { "thefuck for $python3":
    package => 'thefuck',
    python  => $python3,
    version => '>=3.1,<4',
  }
}
