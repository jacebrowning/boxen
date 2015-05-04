# python versions
package { 'python':
  ensure => installed,
  provider => homebrew,
}
package { 'python3':
  ensure => installed,
  provider => homebrew,
}
$python_libs = "virtualenv pep8 pep8radius pep257 pylint nose pytest coverage"
exec { "install common python2 libraries":
  command => "python2 -m ensurepip; python2 -m pip install --upgrade $python_libs ansible",
  require => Package['python'],
}
exec { "install common python3 libraries":
  command => "python3 -m ensurepip; python3 -m pip install --upgrade $python_libs doorstop gdm mine",
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
