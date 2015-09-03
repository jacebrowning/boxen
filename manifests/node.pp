nodejs::version { 'v0.12': }

class { 'nodejs::global': version => 'v0.12' }

nodejs::module { 'bower': node_version => 'v0.12' }
nodejs::module { 'ember-cli': node_version => 'v0.12' }
