file {'Configuration File':
  ensure => 'present',
  name   => 'sshconfig',
  path   => '/tmp/sshconfig'
}

file_line { 'Turn off passwd auth':
  ensure => 'present',
  path   => '/tmp/sshconfig',
  line   => '  PasswordAuthentication no'
}

file_line { 'Declare identity file':
  ensure => 'present',
  path   => '/tmp/sshconfig',
  line   => '  IdentityFile ~/.ssh/holberton'
}

