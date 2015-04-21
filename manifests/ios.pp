# install tools
ruby_gem { 'cocoapods for all rubies':
  gem          => 'cocoapods',
  ruby_version => '*',
}

# test tools
include xctool

# analysis tools
include oclint
