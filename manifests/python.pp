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
    content => "$python3\n\n$python2\n";
}

# Install core libraries for Python 2
python::package { "setuptools for $python2":
  package => 'setuptools',
  python  => $python2,
}
python::package { "pip for $python2":
  package => 'pip',
  python  => $python2,
  version => '>=8.0.2,<9',
}
python::package { "virtualenv for $python2":
  package => 'virtualenv',
  python  => $python2,
  version => '>=14.0.1,<15'
}

# Install core libraries for Python 3
python::package { "setuptools for $python3":
  package => 'setuptools',
  python  => $python3,
}
python::package { "pip for $python3":
  package => 'pip',
  python  => $python3,
  version => '>=8.0.2,<9',
}
python::package { "virtualenv for $python3":
  package => 'virtualenv',
  python  => $python3,
  version => '>=14.0.1,<15'
}

# Install development tools for Python 2
python::package { "pep8 for $python2":
  package => 'pep8',
  python  => $python2,
  version => '>=1.6,<2',
}
python::package { "autopep8 for $python2":
  package => 'autopep8',
  python  => $python2,
  version => '>=1.2,<2',
}
python::package { "pep257 for $python2":
  package => 'pep257',
  python  => $python2,
  version => '>=0.7,<0.8',
}
python::package { "pylint for $python2":
  package => 'pylint',
  python  => $python2,
  version => '>=1.4,<2',
}
python::package { "cookiecutter for $python2":
  package => 'cookiecutter',
  python  => $python2,
  version => '>=1.0.0,<2',
}

# Install development tools for Python 3
python::package { "pep8 for $python3":
  package => 'pep8',
  python  => $python3,
  version => '>=1.6,<2',
}
python::package { "autopep8 for $python3":
  package => 'autopep8',
  python  => $python3,
  version => '>=1.2,<2',
}
python::package { "pep257 for $python3":
  package => 'pep257',
  python  => $python3,
  version => '>=0.7,<0.8',
}
python::package { "pylint for $python3":
  package => 'pylint',
  python  => $python3,
  version => '>=1.4,<2',
}

# Install tools written in Python 2
python::package { "ansible for $python2":
  package => 'ansible',
  python  => $python2,
}

# Install tools written in Python 3
python::package { "gdm for $python3":
  package => 'gdm',
  python  => $python3,
  version => '>=0.8.2,<0.9',
}
python::package { "httpie for $python3":
  package => 'httpie',
  python  => $python3,
  version => '>=0.9.2,<1',
}
python::package { "honcho for $python3":
  package => 'honcho',
  python  => $python3,
  version => '>=0.6.6,<0.7',
}
python::package { "ipython for $python3":
  package => 'ipython',
  python  => $python3,
  version => '>=0.13.2,<0.14',
}
python::package { "notebook for $python3":
  package => 'notebook',
  python  => $python3,
  version => '>=4.0.2,<5',
}
python::package { "cookiecutter for $python3":
  package => 'cookiecutter',
  python  => $python3,
  version => '>=1.3,<2',
}
