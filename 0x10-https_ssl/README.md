# 0x10. HTTPS SSL

**Usefull links**
- [What is HTTPS?](https://www.instantssl.com/http-vs-https)
- [What are the 2 main elements that SSL is providing](https://www.sslshopper.com/why-ssl-the-purpose-of-using-ssl-certificates.html)
- [HAProxy SSL termination on Ubuntu16.04](https://devops.ionos.com/tutorials/install-and-configure-haproxy-load-balancer-on-ubuntu-1604/)
- [SSL termination](https://en.wikipedia.org/wiki/TLS_termination_proxy)
- [Bash function](https://tldp.org/LDP/abs/html/complexfunct.html)
- [Install Letś Encrypt SSL with Certbot](https://www.inmotionhosting.com/support/website/ssl/lets-encrypt-ssl-ubuntu-with-certbot/)
- [LetsEncrypt with HAProxy](https://serversforhackers.com/c/letsencrypt-with-haproxy)

**Install certbot**
```
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y certbot
```

**Certificate creation**
```
sudo certbot certonly --standalone -d dom1
```

**SSL Certificate and HAProxy**
```
sudo mkdir -p /etc/ssl/mydom.com

sudo cat /etc/letsencrypt/live/mydom.com/fullchain.pem \
    /etc/letsencrypt/live/mydom.com/privkey.pem \
    | sudo tee /etc/ssl/mydom.com/mydom.com.pem
```

## Tasks
## 0. World wide web
Configure your domain zone so that the subdomain `www` points to your load-balancer IP (`lb-01`). Let’s also add other subdomains to make our life easier, and write a Bash script that will display information about subdomains.

- Add the subdomain `www` to your domain, point it to your `lb-01 IP`
- Add the subdomain `lb-01` to your domain, point it to your `lb-01` IP
- Add the subdomain `web-01` to your domain, point it to your `web-01` IP
- Add the subdomain `web-02` to your domain, point it to your `web-02` IP
- Your Bash script must accept 2 arguments: `domain` and `subdomain`

**Output:** `The subdomain [SUB_DOMAIN] is a [RECORD_TYPE] record and points to [DESTINATION]`
- When only the parameter `domain` is provided, display information for its subdomains `www`, `lb-01`, `web-01` and `web-02` - in this specific order
- When passing `domain` and `subdomain` parameters, display information for the specified `subdomain`
- Must use `awk`
- At least one Bash function

```shell
$ dig www.holberton.online | grep -A1 'ANSWER SECTION:'
;; ANSWER SECTION:
www.holberton.online.   87  IN  A   54.210.47.110
$ dig lb-01.holberton.online | grep -A1 'ANSWER SECTION:'
;; ANSWER SECTION:
lb-01.holberton.online. 101 IN  A   54.210.47.110
$ dig web-01.holberton.online | grep -A1 'ANSWER SECTION:'
;; ANSWER SECTION:
web-01.holberton.online. 212    IN  A   34.198.248.145
$ dig web-02.holberton.online | grep -A1 'ANSWER SECTION:'
;; ANSWER SECTION:
web-02.holberton.online. 298    IN  A   54.89.38.100
$
$
$ ./0-world_wide_web holberton.online
The subdomain www is a A record and points to 54.210.47.110
The subdomain lb-01 is a A record and points to 54.210.47.110
The subdomain web-01 is a A record and points to 34.198.248.145
The subdomain web-02 is a A record and points to 54.89.38.100
$
$ ./0-world_wide_web holberton.online web-02
The subdomain web-02 is a A record and points to 54.89.38.100
$
```

`File:` [0-world_wide_web](0-world_wide_web)


## 1. HAproxy SSL termination
“Terminating SSL on HAproxy” means that `HAproxy` is configured to handle `encrypted` traffic, `unencrypt` it and pass it on to its `destination`.

- Create a certificate using `certbot` and configure HAproxy to accept encrypted traffic for your subdomain `www`..

- HAproxy must be listening on port TCP `443`
- HAproxy must be accepting `SSL` traffic
- HAproxy must serve encrypted traffic that will return the `/` of your web server
- When querying the root of your domain name, the page returned must contain `Holberton School`
- Share your `HAproxy` config as an answer file (`/etc/haproxy/haproxy.cfg`)
- The file `1-haproxy_ssl_termination` must be your `HAproxy` configuration file

>Make sure to install HAproxy 1.5 or higher, SSL termination is not available before v1.5.

```shell
$ curl -sI https://www.holberton.online
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 28 Feb 2017 01:52:04 GMT
Content-Type: text/html
Content-Length: 30
Last-Modified: Tue, 21 Feb 2017 07:21:32 GMT
ETag: "58abea7c-1e"
X-Served-By: 03-web-01
Accept-Ranges: bytes
$
$ curl https://www.holberton.online
Holberton School for the win!
$
```

`File:` [1-haproxy_ssl_termination](1-haproxy_ssl_termination)


## 2. No loophole in your website traffic
A good habit is to enforce `HTTPS` traffic so that no unencrypted traffic is possible. Configure `HAproxy` to automatically redirect HTTP traffic to `HTTPS`.

- This should be transparent to the user
- HAproxy should return a `301`
- HAproxy should redirect `HTTP` traffic to `HTTPS`
- Share your `HAproxy config` as an answer file (`/etc/haproxy/haproxy.cfg`)
- The file `100-redirect_http_to_https` must be your `HAproxy` configuration file

```
$ curl -sIL http://www.holberton.online
HTTP/1.1 301 Moved Permanently
Content-length: 0
Location: https://www.holberton.online/
Connection: close

HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 28 Feb 2017 02:19:18 GMT
Content-Type: text/html
Content-Length: 30
Last-Modified: Tue, 21 Feb 2017 07:21:32 GMT
ETag: "58abea7c-1e"
X-Served-By: 03-web-01
Accept-Ranges: bytes

$
```

`File:` [100-redirect_http_to_https](100-redirect_http_to_https)
