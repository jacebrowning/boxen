# install tools
ruby_gem { 'cocoapods for all rubies':
  gem          => 'cocoapods',
  ruby_version => '*',
}

# test tools
class { 'xctool':
  version => 'HEAD',
}

# analysis tools
include oclint
