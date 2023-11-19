apt-get update
apt-get install mariadb-server -y

service mysql start
mysql < nijika.sql

cp my.cnf /etc/mysql/my.cnf

service mysql restart