include homebrew

homebrew::tap { 'homebrew/science': }

package { 'r':
  ensure => 'present'
}
