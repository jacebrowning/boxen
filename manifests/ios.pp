# install tools
ruby_gem { 'cocoapods for all rubies':
  gem          => 'cocoapods',
  ruby_version => '*',
}

# test tools
class { 'xctool':
  version => '0.2.7',
}

# analysis tools
include oclint
