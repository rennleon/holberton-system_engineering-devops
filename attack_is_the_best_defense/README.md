# Attack is the best defense

**Useful links**

- [Network sniffing](https://www.lifewire.com/definition-of-sniffer-817996)
- [ARP spoofing](https://www.veracode.com/security/arp-spoofing)
- [Connect to SendGrid’s SMTP relay using telnet](https://docs.sendgrid.com/ui/account-and-settings/troubleshooting-delays-and-latency)
- [What is Docker and why is it popular?](https://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/)
- [Dictionary attack](https://en.wikipedia.org/wiki/Dictionary_attack)
- [tcpdump examples](https://hackertarget.com/tcpdump-examples/)
- [Introduction to tcpdump(video)](https://www.youtube.com/watch?v=hWc-ddF5g1I)


## Tasks
## 0. ARP spoofing and sniffing unencrypted traffic
Sendgrid offers is an emailing service that provides state of the art secure system to send emails, but also supports a legacy unsecured way: telnet. You can create an account for free, which is what I did, and send an email using telnet:

```shell
$ telnet smtp.sendgrid.net 587
Trying 167.89.121.145...
Connected to smtp.sendgrid.net.
Escape character is '^]'.
220 SG ESMTP service ready at ismtpd0013p1las1.sendgrid.net
EHLO ismtpd0013p1las1.sendgrid.net
250-smtp.sendgrid.net
250-8BITMIME
250-PIPELINING
250-SIZE 31457280
250-STARTTLS
250-AUTH PLAIN LOGIN
250 AUTH=PLAIN LOGIN
auth login
334 VXNlcm5hbWU6
VGhpcyBpcyBteSBsb2dpbg==
334 UGFzc3dvcmQ6
WW91IHJlYWxseSB0aG91Z2h0IEkgd291bGQgbGV0IG15IHBhc3N3b3JkIGhlcmU/ISA6RA==
235 Authentication successful
mail from: sylvain@kalache.fr
250 Sender address accepted
rcpt to: julien@holbertonschool.com
250 Recipient address accepted
data
354 Continue
To: Julien
From: Sylvain
Subject: Hello from the insecure world

I am sending you this email from a Terminal.
.
250 Ok: queued as Aq1zhMM3QYeEprixUiFYNg
quit
221 See you later
Connection closed by foreign host.
$
```

Your mission is to execute [user_authenticating_into_server](user_authenticating_into_server) locally on your machine and, using `tcpdump`, `sniff` the network to find the password. Once you find it, paste the password in your answer file.

`File:` [0-sniffing](0-sniffing)


## 1. Dictionary attack
`Password-based` authentication systems can be easily broken by using a dictionary attack. Let’s try it on an `SSH account`.

Install Docker on your machine Ubuntu Vagrant machine
Pull and run the Docker image `sylvainkalache/264-1` with the command `docker run -p 2222:22 -d -ti sylvainkalache/264-1`

Install and use `hydra` to try to brute force the account `sylvain` via `SSH` on the Docker container

Because the Docker container is running locally, `hydra` should access the `SSH` account via IP `127.0.0.1` and port `2222`

*Hint:* the password is 11 characters long

Once you found the password, share it in your answer file.

`File:` [1-dictionary_attack](1-dictionary_attack)
