# 0x13. Firewall

**Useful links**

- [Firewall](https://en.wikipedia.org/wiki/Firewall_%28computing%29)
- [How to setup Firewall rules (ufw)](https://www.youtube.com/watch?v=4KttswFPaiw&t=2s)
- [How to manage and forward ports with UFW](https://www.arubacloud.com/tutorial/how-to-manage-and-forward-ports-with-ufw-on-ubuntu-18-04.aspx)

## Tasks
## 0. Block all incoming traffic but
Install the `ufw` firewall and setup a few rules.

- Configure `ufw` so that it blocks all incoming traffic, except the following `TCP` ports:
 - 22 (SSH)
 - 443 (HTTPS SSL)
 - 80 (HTTP)

Share the ufw commands that you used in your answer file

`File:` [0-block_all_incoming_traffic_but](0-block_all_incoming_traffic_but)


## 1. Port forwarding
Configure a server so that its firewall redirects port `8080/TCP` to port `80/TCP`.
- Your answer file should be a copy of the `ufw` configuration file that you modified to make this happen

`File:` [100-port_forwarding](100-port_forwarding)
