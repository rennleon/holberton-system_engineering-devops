# This manifests adds 2 lines to ssh_config file to configure a private key and deny password auth 

file {'Configuration File':
  ensure => 'present',
  name   => 'ssh_config',
  path   => '/etc/ssh/ssh_config'
}

file_line { 'Turn off passwd auth':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config'
  line   => '  PasswordAuthentication no'
}

file_line { 'Declare identity file':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config'
  line   => '  IdentityFile ~/.ssh/holberton'
}

