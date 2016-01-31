$ruby_version = '2.2.3'

ruby::version { $ruby_version: }

class { 'ruby::global': version => $ruby_version }

ruby_gem { 'bundler for all rubies':
  gem          => 'bundler',
  version      => '~> 1.11',
  ruby_version => '*',
}

ruby_gem { 'travis for all rubies':
  gem          => 'travis',
  ruby_version => $ruby_version,
}

ruby_gem { 'terminal-notifier for current ruby':
  gem          => 'terminal-notifier',
  ruby_version => $ruby_version,
}
