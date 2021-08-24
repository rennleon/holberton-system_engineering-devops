# This manifest configures an nginx server

exec { 'update packages':
  command => '/usr/bin/apt update'
}

-> package { 'nginx':
  ensure  => 'installed',
}

-> file_line { 'Add header':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen \[::\]:80 default_server;',
  line   => "\n\tadd_header X-Served-By \$hostname;"
}

-> service { 'nginx':
  ensure  => 'running',
}
