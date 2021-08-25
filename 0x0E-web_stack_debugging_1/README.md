# 0x0E. Web stack debugging #1

**Usefull links**
- [What is a protocol](https://searchnetworking.techtarget.com/definition/protocol)
- [What is an IP address](https://computer.howstuffworks.com/internet/basics/what-is-an-ip-address.htm)
- [What is TCP/IP](https://searchnetworking.techtarget.com/definition/TCP-IP)
- [What is an Internet Protocol (IP) port?](https://www.lifewire.com/port-numbers-on-computer-networks-817939)
- [How to change Nginx default port](https://www.java2novice.com/nginx/change-nginx-port/)
- [Youtube video First 5 Commands When I Connect on a Linux Server](https://www.youtube.com/watch?v=1_gqlbADaAw)


## Tasks
## 0. Nginx likes port 80
Using your debugging skills, find out what’s keeping your Ubuntu container’s Nginx installation from `listening` on port `80`.
- Write a Bash script with the minimum number of commands to automate your fix.
- Nginx must be running, and listening on port 80 of all the server’s active IPv4 IPs

```
# curl 0:80
curl: (7) Failed to connect to 0 port 80: Connection refused
#
# ./0-nginx_likes_port_80 > /dev/null 2&>1
#
# curl 0:80
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
#
```

`File:` [0-nginx_likes_port_80](0-nginx_likes_port_80)


## 1. Make it sweet and short
Using what you did for task #0, make your fix short and sweet.
- Your Bash script must be 5 lines long or less
- You cannot execute your previous answer file (Do not include the name of the previous script in this one)
- `service (init)` must say that nginx is not running ← for real

```
# curl 0:80
curl: (7) Failed to connect to 0 port 80: Connection refused
#
# cat -e 1-debugging_made_short | wc -l
5
# ./1-debugging_made_short
# curl 0:80
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
#
# service nginx status
 * nginx is not running
#
```

`File:` [1-debugging_made_short](1-debugging_made_short)
