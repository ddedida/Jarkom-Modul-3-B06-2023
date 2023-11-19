apt-get update

apt install isc-dhcp-server -y

cp dhcpd.conf /etc/dhcp/dhcpd.conf

cp isc-dhcp-server /etc/default/isc-dhcp-server

service isc-dhcp-server restart