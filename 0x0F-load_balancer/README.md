# 0x0F. Load balancer

**Useful links**
- [Introduction to load-balancing and HAproxy](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts)
- [HTTP header](https://www.techopedia.com/definition/27178/http-header)
- [Debian/Ubuntu HAProxy packages](https://haproxy.debian.net/)
- [The Four Essential Sections of an HAProxy Configuration](https://www.haproxy.com/blog/the-four-essential-sections-of-an-haproxy-configuration/)

## Tasks
## 0. Double the number of webservers
Configure `Nginx` so that its HTTP response contains a `custom header` (`on web-01 and web-02`)
- The name of the custom HTTP header must be `X-Served-By`
- The `value` of the custom `HTTP header` must be the `hostname` of the server Nginx is running on
- Write `0-custom_http_response_header` so that it configures a brand new Ubuntu machine to the requirements asked in this task

```shell
$ curl -sI 34.198.248.145 | grep X-Served-By
X-Served-By: 03-web-01
$ curl -sI 54.89.38.100 | grep X-Served-By
X-Served-By: 03-web-02
$
If your server’s hostnames are not properly configured ([STUDENT_ID]-web-01 and [STUDENT_ID]-web-02.), follow this tutorial.
```

`File:` [0-custom_http_response_header](0-custom_http_response_header)


## 1. Install your load balancer
Install and configure `HAproxy` on your `lb-01 server`.

**Requirements:**

- Configure `HAproxy` with version equal or greater than `1.5` so that it send traffic to `web-01` and `web-02`
- Distribute requests using a `roundrobin` algorithm
- Make sure that `HAproxy` can be managed via an init script
- Write a Bash script that configures a new Ubuntu machine to respect above requirements

```shell
$ curl -Is 54.210.47.110
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Mon, 27 Feb 2017 06:12:17 GMT
Content-Type: text/html
Content-Length: 30
Last-Modified: Tue, 21 Feb 2017 07:21:32 GMT
Connection: keep-alive
ETag: "58abea7c-1e"
X-Served-By: 03-web-01
Accept-Ranges: bytes

$ curl -Is 54.210.47.110
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Mon, 27 Feb 2017 06:12:19 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Tue, 04 Mar 2014 11:46:45 GMT
Connection: keep-alive
ETag: "5315bd25-264"
X-Served-By: 03-web-02
Accept-Ranges: bytes

$
```

`File:` [1-install_load_balancer](1-install_load_balancer)


## 2. Add a custom HTTP header with Puppet
Just as in task #0, we’d like you to automate the task of creating a custom HTTP header response, but with Puppet.

- The `name` of the custom `HTTP header` must be `X-Served-By`
- The `value` of the custom `HTTP header` must be the `hostname` of the server Nginx is running on
- Write `2-puppet_custom_http_response_header.pp` so that it configures a brand new Ubuntu machine to the requirements asked in this task

`File:` [2-puppet_custom_http_response_header.pp](2-puppet_custom_http_response_header.pp)
