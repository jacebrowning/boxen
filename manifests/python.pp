# Install Python versions
$python2 = '2.7.8'
$python3 = '3.4.2'
python::version { "$python2": }
python::version { "$python3": }

# Set the global version of Python
class { 'python::global':
  version => "$python3"
}

# Install common tools
$python_libs = "pip virtualenv"
exec { "install common python2 libraries":
  command => "pip2 install --upgrade $python_libs ansible",
}
exec { "install common python3 libraries":
  command => "pip3 install --upgrade $python_libs doorstop gdm mine",
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
