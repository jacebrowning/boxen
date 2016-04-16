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

}
