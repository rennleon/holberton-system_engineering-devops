# This manifest fixes a fd limit per user in a nginx server

exec { 'Increase the number of field descriptors open allowed for users':
    command => '/bin/echo "ULIMIT=\"-n 500\"" > /etc/default/nginx'
}
-> exec { 'Restart nginx server':
    command => 'sudo service nginx restart',
    path    => ['/usr/bin/', '/usr/sbin']
}
