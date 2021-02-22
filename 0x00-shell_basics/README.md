**This project contains files with shell basic scripts**

### [0. Where am I?](./0-current_working_directory)
Write a script that prints the absolute path name of the current working directory.
```
$ ./0-current_working_directory
/Users/holbertonschool/holbertonschool-sysadmin_devops/0x00-shell_basics
$
```

### [1. Whats in there?](./1-listit)
Display the contents list of your current directory.
```
$ ./1-listit
Applications    Documents   Dropbox Movies Pictures
Desktop Downloads   Library Music Public
$
```

### [2. There is no place like home](./2-bring_me_home)
Write a script that changes the working directory to the users home directory.
- You are not allowed to use any shell variables
```
julien@ubuntu:/tmp$ pwd
/tmp
julien@ubuntu:/tmp$ echo $HOME
/home/julien
julien@ubuntu:/tmp$ source ./2-bring_me_home
julien@ubuntu:~$ pwd
/home/julien
julien@ubuntu:~$ 
```
