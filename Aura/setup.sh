apt-get update
apt-get install isc-dhcp-relay -y

cp isc-dhcp-relay /etc/default/isc-dhcp-relay
cp sysctl.conf /etc/sysctl.conf

service isc-dhcp-relay start