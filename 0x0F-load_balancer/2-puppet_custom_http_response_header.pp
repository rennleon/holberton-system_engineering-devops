$nginx_config = "# Default server configuration
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	add_header X-Served-By ${hostname};

	root /var/www/html;
	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		try_files ${uri} ${uri}/ =404;
	}
}
"

package { 'nginx':
  ensure => 'installed',
}

file { 'Create index.html':
  ensure  => 'present',
  name    => 'index.html',
  path    => '/var/www/html/index.html',
  content => 'Holberton School for the win!'
}

file { 'Create nginx config file':
  ensure  => 'present',
  name    => 'default',
  path    => '/etc/nginx/sites-available/default',
  content => $nginx_config
}

service { 'nginx':
  ensure  => 'running',
  require => Package['nginx']
}
