# This manifest configures an nginx server

package { 'nginx':
  ensure  => 'installed',
}

file_line { 'Add header':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen \[::\]:80 default_server;',
  line    => "\n\tadd_header X-Served-By \$hostname;",
  require => Package['nginx']
}

service { 'nginx':
  ensure  => 'running',
  require => Package['nginx']
}
