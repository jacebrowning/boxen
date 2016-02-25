$ruby_version = '2.2.3'

ruby::version { $ruby_version: }
ruby::version { '2.3.0': }

class { 'ruby::global': version => $ruby_version }

ruby_gem { 'bundler for all rubies':
  gem          => 'bundler',
  version      => '1.11.2',
  ruby_version => '*',
}

ruby_gem { 'cocoapods for current ruby':
  gem          => 'cocoapods',
  version      => '0.39.0',
  ruby_version => $ruby_version,
}

ruby_gem { 'travis for current ruby':
  gem          => 'travis',
  ruby_version => $ruby_version,
}

ruby_gem { 'terminal-notifier for current ruby':
  gem          => 'terminal-notifier',
  ruby_version => $ruby_version,
}
