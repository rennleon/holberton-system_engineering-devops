# This manifest fixes a fd issue for user holberton in a server

exec { 'Increase the number of fd\'s allowed for holberton':
    command => '/bin/echo -e "holberton hard nofile 65535\nholberton soft nofile 1024" > /etc/security/limits.conf'
}
