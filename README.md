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

<br/>
<br/>

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

<br/>
<br/>

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

**Aura (DHCP Relay):**

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

**Client:**

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

<br/>
<br/>

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

<br/>
<br/>

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

<br/>
<br/>

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

<br/>
<br/>

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

<br/>
<br/>

## Nomor 7

Kepala suku dari Bredt Region memberikan resource server sebagai berikut:

- Lawine, 4GB, 2vCPU, dan 80 GB SSD.
- Linie, 2GB, 2vCPU, dan 50 GB SSD.
- Lugner 1GB, 1vCPU, dan 25 GB SSD.

Aturlah agar Eisen dapat bekerja dengan maksimal, lalu lakukan testing dengan 1000 request dan 100 request/second. Berikut merupakan hasil testingnya:

![2023-11-19 (2)](https://github.com/ddedida/Jarkom-Modul-3-B06-2023/assets/108203648/1060c750-0790-4f6b-a1f7-c965e62546a5)

<br/>
<br/>

## Nomor 8

Karena diminta untuk menuliskan grimoire, buatlah analisis hasil testing dengan 200 request dan 10 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut:

a. Nama Algoritma Load Balancer

b. Report hasil testing pada Apache Benchmark

c. Grafik request per second untuk masing masing algoritma.

d. Analisis

Hasil testing, grafik, dan analisis terdapat di [Grimoire B06](https://docs.google.com/document/d/1UOOTwVwUrWta0TOeqcGNjOTUtFy2QH-yGEG2rMGKP-8/edit).

<br/>
<br/>

## Nomor 9

Dengan menggunakan algoritma Round Robin, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 100 request dengan 10 request/second, kemudian tambahkan grafiknya pada grimoire.

Hasil testing, grafik, dan analisis terdapat di [Grimoire B06](https://docs.google.com/document/d/1UOOTwVwUrWta0TOeqcGNjOTUtFy2QH-yGEG2rMGKP-8/edit).

<br/>
<br/>

## Nomor 10

Selanjutnya coba tambahkan konfigurasi autentikasi di LB dengan dengan kombinasi username: `netics` dan password: `ajkyyy` dengan yyy merupakan kode kelompok. Terakhir simpan file `htpasswd` nya di /etc/nginx/rahasisakita/

**Penyelesaian:**

- Menggunakan script `htpasswd -b -c /etc/nginx/rahasiakita/.htpasswd netics ajkb06` untuk membuat file `htpasswd` dengan username `netics` dan password `ajkb06`.
- Jalankan di node load balancer

![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/825c0c15-a63b-48c3-9cc4-e72cb7bf8eda)

![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/eccd5c42-2a9e-4c1b-a568-2cefd0fe078e)

![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/30641943-8881-4398-a036-5f4da18d714e)

<br/>
<br/>

## Nomor 11

Lalu buat untuk setiap request yang mengandung /its akan di proxy passing menuju halaman https://www.its.ac.id.

**Penyelesaian:**

- Tambahkan script berikut pada file `/etc/nginx/sites-available/default`:

  ```
  location /its {
          proxy_pass https://www.its.ac.id;
  }
  ```

- Jalankan di node load balancer

![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/3b06108b-b9f4-4db4-ad8e-4733544d2ca7)

<br/>
<br/>

## Nomor 12

Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].3.69, [Prefix IP].3.70, [Prefix IP].4.167, dan [Prefix IP].4.168.

- Tambahkan script berikut pada file `/etc/nginx/sites-available/default`:

  ```
  location / {
                allow 192.181.3.69;
                allow 192.181.3.70;
                allow 192.181.4.167;
                allow 192.181.4.170;
                deny all;
                proxy_bind 192.181.2.2;
                proxy_pass http://myweb;
                proxy_set_header    X-Real-IP $remote_addr;
                proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header    Host $http_host;

                auth_basic "Rahasia Kita";
                auth_basic_user_file /etc/nginx/rahasiakita/.htpasswd;
        }
  ```

- Jalankan di node load balancer

![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/15b5c534-e780-4a27-b9e6-94b682056abb)

![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/ad205c07-ea70-4a63-8584-6d2e13f34028)

<br/>
<br/>

## Nomor 13

Semua data yang diperlukan, diatur pada Denken dan harus dapat diakses oleh Frieren, Flamme, dan Fern.

- Install database `apt-get install mariadb-server -y` kemudian jalankan service nya `service mysql start`
- Buat sebuah file `nijika.sql` kemudian isi dengan script berikut

  ```sql
  CREATE USER 'kelompokb06'@'%' IDENTIFIED BY 'passwordb06';
  CREATE USER 'kelompokb06'@'localhost' IDENTIFIED BY 'passwordb06';
  CREATE DATABASE dbkelompokb06;
  GRANT ALL PRIVILEGES ON *.* TO 'kelompokb06'@'%';
  GRANT ALL PRIVILEGES ON *.* TO 'kelompokb06'@'localhost';
  FLUSH PRIVILEGES;
  ```

- Gunakan `mysql < nijika.sql` untuk menjalankan script sql
- Gunakan command `mariadb --host=192.181.2.1 --port=3306 --user=kelompokb06 --password=passwordb06` untuk mengakses database dari node denken

![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/71bc1e6f-32e6-4c36-8490-baa3800a7e55)

<br/>
<br/>

## Nomor 14

Frieren, Flamme, dan Fern memiliki Riegel Channel sesuai dengan quest guide berikut. Jangan lupa melakukan instalasi PHP8.0 dan Composer

- Gunakan Command

  ```sh
  apt-get install mariadb-client -y
  apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2

  curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg

  sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
  ```

- Install php8.0 dan composer dengan command `apt-get install php8.0 php8.0-fpm php8.0-mysql composer -y`

- Install composer

  ```sh
  wget https://getcomposer.org/download/2.0.13/composer.phar
  chmod +x composer.phar
  mv composer.phar /usr/bin/composer
  ```

- Install git `apt-get install git -y`
- Git clone repository dengan command `git clone https://github.com/martuafernando/laravel-praktikum-jarkom.git /var/www/laravel-praktikum-jarkom`
- Kemudian konfigurasi `.env` di dalam repo laravel yang telah di clone
- Masuk kedalam directory repository dan jalankan command berikut
  ```sh
  composer update
  php artisan migrate:fresh
  php artisan db:seed --class=AiringsTableSeeder
  php artisan key:generate
  php artisan jwt:secret
  ```
- Konfigurasi nginx kemudian restart service `service php8.0-fpm start`
  `service nginx restart`

<br/>
<br/>

## Nomor 15, 16, 17

Riegel Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire.
a. POST /auth/register
b. POST /auth/login
c. GET /auth/me

- Buat file `register.json` dengan isi script berikut

  ```json
  {
    "username": "Frieren",
    "password": "12345"
  }
  ```

- Jalankan command berikut untuk melakukan testing pada poin a

  ```sh
  ab -n 100 -c 10 -p register.json -T "application/json" -H "Accept: application/json" -H "Content-Type: application/json" http://channel.b06.com/auth/register
  ```

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/664efd7b-8389-4681-868f-d1ea72abd9e9)

- Jalankan command berikut untuk melakukan testing pada poin b

  ```sh
  ab -n 100 -c 10 -p register.json -T "application/json" -H "Accept: application/json" -H "Content-Type: application/json" http://channel.b06.com/auth/login
  ```

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/8e282ca9-5a06-4fb5-8271-03b287744e1b)

