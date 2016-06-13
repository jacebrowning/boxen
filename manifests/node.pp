$node_version = "4.2.4"

class { 'nodejs::global':
  version => $node_version
}

npm_module { "bower for global node":
  module       => 'bower',
  version      => '~> 1.7.2',
  node_version => $node_version,
}
npm_module { "diff-so-fancy for global node":
  module       => 'diff-so-fancy',
  node_version => $node_version,
}
npm_module { "svg2png-command for global node":
  module       => 'svg2png-command',
  version      => '~> 1.0.2',
  node_version => $node_version,
}

include phantomjs

$phantom_version = "1.9.8"

phantomjs::version { $phantom_version: }
phantomjs::version { '2.1.1': }

phantomjs::global { $phantom_version: }
