upstream mynode {
        server 192.181.4.1:8001;
        server 192.181.4.2:8002;
        server 192.181.4.3:8003;
}

#upstream mynode {
#       ip_hash;
#       server 192.181.4.1;
#       server 192.181.4.2;
#       server 192.181.4.3;
#}

#upstream mynode {
#    least_conn;
#    server 192.181.4.1;
#    server 192.181.4.2;
#    server 192.181.4.3;
#}

#upstream mynode {
#       hash $request_uri consistent;
#       server 192.181.4.1;
#       server 192.181.4.2;
#       server 192.181.4.3;
#}

server {
        listen 80;
        server_name riegel.canyon.b06.com;

        location / {
                allow 192.181.3.69;
                allow 192.181.3.70;
                allow 192.181.4.167;
                allow 192.181.4.170;
#               allow 192.181.4.12;
                deny all;
                proxy_bind 192.181.2.2;
                proxy_pass http://mynode;
                proxy_set_header    X-Real-IP $remote_addr;
                proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header    Host $http_host;

#               auth_basic "Rahasia Kita";
#               auth_basic_user_file /etc/nginx/rahasiakita/.htpasswd;
        }

        location ~ /its {
                proxy_pass https://www.its.ac.id;
                proxy_set_header Host www.its.ac.id;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
        }

        error_log /var/log/nginx/lb_error.log;
        access_log /var/log/nginx/lb_access.log;
}