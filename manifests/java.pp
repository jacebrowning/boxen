package { 'java':
  provider => 'brewcask',
}

# remove the unnecessary Java Preferences icon
file {'/Library/PreferencePanes/JavaControlPanel.prefPane':
  ensure => absent,
}
