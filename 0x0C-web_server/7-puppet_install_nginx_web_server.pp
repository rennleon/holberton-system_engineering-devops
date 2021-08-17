# This manifest configures an nginx server

$defaultconfig = "
# Default server configuration
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /var/www/html;
	index index.html index.htm index.nginx-debian.html;

	server_name _;
	
	location =/redirect_me {
		return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
	}
}
"

exec { 'Update packages':
  command => 'apt update',
  path    => ['/usr/bin/', '/bin']
}

package { 'Install nginx':
  ensure  => 'installed',
  require => Exec['Update packages'],
  name    => 'nginx'
}

file { ['/var', '/var/www', '/var/www/html']:
  ensure => 'directory'
}

file { 'Create default index.html':
  ensure  => 'present',
  name    => 'index.html',
  path    => '/var/www/html/index.html',
  content => 'Holberton School is cool!'
}

file { ['/etc', '/etc/nginx', '/etc/nginx/sites-available']:
  ensure => 'directory'
}

file { 'Create nginx configuration file':
  ensure  => 'present',
  name    => 'default',
  path    => '/etc/nginx/sites-available/default',
  content => $defaultconfig
}

exec { 'Restart nginx server':
  command => 'service nginx restart',
  path    => ['/usr/sbin']
}

service { 'Make sure nginx is up and running':
  ensure => 'running',
  name   => 'nginx'
}