- Jalankan command berikut untuk melakukan testing pada poin c

  ```sh
  ab -n 100 -c 10 -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGFyYXZlbF93b3JrZXIvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MDAxMjQ5MDIsImV4cCI6MTcwMDEyODUwMiwibmJmIjoxNzAwMTI0OTAyLCJqdGkiOiJ4T29rS1A5c3MxWGJrdHBCIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.A9Bhei2kRyahLtUCdNQbMitgxvN62RcXlhaDhRRTyi8" -H "Content-Type: application/json" http://channel.b06.com/api/me
  ```

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/09858db8-953a-4138-ab5a-488c79f41aa7)

Hasil testing terdapat di [Grimoire B06](https://docs.google.com/document/d/1UOOTwVwUrWta0TOeqcGNjOTUtFy2QH-yGEG2rMGKP-8/edit).

<br/>
<br/>

## Nomor 18

Untuk memastikan ketiganya bekerja sama secara adil untuk mengatur Riegel Channel maka implementasikan Proxy Bind pada Eisen untuk mengaitkan IP dari Frieren, Flamme, dan Fern.

- Tambahkan script berikut pada konfigurasi nginx di load balancer

  ```sh
  location / {
    proxy_bind 192.181.2.2;
  }
  ```

<br/>
<br/>

## Nomor 19

- Gunakan script berikut pada `/etc/php/8.0/fpm/pool.d/www.conf` di ketiga worker laravel

  ```sh
  [www]

  user = www-data
  group = www-data

  listen = /run/php/php8.0-fpm.sock

  listen.owner = www-data
  listen.group = www-data

  pm = dynamic
  pm.max_children = 25
  pm.start_servers = 15
  pm.min_spare_servers = 15
  pm.max_spare_servers = 20
  ;pm.process_idle_timeout = 10s;
  ;pm.max_requests = 500
  ;pm.status_path = /status
  ;pm.status_listen = 127.0.0.1:9001
  ;ping.path = /ping
  ;ping.response = pong
  ```

- Ubah isi value dari pm untuk testing hasil dan bandingkan perbedaan nya

Hasil testing, grafik, dan analisis terdapat di [Grimoire B06](https://docs.google.com/document/d/1UOOTwVwUrWta0TOeqcGNjOTUtFy2QH-yGEG2rMGKP-8/edit).

<br/>
<br/>

## Nomor 20

Nampaknya hanya menggunakan PHP-FPM tidak cukup untuk meningkatkan performa dari worker maka implementasikan Least-Conn pada Eisen. Untuk testing kinerja dari worker tersebut dilakukan sebanyak 100 request dengan 10 request/second
