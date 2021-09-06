# 0x12. Web stack debugging #2

**Useful links**

- [Running Script or Command as Another User in Linux](https://www.baeldung.com/linux/run-as-another-user)

## Tasks
## 0. Run software as another user
write a Bash script that runs the `whoami` command under the user passed as an argument

```shell
$ whoami
root
$ ./0-iamsomeoneelse www-data
www-data
$ whoami
root
$
```

`File:` [0-iamsomeoneelse](0-iamsomeoneelse)


## 1. Run Nginx as Nginx
Write a Bash script that fixes a container so that Nginx is running as the nginx user.

- `nginx` must be running as nginx user
- `nginx` must be listening on all active IPs on port `8080`
- cannot use `apt-get remove`

*After debugging:*

```shell
$ ps auxff | grep ngin[x]
nginx      884  0.0  0.0  77360  2744 ?        Ss   19:16   0:00 nginx: master process /usr/sbin/nginx
nginx      885  0.0  0.0  77712  2772 ?        S    19:16   0:00  \_ nginx: worker process
nginx      886  0.0  0.0  77712  3180 ?        S    19:16   0:00  \_ nginx: worker process
nginx      887  0.0  0.0  77712  3180 ?        S    19:16   0:00  \_ nginx: worker process
nginx      888  0.0  0.0  77712  3208 ?        S    19:16   0:00  \_ nginx: worker process
$
$ nc -z 0 8080 ; echo $?
0
$
```

`File:` [1-run_nginx_as_nginx](1-run_nginx_as_nginx)


## 2. 7 lines or less
Using what you did for `task #1`, make your fix short and sweet.

`File:` [100-fix_in_7_lines_or_less](100-fix_in_7_lines_or_less)
