# This manifests installs and configures nginx

package { 'nginx':
  ensure => 'installed',
}

file_line { 'Add headers':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => '.*listen \[.*;',
  line   => '	add_header X-Served-By $hostname;'
}

service {'nginx':
  ensure  => 'running',
  require => Package['nginx']
}
