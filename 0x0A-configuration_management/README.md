# 0x0A. Configuration management

**Install `puppet-lint`**
```shell
$ apt-get install -y ruby
$ gem install puppet-lint -v 2.1.1
```

**Usefull links**
- [Intro to Configuration Management](https://intranet.hbtn.io/rltoken/r-NmkYO8bxIKp2qEx2ZjKQ)
- [Puppet resource types](https://puppet.com/docs/puppet/3.8/types/index.html)
- [Puppet resource type: file](https://intranet.hbtn.io/rltoken/fuhnsI9_1_F4GrHwGT3GxA)
- [Puppet resource type: package](https://puppet.com/docs/puppet/7/types/package.html)
- [Puppet resource type: exec](https://puppet.com/docs/puppet/7/types/exec.html)
- [Puppet’s Declarative Language: Modeling Instead of Scripting](https://intranet.hbtn.io/rltoken/Fqmb5rnChQgYAypvKoTxAQ)
- [Puppet lint](https://intranet.hbtn.io/rltoken/oezu0m_hJ8nEVA6a9o17Tw)
- [Puppet emacs mode](https://intranet.hbtn.io/rltoken/N70cVw8mG3707He-OxjP1w)


## Tasks
## 0. Create a file
Using Puppet, create a file in `/tmp`.

- File path is `/tmp/holberton`
- File permission is `0744`
- File owner is `www-data`
- File group is `www-data`
- File contains `I love Puppet`

```shell
$ puppet-lint --version
puppet-lint 2.1.1
$ puppet-lint 0-create_a_file.pp
$
$ puppet apply 0-create_a_file.pp
Notice: Compiled catalog for 6712bef7a528.ec2.internal in environment production in 0.04 seconds
Notice: /Stage[main]/Main/File[holberton]/ensure: defined content as '{md5}f1b70c2a42a98d82224986a612400db9'
Notice: Finished catalog run in 0.03 seconds
$
$ ls -l /tmp/holberton
-rwxr--r-- 1 www-data www-data 13 Mar 19 23:12 /tmp/holberton
$ cat /tmp/holberton
I love Puppet$
```

`File:` [0-create_a_file.pp](0-create_a_file.pp)


## 1. Install a package
Using Puppet, install `puppet-lint`.
- Install `puppet-lint`
- Version must be `2.1.1`

```shell
$ puppet apply 1-install_a_package.pp
Notice: Compiled catalog for d391259bf577.hsd1.ca.comcast.net in environment production in 0.10 seconds
Notice: /Stage[main]/Main/Package[puppet-lint]/ensure: created
Notice: Finished catalog run in 2.83 seconds
$ gem list

*** LOCAL GEMS ***

puppet-lint (2.1.1)
$
```

`File:` [1-install_a_package.pp](1-install_a_package.pp)


## 2. Execute a command
Using Puppet, create a `manifest` that kills a process named `killmenow`.

- Must use the exec `Puppet resource`
- Must use `pkill`

```shell
Terminal #0 - starting my process

$ cat killmenow
#!/bin/bash
while [[ true ]]
do
    sleep 2
done

$ ./killmenow
```
```shell
Terminal #1 - executing my manifest

$ puppet apply 2-execute_a_command.pp
Notice: Compiled catalog for d391259bf577.hsd1.ca.comcast.net in environment production in 0.01 seconds
Notice: /Stage[main]/Main/Exec[killmenow]/returns: executed successfully
Notice: Finished catalog run in 0.10 seconds
$
```
```shell
Terminal #0 - process has been terminated

$ ./killmenow
Terminated
$
```

`File:` [2-execute_a_command.pp](2-execute_a_command.pp)
