# Install Python versions
$python2 = '2.7.10'
$python3 = '3.5.0'
python::version { '2.6.9': }
python::version { "$python2": }
python::version { '3.3.6': }
python::version { '3.4.3': }
python::version { "$python3": }

# Set the global versions of Python
file { "version":
    path    => "${boxen::config::home}/pyenv/version",
    ensure  => present,
    replace => true,
    content => "$python2\n3.4.3\n$python3\n";
}

# Install core libraries for Python 2
python::package { "setuptools for $python2":
  package => 'setuptools',
  python  => $python2,
  version => '>= 2.1',
}
python::package { "pip for $python2":
  package => 'pip',
  python  => $python2,
  version => '>= 7.1.2',
}
python::package { "virtualenv for $python2":
  package => 'virtualenv',
  python  => $python2,
  version => '>= 13.1',
}

# Install core libraries for Python 3
python::package { "setuptools for $python3":
  package => 'setuptools',
  python  => $python3,
  version => '>= 2.1',
}
python::package { "pip for $python3":
  package => 'pip',
  python  => $python3,
  version => '>= 7.1.2',
}
python::package { "virtualenv for $python3":
  package => 'virtualenv',
  python  => $python3,
  version => '>= 13.1',
}

# Install development tools for Python 2
python::package { "cookiecutter for $python2":
  package => 'cookiecutter',
  python  => $python2,
  version => '>= 1, < 2',
}

# Install development tools for Python 3
python::package { "pep8 for $python3":
  package => 'pep8',
  python  => $python3,
  version => '>= 1.6',
}
python::package { "autopep8 for $python3":
  package => 'autopep8',
  python  => $python3,
  version => '>= 1.2',
}
python::package { "pep257 for $python3":
  package => 'pep257',
  python  => $python3,
  version => '>= 0.6',
}
python::package { "pylint for $python3":
  package => 'pylint',
  python  => $python3,
  version => '>= 1.4',
}
python::package { "cookiecutter for $python3":
  package => 'cookiecutter',
  python  => $python3,
  version => '>= 1, < 2',
}

# Install tools written in Python 2
python::package { "ansible for $python2":
  package => 'ansible',
  python  => $python2,
}

# Install tools written in Python 3
python::package { "doorstop for $python3":
  package => 'doorstop',
  python  => $python3,
  version => '>= 0.8',
}
python::package { "gdm for $python3":
  package => 'gdm',
  python  => $python3,
  version => '>= 0.5.dev2',
}
python::package { "mine for $python3":
  package => 'mine',
  python  => $python3,
  version => '>= 0.3.dev1',
}
python::package { "curmit for $python3":
  package => 'curmit',
  python  => $python3,
  version => '>= 0.1.2',
}

# Install documentation tools
package { 'pandoc':
  ensure => installed,
  provider => homebrew,
}
package { 'graphviz':
  ensure => installed,
  provider => homebrew,
}
