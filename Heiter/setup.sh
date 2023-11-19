apt-get update

apt-get install bind9 -y

mkdir /etc/bind/jarkom

cp named.conf.local /etc/bind

cp named.conf.options /etc/bind

cp canyon.b06.com /etc/bind/jarkom

cp channel.b06.com /etc/bind/jarkom

service bind9 restart