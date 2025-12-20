# Launch Linux ec2 in aws in same vpc ,private subnet and security group
# launch another ec2 in same vpc with public subnet and connect another ec2 thouch SSH
# install mysql 
```bash
sudo apt install mysql-server -y
Restart server

```
reboot server
```
sudo reboot
```
Verify mysql status
```
sudo systemctl status mysql
```
mysql setup
```
sudo mysql_secure_installation
```
# to root user (password will null)
```
mysql -u root -p
```
# DB user (reccomand option 2)
option 1 
you can use root user but you have to set up as authenticate with password not with auth socket
```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'YourNewPassword';
FLUSH PRIVILEGES;
```
grant remote permission
```
CREATE USER 'root'@'%' IDENTIFIED BY 'YourNewPassword';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;
```

option2 : 
create new user
```
CREATE USER 'admin'@'%' IDENTIFIED BY 'StrongPassword123';
```
grant full permission to user
```
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```
# Allow remote connections from any ip
```
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```
Find this line:
```
bind-address = 127.0.0.1
```
Change it to:
```
bind-address = 0.0.0.0
```
# restart mysql
```
sudo systemctl restart mysql
```
# allow port 3306 (firewall) from server
```
sudo ufw allow 3306
```
# use created user
```
 mysql -u <user> -p
```
create database with shopping name
```
create database shopping;
```
```
exit
```
# download Eyewear/db/shopping.sql file fron in this repo
```
sudo mysql
```
import shopping.sql to created all table inside shopping db
```
 mysql -u <user> -p shopping < /home/ubuntu/shopping.sql
```
# db setup complete 
to verify , run coomand
```
 mysql -u <user> -p
```
```
use shopping;
```
```
show tables;
```
# if admin_master and other table showing then you have completed db setup











