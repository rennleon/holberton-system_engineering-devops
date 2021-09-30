# This manifest fixes a bug on a web server

exec { 'Fix php reference extension':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/bin'
}
