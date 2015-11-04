# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.2"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.1", :repo => "mriddle/puppet-gcc"
github "git",         "2.7.7"
github "go",          "2.1.0"
github "homebrew",    "1.12.0"
github "hub",         "1.4.1"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.4"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.5.2"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"
github "sysctl",      "1.0.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "osx",         "1.0.0"

github "java",        "1.8.4"
github "nodejs",      "4.0.1"
github "virtualbox",  "1.0.13"
github "vagrant",     "3.3.0"
github "heroku",      "2.0.0"
github "postgresql",  "4.0.1"
github "python",      "3.0.1", :repo => "mloberg/puppet-python"
github "mercurial",   "1.0.0", :repo => "thejchap/puppet-mercurial"

github "zsh",         "1.0.0"
github "ohmyzsh",     "1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"

github "iterm2",      "1.2.0"

github "github_for_mac",  "1.0.3"
github "sourcetree",      "1.0.0"
github "p4merge",         "0.0.3", :repo => "steinim/puppet-p4merge"

github "sublime_text", "1.0.1"
github "dia",          "0.0.2"
github "atom",         "1.3.0"

github "xctool",      "0.0.2"
github "oclint",      "1.1.6"

github "appcleaner",  "1.0.0"
github "daisy_disk",  "1.0.2", :repo => "Adonit/puppet-daisy_disk"
github "spectacle",   "1.0.0"
