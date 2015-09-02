# Install Python versions
$python2 = '2.7.8'
$python3 = '3.4.2'
python::version { "$python2": }
python::version { "$python3": }

# Set the global version of Python
class { 'python::global':
  version => "$python3"
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
