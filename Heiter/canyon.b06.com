;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     canyon.b06.com. root.canyon.b06.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      canyon.b06.com.
@       IN      A       192.181.1.2
@       IN      AAAA    ::1
riegel  IN      A       192.181.2.2
www     IN      CNAME   canyon.b06.com.