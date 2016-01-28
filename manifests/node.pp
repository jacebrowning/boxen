$node_version = "4.2.4"

class { 'nodejs::global':
  version => $node_version
}

npm_module { "bower for ${node_version}":
  module       => 'bower',
  version      => '~> 1.7.2',
  node_version => $node_version,
}

phantomjs::version { '2.0.0': }
phantomjs::global { '2.0.0': }
