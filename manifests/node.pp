$node_version = "4.0.0"

class { 'nodejs::global':
  version => $node_version
}

npm_module { "bower for ${node_version}":
  module       => 'bower',
  version      => '~> 1.7.2',
  node_version => $node_version,
}
