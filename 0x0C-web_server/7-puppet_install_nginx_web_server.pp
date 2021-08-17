# This manifest configures an nginx server

$defaultconfig = "# Default server configuration
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /var/www/html;
	index index.html index.htm;

	location =/redirect_me {
		return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
	}

	error_page 404 /404.html;
	location =/404.html {
		root /var/www/html;
		internal;
	}
}
"

package { 'nginx':
  ensure  => 'installed',
}

file { 'Create default index.html':
  ensure  => 'present',
  name    => 'index.html',
  path    => '/var/www/html/index.html',
  content => 'Holberton School is cool!'
}

file { 'Create default 404.html':
  ensure  => 'present',
  name    => '404.html',
  path    => '/var/www/html/404.html',
  content => 'Ceci n\'est pas une page'
}

file { 'Create nginx configuration file':
  ensure  => 'present',
  name    => 'default',
  path    => '/etc/nginx/sites-available/default',
  content => $defaultconfig
}

service { 'nginx':
  ensure  => 'running',
  require => Package['nginx']
}
