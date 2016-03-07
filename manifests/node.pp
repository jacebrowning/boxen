$node_version = "4.2.4"

class { 'nodejs::global':
  version => $node_version
}

npm_module { "bower for ${node_version}":
  module       => 'bower',
  version      => '~> 1.7.2',
  node_version => $node_version,
}
npm_module { "diff-so-fancy for default node":
  module       => 'diff-so-fancy',
  node_version => $node_version,
}

include phantomjs

phantomjs::version { '1.9.8': }
phantomjs::version { '2.1.1': }

phantomjs::global { '1.9.8': }
