#Launch Linux ec2 in aws in same vpc ,private subnet and security group
launch another ec2 in same vpc with public subnet and connect another ec2 thouch SSH
install mysql 
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
# DB user 
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
Allow remote connections from any ip
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
option2




