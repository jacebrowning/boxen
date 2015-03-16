# python versions
package { 'python':
  ensure => installed,
  provider => homebrew,
}
package { 'python3':
  ensure => installed,
  provider => homebrew,
}
$python_libs = "pep8 pep8radius pep257 pylint nose pytest coverage"
exec { "install common python2 libraries":
  command => "pip2 install --upgrade $python_libs",
  require => Package['python'],
}
exec { "install common python3 libraries":
  command => "pip3 install --upgrade $python_libs gdm doorstop",
  require => Package['python3'],
}

# documentation tools
package { 'pandoc':
  ensure => installed,
  provider => homebrew,
}
package { 'graphviz':
  ensure => installed,
  provider => homebrew,
}
