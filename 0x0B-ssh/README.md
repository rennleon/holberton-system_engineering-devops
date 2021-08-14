# 0x0B. SSH

**Useful links**
- [SSH essentials](https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys)
- [SSH Config File](https://www.ssh.com/academy/ssh/config)
- [Public Key Authentication for SSH](https://www.ssh.com/academy/ssh/public-key-authentication)
- [Understanding the SSH Encryption and Connection Process](https://www.digitalocean.com/community/tutorials/understanding-the-ssh-encryption-and-connection-process)

## Tasks
## 0. Use a private key
Write a Bash script that uses ssh to connect to your server using the private key ~/.ssh/holberton with the user ubuntu.

```shell
$ ./0-use_a_private_key
Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.4.0-45-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

0 packages can be updated.
0 updates are security updates.


*** System restart required ***
Last login: Fri Feb  3 01:12:16 2017 from 104.7.14.91
ubuntu@server01:~$ logout
Connection to 8.8.8.8 closed.
$
```

`File:` [0-use_a_private_key](0-use_a_private_key)


## 1. Create an SSH key pair
Write a Bash script that creates an `RSA` key pair.

**Requirements:**

- Name of the created private key must be `holberton`
- Number of bits in the created key to be created `4096`
- The created key must be protected by the passphrase `betty`

```shell
$ ls
1-create_ssh_key_pair
$ ./1-create_ssh_key_pair
Generating public/private rsa key pair.
Your identification has been saved in holberton.
Your public key has been saved in holberton.pub.

...

$ ls
1-create_ssh_key_pair holberton  holberton.pub
$
```

`File:` [1-create_ssh_key_pair](1-create_ssh_key_pair)

## 2. Client configuration file
Your Ubuntu Vagrant machine has an SSH configuration file for the local `SSH client`, let’s configure it to our needs so that you can connect to a server without typing a password. Share your `SSH client` configuration in your answer file.

**Requirements:**

- Your SSH client configuration must be configured to use the private key `~/.ssh/holberton`
- Your SSH client configuration must be configured to `refuse` to `authenticate` using a `password`

```shell
$ ssh -v ubuntu@98.98.98.98
OpenSSH_6.6.1, OpenSSL 1.0.1f 6 Jan 2014
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 19: Applying options for *
debug1: Connecting to 98.98.98.98 [98.98.98.98] port 22.
debug1: Connection established.
debug1: identity file /home/sylvain/.ssh/holberton type -1
debug1: identity file /home/sylvain/.ssh/holberton-cert type -1
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_6.6.1p1 Ubuntu-2ubuntu2.7

...

Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.4.0-45-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

112 packages can be updated.
0 updates are security updates.


*** System restart required ***
Last login: Mon Feb 20 18:26:38 2017 from 104.7.14.91
ubuntu@magic-server:~$
In the example above, we can see that ssh tries to authenticate using holberton and does not try to authenticate using a password. You can replace 98.98.98.98 by the IP of your server for testing purposes.
```

`File:` [2-ssh_config](2-ssh_config)


## 3. Let me in!
Add the SSH public key below to your server so that we can connect using the ubuntu user.
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId/Kawz35ESampIqHSOTJmbQ8UlxdJuk0gAXKk3Ncle4safGYqM/VeDK3LN5iAJxf4kcaxNtS3eVxWBE5iF3FbIjOqwxw5Lf5sRa5yXxA8HfWidhbIG5TqKL922hPgsCGABIrXRlfZYeC0FEuPWdr6smOElSVvIXthRWp9cr685KdCI+COxlj1RdVsvIo+zunmLACF9PYdjB2s96Fn0ocD3c5SGLvDOFCyvDojSAOyE70ebIElnskKsDTGwfT4P6jh9OBzTyQEIS2jOaE5RQq4IB4DsMhvbjDSQrP0MdCLgwkN
```


## 4. Client configuration file (w/ Puppet)
Write a `puppet` manifest to set up your client `SSH configuration file` so that you can `connect` to a server `without` typing a `password`.

**Requirements:**

- Your SSH client configuration must be configured to use the private key `~/.ssh/holberton`
- Your SSH client configuration must be configured to `refuse` to `authenticate` using a `password`

```shell
vagrant@ubuntu-xenial:~$ sudo puppet apply 100-puppet_ssh_config.pp
Notice: Compiled catalog for ubuntu-xenial in environment production in 0.11 seconds
Notice: /Stage[main]/Main/File_line[Turn off passwd auth]/ensure: created
Notice: /Stage[main]/Main/File_line[Declare identity file]/ensure: created
Notice: Finished catalog run in 0.03 seconds
vagrant@ubuntu-xenial:~$
```

`File:` [100-puppet_ssh_config.pp](100-puppet_ssh_config.pp)
