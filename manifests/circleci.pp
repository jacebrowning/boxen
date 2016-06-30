include homebrew

homebrew::tap { 'rockymadden/rockymadden': }

package { 'circleci-cli':
  ensure => 'present'
}
