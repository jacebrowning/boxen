$version = '2.2.3'
ruby::version { $version: }

class { 'ruby::global': version => $version }

ruby_gem { 'bundler for all rubies':
  gem          => 'bundler',
  version      => '~> 1.0',
  ruby_version => '*',
}
