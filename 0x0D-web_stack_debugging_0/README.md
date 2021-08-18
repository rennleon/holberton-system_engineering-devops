# 0x0D. Web stack debugging #0

**Useful links**
- [Install docker Mac OS](https://docs.docker.com/desktop/mac/install/)
- [Install docker Windows](https://docs.docker.com/desktop/windows/install/)
- [Install docker Ubuntu 14.04](https://www.liquidweb.com/kb/how-to-install-docker-on-ubuntu-14-04-lts/)
- [Install docker Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)


## Tasks
## 0. Give me a page!
You will need to get `Apache` to run on the container and to return a page containing `Hello Holberton` when `querying` the `root` of it.

**Example**
Here we can see that after starting Docker container, The port `8080` mapped to the Docker container port `80`, does not return a page but an error message.

```shell
vagrant@vagrant:~$ docker run -p 8080:80 -d -it holbertonschool/265-0
47ca3994a4910bbc29d1d8925b1c70e1bdd799f5442040365a7cb9a0db218021
vagrant@vagrant:~$ docker ps
CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS                  NAMES
47ca3994a491        holbertonschool/265-0   "/bin/bash"         3 seconds ago       Up 2 seconds        0.0.0.0:8080->80/tcp   vigilant_tesla
vagrant@vagrant:~$ curl 0:8080
curl: (52) Empty reply from server
vagrant@vagrant:~$
```

After connecting to the container and fixing whatever needed to be fixed, you can see that curling port 80 return a page that contains `Hello Holberton`. Paste the command(s) you used to fix the issue in your answer file.

```shell
vagrant@vagrant:~$ curl 0:8080
Hello Holberton
vagrant@vagrant:~$
```

`File:` [0-give_me_a_page](0-give_me_a_page)
