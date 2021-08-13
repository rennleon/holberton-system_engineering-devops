# This manifest installs 'puppet-lint' packege using 'gem' as provider

package { 'puppet-lint':
  ensure   => '2.1.1',
  provider => gem
}
