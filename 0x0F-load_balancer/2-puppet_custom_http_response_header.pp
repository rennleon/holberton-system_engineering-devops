# This manifest configures an nginx server

$config = "# Default server configuration
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	add_header X-Served-By \$hostname;

	root /var/www/html;
	index index.html index.htm;

	location /redirect_me {
		return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
	}

	error_page 404 /404.html;
	location =/404.html {
		root /var/www/html;
		internal;
	}
}
"

exec { 'update packages':
  command => '/usr/bin/apt update'
}

-> package { 'nginx':
  ensure  => 'installed',
}

-> file { 'Create config file':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  content => $config
}

-> service { 'nginx':
  ensure  => 'running',
}
