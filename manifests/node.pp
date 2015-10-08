nodejs::version { 'v0.12.7': }

class { 'nodejs::global': version => 'v0.12.7' }

nodejs::module { 'bower': node_version => 'v0.12.7' }
nodejs::module { 'ember-cli': node_version => 'v0.12.7' }
