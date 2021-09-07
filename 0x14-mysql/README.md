# 0x14. MySQL

Inthis project I learned how to configure `mysql` for master-slave replication.

**Useful links**

- [What is a primary-replica cluster](https://www.digitalocean.com/community/tutorials/how-to-choose-a-redundancy-plan-to-ensure-high-availability#sql-replication)
- [MySQL primary replica setup](https://www.digitalocean.com/community/tutorials/how-to-set-up-replication-in-mysql)
- [Build a robust database backup strategy](https://www.databasejournal.com/features/mssql/developing-a-sql-server-backup-strategy.html)
- [How to Configure MySQL Master-Slave Replication on Ubuntu Linux](https://www.youtube.com/watch?v=JXDuVypcHNA)


## Tasks
## 0. Install MySQL
Install `mysql` on both master and slave servers.

```shell
$ echo 'deb http://repo.mysql.com/apt/ubuntu/ trusty mysql-5.7-dmr' | sudo tee -a /etc/apt/sources.list
$ sudo apt-get update
$ sudo apt-get install mysql-server-5.7
...
$ mysql --version
mysql  Ver 14.14 Distrib 5.7.8-rc, for Linux (x86_64) using  EditLine wrapper
$
```


## 1. Let us in!
Create a `MySQL` user on both servers with the `host name` set to `localhost`
- Make sure that the user you create has permission to check the `primary/replica status` of your databases.

```sql
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'password';
GRANT REPLICATION CLIENT ON *.* TO 'user'@'localhost';
```

```shell
$ mysql -u user -p -e "SHOW GRANTS FOR 'user'@'localhost'"
Enter password:
+-----------------------------------------------------------------+
| Grants for user@localhost                             |
+-----------------------------------------------------------------+
| GRANT REPLICATION CLIENT ON *.* TO 'user'@'localhost' |
+-----------------------------------------------------------------+
$
```

## 2. If only you could see what I've seen with your eyes
In order to set up replication, you’ll need to have a database with at least one table and one row in your `primary` `MySQL server` to replicate from.

- Create a `database` named `tyrell_corp` with a `table` named `nexus6` and *add at least one entry to it*.
- Make sure that `user` has `SELECT` permissions on your table.

```sql
CREATE DATABASE IF NOT EXISTS tyrell_corp;
CREATE TABLE IF NOT EXISTS tyrell_corp.nexus6 (
  id INTEGER,
  name VARCHAR(250)
);
INSERT INTO tyrell_corp.nexus6 VALUES (1, 'Neon');
GRANT SELECT ON tyrell_corp.* TO 'user'@'localhost';
```

```shell
$ mysql -u user -p -e "use `tyrell_corp`; select * from nexus6"
Enter password:
+----+-------+
| id | name  |
+----+-------+
|  1 | Neon  |
+----+-------+
$
```

## 3. Quite an experience to live in fear, isn't it?
Before to get started with `primary-replica` synchronization, there is one more thing in place. On `primary MySQL server`, create a `new user` for the `replica server`.

- The `hostname` for the replica user should be set to `%.`
- The replica user must have the appropriate `permissions` to `replicate` your `primary MySQL server`.
- `user` will need `SELECT privileges` on the `mysql.user` table in order to check that the `replica user` was created with the `correct permissions`.

```sql
CREATE USER IF NOT EXISTS 'repl_usr_'@'%' IDENTIFIED BY 'repl_password';
GRANT REPLICATION SLAVE ON *.* TO 'repl_usr'@'%';
GRANT SELECT ON `mysql`.* TO 'user'@'localhost';
FLUSH PRIVILEGES;

```

```shell
$ mysql -u user -p -e 'SELECT user, Repl_slave_priv FROM mysql.user'
+------------------+-----------------+
| user             | Repl_slave_priv |
+------------------+-----------------+
| root             | Y               |
| user             | N               |
| repl_usr         | Y               |
+------------------+-----------------+
$
```


## 4. Setup a Primary-Replica infrastructure using MySQL
Setup `replication` for the MySQL `database` named `tyrell_corp`
- Provide your MySQL `primary` configuration as answer file with the name `4-mysql_configuration_primary`
- Provide your MySQL `replica` configuration as an answer file with the name `4-mysql_configuration_replica`

**Make sure that UFW is allowing connections on port `3306` (default MySQL port) otherwise replication will not work.**

### ON MASTER SERVER

**Configure the following on my.cnf file, then restart the service**
```
## Comment the bind-addres
# bind-address		= 127.0.0.1
server-id		= 1
log_bin			= /var/log/mysql/mysql-bin.log
```

```shell
$ mysql -u user -p
Enter password:
```

```sql
mysql> show master status;
+------------------+----------+--------------------+------------------+
| File             | Position | Binlog_Do_DB       | Binlog_Ignore_DB |
+------------------+----------+--------------------+------------------+
| mysql-bin.000009 |      107 | tyrell_corp        |                  |
+------------------+----------+--------------------+------------------+
1 row in set (0.00 sec)

mysql> exit
```

**Make a sqldump of master databases**
```shell
$ mysqldump -uroot -p -all-databases --master-data > masterdump.sql
```

### ON SLAVE SERVER

**Configure the following on my.cnf file, then restart the service**
```
## Comment the bind-addres
# bind-address		= 127.0.0.1
server-id		= 2
```

```shell
$ mysql -u root -p
Enter password:
```

```sql
mysql> CHANGE MASTER TO
    -> MASTER_HOST='142.27.68.78'
    -> MASTER_USER='repl_usr'
    -> MASTER_PASSWORD='repl_password'
Query OK, 0 rows affected (0.01 sec)

mysql> exit
```

```shell
$ mysql -uroot -p < masterdump.sql
$ mysql -uroot -p
Enter password:
```

```sql
mysql> start slave;
mysql> show slave status\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: 142.27.68.78
                  Master_User: replica
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: mysql-bin.000009
          Read_Master_Log_Pos: 107
               Relay_Log_File: mysql-relay-bin.000022
                Relay_Log_Pos: 253
        Relay_Master_Log_File: mysql-bin.000009
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 107
              Relay_Log_Space: 452
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
1 row in set (0.00 sec)

mysql>
```

`File:` [4-mysql_configuration_primary](4-mysql_configuration_primary), [4-mysql_configuration_replica](4-mysql_configuration_replica)


## 5. MySQL backup
Write a Bash script that generates a `MySQL dump` and creates a compressed archive out of it.

- The MySQL dump must contain all your MySQL databases
- The MySQL dump must be named `backup.sql`
- The MySQL dump file has to be compressed to a `tar.gz` archive
- This archive must have the following name format: `day-month-year.tar.gz`
- The user to connect to the MySQL database must be `root`
- The Bash script accepts `one argument` that is the `password` used to connect to the MySQL database

```shell
$ ls
5-mysql_backup
$ ./5-mysql_backup my_password
backup.sql
$ ls
01-03-2017.tar.gz  5-mysql_backup  backup.sql
$
$ file 01-03-2017.tar.gz
01-03-2017.tar.gz: gzip compressed data, from Unix, last modified: Wed Mar  1 23:38:09 2017
$
```

`File:` [5-mysql_backup](5-mysql_backup)
