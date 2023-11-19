# Laporan Resmi Praktikum Modul 3 Jaringan Komputer

Berikut merupakan Laporan Resmi dari Praktikum Modul 3 Jaringan Komputer kelompok B06.

Anggota Kelompok:
| Nama | NRP |
| -------------------------- | ---------- |
| Muhammad Dafian Zakiakhdan | 5025211108 |
| Dewangga Dika Darmawan | 5025211109 |

# Topologi
![image](https://github.com/ddedida/Jarkom-Modul-3-B06-2023/assets/108203648/4ce19332-9716-4178-bdde-b271474bb90b)

# Network Configuration
- **Aura (DHCP Relay)**
  ```
  auto eth0
  iface eth0 inet dhcp
  up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.181.0.0/16
  
  auto eth1
  iface eth1 inet static
	  address 192.181.1.0
	  netmask 255.255.255.0

  auto eth2
  iface eth2 inet static
	  address 192.181.2.0
	  netmask 255.255.255.0

  auto eth3
  iface eth3 inet static
	  address 192.181.3.0
	  netmask 255.255.255.0

  auto eth4
  iface eth4 inet static
	  address 192.181.4.0
	  netmask 255.255.255.0
  ```
- **Himmel (DHCP Server)**
  ```
  auto eth0
  iface eth0 inet static
	  address 192.181.1.1
	  netmask 255.255.255.0
	  gateway 192.181.1.0
	  up echo nameserver 192.168.122.1 > /etc/resolv.conf
  ```
- **Heiter (DNS Server)**
  ```
  auto eth0
  iface eth0 inet static
	  address 192.181.1.2
	  netmask 255.255.255.0
	  gateway 192.181.1.0
	  up echo nameserver 192.168.122.1 > /etc/resolv.conf
  ```
- **Denken (Database Server)**
  ```
  auto eth0
  iface eth0 inet static
	  address 192.181.2.1
	  netmask 255.255.255.0
	  gateway 192.181.2.0
	  up echo nameserver 192.181.1.2 > /etc/resolv.conf
  ```
- **Eisen (Load Balancer)**
  ```
  auto eth0
  iface eth0 inet static
	  address 192.181.2.2
	  netmask 255.255.255.0
	  gateway 192.181.2.0
	  up echo nameserver 192.181.1.2 > /etc/resolv.conf
  ```
- **Frieren (Laravel Worker)**
  ```
  auto eth0
  iface eth0 inet static
	  address 192.181.4.3
	  netmask 255.255.255.0
	  gateway 192.181.4.0
	  up echo nameserver 192.168.122.1 > /etc/resolv.conf
  ```
- **Flamme (Laravel Worker)**
  ```
  auto eth0
  iface eth0 inet static
	  address 192.181.4.2
	  netmask 255.255.255.0
	  gateway 192.181.4.0
	  up echo nameserver 192.168.122.1 > /etc/resolv.conf
  ```
- **Fern (Laravel Worker)**
  ```
  auto eth0
  iface eth0 inet static
	  address 192.181.4.1
	  netmask 255.255.255.0
	  gateway 192.181.4.0
	  up echo nameserver 192.168.122.1 > /etc/resolv.conf
  ```
- **Lawine (PHP Worker)**
  ```
  auto eth0
  iface eth0 inet static
	  address 192.181.3.3
	  netmask 255.255.255.0
	  gateway 192.181.3.0
	  up echo nameserver 192.168.122.1 > /etc/resolv.conf
  ```
- **Linie (PHP Worker)**
  ```
  auto eth0
  iface eth0 inet static
	  address 192.181.3.2
	  netmask 255.255.255.0
	  gateway 192.181.3.0
	  up echo nameserver 192.168.122.1 > /etc/resolv.conf
  ```
- **Ludger (PHP Worker)**
  ```
  auto eth0
  iface eth0 inet static
	  address 192.181.3.1
	  netmask 255.255.255.0
	  gateway 192.181.3.0
	  up echo nameserver 192.168.122.1 > /etc/resolv.conf
  ```
- **Revolt, Ritcher, Sein, Stark (Client)**
  ```
  auto eth0
  iface eth0 inet dhcp
  ```


## Nomor 0 dan 1
Lakukan konfigurasi sesuai dengan peta yang sudah diberikan. Pada soal diminta untuk melakukan register domain berupa `riegel.canyon.b06.com` untuk worker `Laravel` dan `granz.channel.b06.com` untuk worker `PHP` mengarah pada worker yang memiliki IP [prefix IP].x.1.

**Penyelesaian:**
- file `canyon.b06.com`:
  ![image](https://github.com/ddedida/Jarkom-Modul-3-B06-2023/assets/108203648/cc13ff78-9fa6-4c73-91da-da3de96d87be)

- file `channel.b06.com`:
  ![image](https://github.com/ddedida/Jarkom-Modul-3-B06-2023/assets/108203648/4b013572-2772-49aa-99c7-090d07b7cc87)
  
- Testing apakah dns bisa dilakukan ping atau tidak:
  ![image](https://github.com/ddedida/Jarkom-Modul-3-B06-2023/assets/108203648/4f9fbbaa-5c8b-4578-9e4c-4f4a6fd30450)
  ![image](https://github.com/ddedida/Jarkom-Modul-3-B06-2023/assets/108203648/8266851d-362e-485e-9567-3a39ad338806)


## Nomor 2
Semua CLIENT harus menggunakan konfigurasi dari DHCP Server. Dimana client yang melalui Switch3 mendapatkan range IP dari `192.181.3.16 - 192.181.3.32` dan `192.181.3.64 - 192.181.3.80`.

**Penyelesaian:**
**Himmel (DHCP Server)**:
- file `dhcpd.conf`:
  ```
  option domain-name "example.org";
  option domain-name-servers ns1.example.org, ns2.example.org;

  default-lease-time 600;
  max-lease-time 7200;

  ddns-update-style none;

  # HEHE

  subnet 192.181.1.0 netmask 255.255.255.0 {
  }

  subnet 192.181.2.0 netmask 255.255.255.0 {
  }

  subnet 192.181.3.0 netmask 255.255.255.0 {
      range 192.181.3.16 192.181.3.32;
      range 192.181.3.64 192.181.3.80;
      option routers 192.181.3.0;
      option broadcast-address 192.181.3.255;
      option domain-name-servers 192.181.1.2;
      default-lease-time 180;
      max-lease-time 5760;
  }

  subnet 192.181.4.0 netmask 255.255.255.0 {
      range 192.181.4.12 192.181.4.20;
      range 192.181.4.160 192.181.4.168;
      option routers 192.181.4.0;
      option broadcast-address 192.181.4.255;
      option domain-name-servers 192.181.1.2;
      default-lease-time 720;
      max-lease-time 5760;
  }

  host Fern {
      hardware ethernet 3e:32:5f:21:6f:5a;
      fixed-address 192.181.4.1;
  }

  host Flamme {
      hardware ethernet 6e:73:cc:06:71:1e;
      fixed-address 192.181.4.2;
  }

  host Frieren {
      hardware ethernet 0e:9c:80:84:ad:8f;
      fixed-address 192.181.4.3;
  }

  host Lugner {
      hardware ethernet 5e:60:3a:52:5d:72;
      fixed-address 192.181.3.1;
  }

  host Linie {
      hardware ethernet 6a:21:86:87:16:fc;
      fixed-address 192.181.3.2;
  }
  
  host Lawine {
      hardware ethernet 52:f9:53:22:2b:c4;
      fixed-address 192.181.3.3;
  }
  ```
- file `isc-dhcp-server`:
  ```
  INTERFACESv4="eth0"
  ```

**Aura (DHCP Relay)**
- install untuk DHCP Relay:
  ```
  apt-get update
  apt-get install isc-dhcp-relay -y
  ```
- file `/etc/default/isc-dhcp-relay`:
  ```
  SERVERS="192.181.1.1"
  INTERFACES="eth1 eth2 eth3 eth4"
  OPTIONS=
  ```
- file `/etc/sysctl.conf`:
  ```
  net.ipv4.ip_forward=1
  ```

**Client**
- file `interfaces`:
  ```
  auto eth0
  iface eth0 inet dhcp
  ```

**Hasil:**
Testing IP
- Sebelum:
  ![image](https://github.com/ddedida/Jarkom-Modul-3-B06-2023/assets/108203648/3d10bb6c-1773-4504-b1a3-2a8c0d6274b4)
  
- Sesudah:
  ![image](https://github.com/ddedida/Jarkom-Modul-3-B06-2023/assets/108203648/c4b852cb-8b54-4c69-b752-bdb734b6efd1)


## Nomor 3
Client yang melalui Switch4 mendapatkan range IP dari `192.181.4.12 - 191.181.4.20` dan `192.181.4.160 - 192.181.4.168`.

**Penyelesaian:**
Dalam file `dhcpd.conf`:
```
  subnet 192.181.4.0 netmask 255.255.255.0 {
  range 192.181.4.12 192.181.4.20;
  range 192.181.4.160 192.181.4.168;
  option routers 192.181.4.0;
  option broadcast-address 192.181.4.255;
  option domain-name-servers 192.181.1.2;
  default-lease-time 720;
  max-lease-time 5760;
}
```


## Nomor 4
Client mendapatkan DNS dari Heiter dan dapat terhubung dengan internet melalui DNS tersebut.

**Penyelesaian:**
Dalam file `dhcpd.conf`:
```
subnet 192.181.3.0 netmask 255.255.255.0 {
  ...
  option routers 192.181.3.0;
  option broadcast-address 192.181.3.255;
  option domain-name-servers 192.181.1.2;
  ...
}

subnet 192.181.4.0 netmask 255.255.255.0 {
  ...
  option routers 192.181.4.0;
  option broadcast-address 192.181.4.255;
  option domain-name-servers 192.181.1.2;
  ...
}
```


## Nomor 5
Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch3 selama 3 menit sedangkan pada client yang melalui Switch4 selama 12 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 96 menit (5)

**Penyelesaian:**
Dalam file `dhcpd.conf`:
```
subnet 192.181.3.0 netmask 255.255.255.0 {
  ...
  default-lease-time 720;
  max-lease-time 5760
}

subnet 192.181.4.0 netmask 255.255.255.0 {
  ...
  default-lease-time 720;
  max-lease-time 5760
}
```


## Nomor 6
Pada masing-masing worker PHP, lakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3.

**Penyelesaian:**
- Lakukan script dibawah ini:
  ```
  apt-get update
  apt-get install nginx php php-fpm -y
  apt-get install wget
  apt-get install unzip
  apt-get install lynx -y

  wget -O php-granz-channel.zip "https://drive.google.com/uc?export=download&id=1ViSkRq7SmwZ$unzip php-granz-channel.zip
  rm -r php-granz-channel.zip
  mkdir /var/www/granz.channel.b06
  ```
- Kemudian buat file `granz.channle.b06`:
  ```
  server {
        listen 80;
        root /var/www/granz.channel.b06;
        index index.php index.html index.htm;
        server_name _;
        location / {
                        try_files $uri $uri/ /index.php?$query_string;
        }
        # pass PHP scripts to FastCGI server
        location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
        }
  
 	location ~ /\.ht {
                        deny all;
        }
        error_log /var/log/nginx/granz.channel.b06_error.log;
        access_log /var/log/nginx/granz.channel.b06_access.log;
  }
  ```
- Lakukan `service nginx restart` dan coba lakukan `lynx localhost` maka hasilnya:
  ![image](https://github.com/ddedida/Jarkom-Modul-3-B06-2023/assets/108203648/9e191de7-13da-4b59-9e38-e6d0f0854063)
