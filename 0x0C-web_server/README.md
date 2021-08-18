# 0x0C. Web server

**Usefull links**
- [How the web works](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/How_the_Web_works)
- [How to Configure Nginx](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)
- [Root and sub domain](https://landingi.com/help/domains-vs-subdomains/)
- [HTTP requests](https://www.tutorialspoint.com/http/http_methods.htm)
- [HTTP redirection](https://moz.com/learn/seo/redirection)
- [Logs files on Linux](https://www.cyberciti.biz/faq/ubuntu-linux-gnome-system-log-viewer/)


## Tasks
## 0. Transfer a file to your server
Write a Bash script that transfers a file from our client to a server:

**Requirements:**

- Accepts 4 parameters
- The `path` to the file to be transferred
- The `IP` of the server we want to transfer the file to
- The `username` scp connects with
- The `path` to the `SSH private key` that scp uses
- Display `Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY` if less than 3 parameters passed
- `scp` must transfer the file to the user home directory `~/`
- `Strict host key` checking must be `disabled` when using `scp`

`File:` [0-transfer_file](0-transfer_file)


## 1. Install nginx web server
Web servers are the piece of software generating and serving HTML pages, let’s install one!

**Requirements:**

- Install `nginx`
- `Nginx` should be `listening` on `port 80`
- When querying Nginx at its root `/` with a `GET` request (requesting a page) using `curl`, it must return a page that contains the string `Holberton School`
- Write a Bash script that configures a new Ubuntu machine to respect above requirements
- You `can’t` use `systemctl` for `restarting` `nginx`

`File:` [1-install_nginx_web_server](1-install_nginx_web_server)


## 2. Setup a domain name
Get a domain at `.TECH Domains`

**Requirement:**

- Provide the domain name only `(example: foobar.tech)`, no subdomain `(example: www.foobar.tech)`
- Configure your `DNS` records with an `A entry` so that your root domain points to your server `IP` address

```shell
$ cat 2-setup_a_domain_name
holbertonschool.tech
$
$ dig holbertonschool.tech

; <<>> DiG 9.10.6 <<>> holbertonschool.tech
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 26785
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;holbertonschool.tech.      IN  A

;; ANSWER SECTION:
holbertonschool.tech.   7199    IN  A   184.72.193.201

;; Query time: 65 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Fri Aug 02 09:44:36 PDT 2019
;; MSG SIZE  rcvd: 65

$
```
Verify the Registrar here: ![https://whois.whoisxmlapi.com/] and you must see in the JSON response: `"registrarName": "Dotserve Inc"`

`File:` [2-setup_a_domain_name](2-setup_a_domain_name)


## 3. Redirection
Configure your Nginx server so that `/redirect_me` is redirecting to another page.

**Requirements:**

- The `redirection` must be a `“301 Moved Permanently”`
- You answer file should be a Bash script containing commands to automatically configure a Ubuntu machine to respect above requirements
- Write `3-redirection` so that it configures a brand new Ubuntu machine to the requirements asked in this task

```shell
$ curl -sI 34.198.248.145/redirect_me/
HTTP/1.1 301 Moved Permanently
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 21 Feb 2017 21:36:04 GMT
Content-Type: text/html
Content-Length: 193
Connection: keep-alive
Location: https://www.youtube.com/watch?v=QH2-TGUlwu4

$
```

`File:` [3-redirection](3-redirection)

## 4. Not found page 404
Configure your Nginx server to have a custom 404 page that contains the string `Ceci n'est pas une page`.

**Requirements:**

- The page must return an HTTP `404` error code
- The page must contain the string `Ceci n'est pas une page`
- Write `4-not_found_page_404` so that it configures a brand new Ubuntu machine to the requirements asked in this task

```shell
$ curl -sI 34.198.248.145/xyz
HTTP/1.1 404 Not Found
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 21 Feb 2017 21:46:43 GMT
Content-Type: text/html
Content-Length: 26
Connection: keep-alive
ETag: "58acb50e-1a"

$ curl 34.198.248.145/xyzfoo
Ceci n'est pas une page

$
```

`File:` [4-not_found_page_404](4-not_found_page_404)

## 5. Design a beautiful 404 page
Make sure that it still contains the string `Ceci n'est pas une page`.

`File:` [5-design_a_beautiful_404_page.html](5-design_a_beautiful_404_page.html)


## 6. Install Nginx web server (w/ Puppet)
Install and configure an Nginx server using Puppet instead of Bash, you should also include resources in your manifest to perform a `301` `redirect` when querying `/redirect_me`.

**Requirements:**

- Nginx should be `listening` on `port 80`
- When querying Nginx at its root `/` with a `GET` request (requesting a page) using curl, it must return a page that contains the string `Holberton School`
- The redirection must be a `“301 Moved Permanently”`

`File:` [7-puppet_install_nginx_web_server.pp](7-puppet_install_nginx_web_server.pp)
